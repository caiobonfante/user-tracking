class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def create
    Contact.create(params.require(:contact).permit([:email, :user]))
    redirect_to all_contacts_path
  end

  def show
    @contact = Contact.find_by_email(params[:email])
    @contact_accesses = Access.where(user: @contact.user)

    respond_to do |format|
      format.html 
      format.json { render json: @contact }
      format.xml { render xml: @contact }
    end
  end

  def destroy
    Contact.where(email: params[:email]).destroy_all
    redirect_to (:back)
  end
end

