Rails.application.routes.draw do
  post '/alexa', to: 'alexa#new'
  get '/', to: 'home#index'
end
