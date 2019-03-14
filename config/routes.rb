Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: 'questions#import'

  namespace 'questions' do
    get 'import'
    post 'import'
  end

  namespace 'api' do
    namespace 'v1' do
      resources :questions
      resources :roles, only: :index
      resources :mappings, only: :index
    end
  end
end
