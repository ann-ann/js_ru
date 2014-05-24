JsRu::Application.routes.draw do
  resources :tags

  resources :questions do
    get :solve, on: :member
    resources :answers
  end

  resources :tags do
    get  :subscribe, on: :member
    member do
      post :create
    end
  end

  resources :users

  root 'questions#index'

end
