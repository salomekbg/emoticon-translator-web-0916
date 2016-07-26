require "yaml"
# require modules here

def load_library(path)
  library = YAML.load_file(path)
  final = {'get_meaning' => {}, 'get_emoticon' => {}}
  library.each do |meaning, emoticons|
    final['get_meaning'][emoticons[1]] = meaning
    final['get_emoticon'][emoticons[0]] = emoticons[1]
  end
  final
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library['get_emoticon'].keys.include?(emoticon)
    library['get_emoticon'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library['get_meaning'].keys.include?(emoticon)
    library['get_meaning'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
