$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongodb_fulltext_search/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongodb_fulltext_search"
  s.version     = MongodbFulltextSearch::VERSION
  s.authors     = ["Christopher Fuller"]
  s.email       = ["git@chrisfuller.me"]
  s.homepage    = "http://github.com/chrisfuller/mongodb_fulltext_search"
  s.summary     = "Adds fulltext search capability to Mongoid or MongoMapper documents.\nThe MongoDB aggregation framework is utilized to perform searches quickly and efficiently."
  s.description = "Adds fulltext search capability to Mongoid or MongoMapper documents.\nThe MongoDB aggregation framework is utilized to perform searches quickly and efficiently."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1"
end
