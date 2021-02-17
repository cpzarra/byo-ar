Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dragons, only: [:index, :show, :create, :update]
  resource :dragons, only: [] do
    get 'search/name' => 'dragons#search'
  end
end
