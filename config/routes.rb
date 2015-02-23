Madeleines::Application.routes.draw do
  get '' => 'home#index'
  get 'bake' => 'home#index'
  get 'howto' => 'home#index', :as => :howto
  get 'settings' => 'home#index', :as => :settings

  namespace :api do
    namespace :v1 do
      post 'login' => 'sessions#create'
      post 'logout' => 'sessions#destroy'

      get 'bite' => 'remembrances#bite'
      post 'drop' => 'remembrances#drop'
      post 'pick-up' => 'remembrances#pick_up'
      post 'bake' => 'remembrances#bake'

      get 'settings' => 'settings#index'
      put 'settings' => 'settings#update'
    end
  end

  get '*path' => 'home#four_oh_four'
end
