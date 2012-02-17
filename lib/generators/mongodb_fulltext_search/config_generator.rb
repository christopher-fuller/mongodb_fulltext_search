module MongodbFulltextSearch::Generators
  class ConfigGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc 'Creates a MongodbFulltextSearch configuration file at config/fulltext_search.yml'
    def create_config_file
      template 'fulltext_search.yml', File.join('config', 'fulltext_search.yml')
    end
  end
end
