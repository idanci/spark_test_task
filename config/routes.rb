Rails.application.routes.draw do
  require 'sidekiq/web'

  authenticate :spree_user, lambda { |user| user.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  mount Spree::Core::Engine, at: '/'

  Spree::Core::Engine.routes.draw do
    namespace :admin do
      post 'products/import_csv' => 'products#import_csv'
      get 'products/import' => 'products#import'
    end
  end
end
