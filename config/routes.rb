Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  # localhost:3000/posts
  # ルーティング、コントロールのメソッド名、ビューのファイル名は一致させる
  # 自動でURLを生成してくれる たとえばeditの場合はhttp://127.0.0.1:3000/posts/1/edit(posts/:id/edit)
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
