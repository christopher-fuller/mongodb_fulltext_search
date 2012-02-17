module MongodbFulltextSearch::Helpers
  
  def words_for(text)
    words = []
    if text.is_a? String
      text.downcase.gsub(/[^a-z0-9\s]/, '').split(/\s/).each do |word|
        words << word unless word.blank? or stop_words.include? word
      end
    end
    words
  end
  
  def mongoid?
    if @mongoid.nil?
      @mongoid = Object.const_defined?('Mongoid')
    end
    @mongoid
  end
  
  def mongomapper?
    if @mongomapper.nil?
      @mongomapper = Object.const_defined?('MongoMapper')
    end
    @mongomapper
  end
  
  private
  
  def stop_words
    if @stop_words.nil?
      file = "#{Rails.root}/config/fulltext_search.yml"
      config = YAML.load(ERB.new(File.read(file)).result) if File.exists? file
      if not config.nil? and config.include? 'stop_words'
        @stop_words = config['stop_words'].gsub(/\s/, '').split ','
      else
        @stop_words = []
      end
    end
    @stop_words
  end
  
end
