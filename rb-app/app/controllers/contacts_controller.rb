class ContactsController < ApplicationController
  def index
  end

  def create
    @contact = Contact.create(params.require(:contact).permit([:email, :user]))
    if @contact.save
      flash[:success] = "Contato criado!"
      redirect_to root_path
    end

  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @contact }
      format.xml { render xml: @contact }
    end
end

