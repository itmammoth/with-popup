Dummy::Application.routes.draw do
  root to: 'top#index'

  controller :top do
    post :submit, action: :submit
    get :done, action: :done
    get :reloaded, action: :reloaded
  end
end
