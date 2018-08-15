Rails.application.routes.draw do

  root :to => "english_words_controller#index"

  get '/search/:word', to: 'english_words_controller#search'
end
