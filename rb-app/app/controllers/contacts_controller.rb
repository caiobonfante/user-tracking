class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    
    @contact.save
  end

  private
    def contact_params
      params.require(:contact).permit(:user, :email)
    end  
end
