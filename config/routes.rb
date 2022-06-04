Rails.application.routes.draw do
  get '*slug', to: 'links#show'
end
