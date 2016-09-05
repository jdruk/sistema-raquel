Rails.application.routes.draw do

    get 'payments/geral' => 'payments#geral', as: :geral_payment
    get 'dashboard/index'
    root 'dashboard#index'

    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

    resources :checks
    # Nested resources
    resources :clients do
        resources :payments
    end

    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
end
