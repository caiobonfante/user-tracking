class AccessesController < ApplicationController
  def index
    @accesses = Access.all
  end

  def create
    Access.create(params.require(:access).permit([:user, :url, :date]))
    redirect_to all_accesses_path
  end

  def show
    @access = Access.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @access }
      format.xml { render xml: @access }
    end
  end

  def destroy
    Access.destroy(params[:id])
    redirect_to (:back)
  end

end
