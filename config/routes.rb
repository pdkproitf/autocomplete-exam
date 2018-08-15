Rails.application.routes.draw do

  root 'english_words_controller#search'
  # get '/search/:word' => 'english_words_controller#search', :as => :root

end
