PhotoAlbum::Application.routes.draw do
  resources :albums do
    resources :photos, :only => [:index, :new, :create] do
      post 'widget_upload', on: :collection
    end
  end

  

  root :to => 'albums#index'
end
