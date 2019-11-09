Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'

  Spree::Core::Engine.routes.draw do
    namespace :admin do
      post 'products/import_csv' => 'products#import_csv'
      get 'products/import' => 'products#import'
    end
  end
end
