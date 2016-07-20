Rails.application.routes.draw do
  get 'contacts/index'

  get 'contacts/create'

  get 'contacts/show'

  get 'contacts/all' => 'contacts#index', as: 'all_contacts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
