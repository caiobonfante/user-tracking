Rails.application.routes.draw do

  get 'accesses' => 'accesses#index',
    as: 'all_accesses'

  get 'accesses/:id' => 'accesses#show',
    as: 'access'

  delete 'accesses/:id' => 'accesses#destroy'
 
  post 'accesses/' => 'accesses#create'

  get 'contacts' => 'contacts#index', 
    as: 'all_contacts'

  get 'contacts/:email' => 'contacts#show', 
    :constraints => { :email => /.+@.+\..*/ },
    as: 'contact'

  delete 'contacts/:email' => 'contacts#destroy',
    :constraints => { :email => /.+@.+\..*/ }

  post 'contacts' => 'contacts#create'

  root :to => redirect('/contacts')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
