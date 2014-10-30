Madeleines::Application.routes.draw do
  get '/' => 'home#index'
  get '/bake' => 'home#index'

  namespace :api do
    namespace :v1 do
      post 'login' => 'sessions#create'
      post 'logout' => 'sessions#destroy'

      get 'bite' => 'remembrances#bite'
      post 'drop' => 'remembrances#drop'
      post 'pick-up' => 'remembrances#pick_up'
      post 'bake' => 'remembrances#bake'
    end
  end

  get '*path' => 'home#four_oh_four'
end
