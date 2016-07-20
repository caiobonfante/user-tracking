class ContactsController < ApplicationController
  def index
  end

  def create
    @contact = Contact.create(params.require(:contact).permit([:email, :user]))
    @contact.save
  end

  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @contact }
      format.xml { render xml: @contact }
  end
end

