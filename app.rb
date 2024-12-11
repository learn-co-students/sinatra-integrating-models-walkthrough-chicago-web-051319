require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    user_text = params[:user_text]
    @analyzed_text = TextAnalyzer.new(user_text)
    most_used_letter_hash =  @analyzed_text.most_used_letter
    @most_used_letter_str = most_used_letter_hash.keys[0]
    @most_used_letter_count = most_used_letter_hash[@most_used_letter_str]
    erb :results
  end
end
