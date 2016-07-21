Rails.application.routes.draw do
  get 'accesses/index'

  get 'accesses/show'

  get 'accesses/create'

  get 'accesses' => 'accesses#index',
    as: 'all_accesses'

  get 'accesses/:id' => 'accesses#show',
    as: 'access'

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
