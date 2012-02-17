require 'mongodb_fulltext_search/helpers'

module MongodbFulltextSearch
  extend MongodbFulltextSearch::Helpers
end

require 'mongodb_fulltext_search/mixins'

if MongodbFulltextSearch.mongoid?
  Mongoid.const_set :FullTextSearch, MongodbFulltextSearch::Mixins
elsif MongodbFulltextSearch.mongomapper?
  MongoMapper.const_set :FullTextSearch, MongodbFulltextSearch::Mixins
end
