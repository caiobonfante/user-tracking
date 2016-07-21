Rails.application.routes.draw do
  get 'accesses/index'

  get 'accesses/show'

  get 'accesses/create'

  get 'contacts/index'

  get 'contacts/create'

  get 'contacts/show'

  get 'contacts' => 'contacts#index', 
    as: 'all_contacts'

  get 'contacts/:email' => 'contacts#show', 
    as: 'contact' ,
    :constraints => { :email => /.+@.+\..*/ }

  root :to => redirect('/contacts')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
