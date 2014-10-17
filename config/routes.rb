Madeleines::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'bite' => 'remembrances#bite'
      post 'drop' => 'remembrances#drop'
      post 'bake' => 'remembrances#bake'
    end
  end
end
