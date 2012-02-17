require 'mongodb_fulltext_search/mongodb_fulltext_search'

module MongodbFulltextSearch
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/mongodb_fulltext_search_tasks.rake'
    end
  end
end
