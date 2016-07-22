class ContactsController < ApplicationController

  before_action :get_contact, only: [:show, :destroy]
  protect_from_forgery except: :create

  def get_contact
    @contact = Contact.find_by_email(params[:email])
  end

  def index
    @contacts = Contact.all
  end

  def create
    Contact.create(params.require(:contact).permit([:email, :user]))
    respond_with(@contact, status: 201)
    redirect_to all_contacts_path
  end

  def show
    @contact_accesses = Access.where(user: @contact.user)
  end

  def destroy
    @contact.destroy
    redirect_to all_contacts_path
  end
end

