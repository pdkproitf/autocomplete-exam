class EnglishWordsControllerController < ApplicationController
  def index
  end

  def search
    data = params['word'].nil? ? {} : EnglishWord.search_by_word(params['word']).select('id, word').limit(10)
    render json: { data: data }
  end
end
