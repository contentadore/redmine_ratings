resources :rate_ratings do
  post 'mass_create', on: :collection
  put 'mass_update', on: :collection
end

resources :languages do
end

resources :currencies do
end

resources :rating_types do
end

resources :unit_types do
end

resources :rates, only: [:destroy] do
end
