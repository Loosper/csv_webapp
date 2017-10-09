Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/sums/' => 'sum#show'
  post '/sums/', to: 'sum#create'
  post '/filters/', to: 'filter#create'
  post '/intervals', to: 'interval#create'
  post '/lin_regressions/', to: 'lin_regression#create'
end
