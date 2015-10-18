Dummy::Application.routes.draw do
  root to: 'top#index'

  resources :posts, only: %i(new create) do
    collection do
      get :done, action: :done
      get :reload, action: :reload
    end
  end
end
