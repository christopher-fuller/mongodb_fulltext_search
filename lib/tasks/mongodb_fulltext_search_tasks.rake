namespace :db do
  namespace :mongo do
    desc "Rebuild the fulltext search indexes"
    task :rebuild_fulltext_search_indexes, [:model] => [:environment] do |t, args|
      args.with_defaults(:model => false)
      models = []; Dir[Rails.root.to_s + '/app/models/**/*.rb'].each do |path|
        model_name = File.basename(path, '.rb').camelize
        begin
          model_class = model_name.constantize
          if model_class.respond_to? :fulltext_search_options
            models << model_name if model_class.send(:fulltext_search_options).is_a? Hash
          end
        rescue
        end
      end
      error = false
      if args.model
        if models.include? args.model
          models = [args.model]
        else
          models = []
          puts "[Aborted] Unable to load model '#{args.model}'"
          error = true
        end
      end
      if models.empty?
        unless error
          puts "[Aborted] Unable to locate any models with fulltext search implemented"
        end
      else
        models.each do |model_name|
          puts "Recreating fulltext search index for model '#{model_name}' ..."
          model_class = model_name.constantize
          model_class.fulltext_search_options.keys.each do |collection_name|
            MongodbFulltextSearch.mongo_session(model_class)[collection_name.to_s].drop
          end
          model_class.all.each do |model|
            model.send :update_in_fulltext_search_indexes
          end
        end
        puts "Operation completed"
      end
    end
  end
end
