Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :home, only: %i[index]

  # ADICIONAR ROTA PARA SHOW
  resources :power_generators, only: %i[index show]
  resources :freights
end
