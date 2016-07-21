class AccessesController < ApplicationController
  def index
    @accesses = Access.all
  end

  def create
    @access = Access.create(params.require(:access).permit([:user, :url, :date]))
    if @access
      flash[:success] = "Contato criado!"
      redirect_to root_path
    end
  end

  def show
    @access = Access.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @access }
      format.xml { render xml: @access }
    end
  end

end
