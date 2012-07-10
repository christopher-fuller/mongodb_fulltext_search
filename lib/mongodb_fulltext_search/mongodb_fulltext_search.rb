require 'mongodb_fulltext_search/helpers'
require 'mongodb_fulltext_search/mixins'

module MongodbFulltextSearch
  extend MongodbFulltextSearch::Helpers
end

if MongodbFulltextSearch.mongoid?
  Mongoid.const_set :FullTextSearch, MongodbFulltextSearch::Mixins
elsif MongodbFulltextSearch.mongomapper?
  MongoMapper.const_set :FullTextSearch, MongodbFulltextSearch::Mixins
end
