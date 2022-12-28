Rails.application.routes.draw do
  get "*slug", to: "links#show"
  root to: "links#show" # handle empty slug
end
