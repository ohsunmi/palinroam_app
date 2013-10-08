PalinroamApp::Application.routes.draw do

  get '/', to: 'palindromes#index'
  get '/scrape', to: 'palindromes#scrape'

end
