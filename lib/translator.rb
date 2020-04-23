# require modules here
require 'pry'
require "yaml"
def load_library(url)
  library = YAML.load_file(url)
  pretty_lib = library.reduce({}) do |memo, (word, emoticons)|
    if !memo[word]
      memo[word] = {}
    end
    memo[word] = {
      english: emoticons[0], 
      japanese: emoticons[1]
    }
    memo
  end
  pretty_lib
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  library.each_pair do |(word, symbols)|
    if library.include?(emoticon) == false
      p "Sorry, I don't know that one."
    end
    if symbols[:english] == emoticon
      translation = symbols[:japanese]
      translation
    end
  end
  translation
end

def get_english_meaning
  # code goes here
end