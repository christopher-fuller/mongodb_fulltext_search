module MongodbFulltextSearch::Helpers
  
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'but', 'by', 'for', 'if', 'in', 'into', 'is', 'it', 'no', 'not', 'of', 'on', 'or', 'such', 'that', 'the', 'their', 'then', 'there', 'these', 'they', 'this', 'to', 'was', 'will', 'with']
  
  def words_for(text)
    words = []
    if text.is_a? String
      text.downcase.gsub(/[^a-z0-9\s]/, '').split(/\s/).each do |word|
        words << word unless word.blank? or STOP_WORDS.include? word
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
  
end
