Rails.application.routes.draw do
  resources :notebooks
  resources :posts
  devise_for :users, controllers: { registrations: "registrations" }

	authenticated :user do
	  root to: 'posts#index', as: :authenticated_root
	end
  
	devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  resource :two_factor_settings, except: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
