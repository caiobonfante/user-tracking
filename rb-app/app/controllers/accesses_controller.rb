class AccessesController < ApplicationController
 
  protect_from_forgery except: :create

  def index
    @accesses = Access.all
  end

  def create
    Access.create(params.require(:access).permit([:user, :url, :date]))
    redirect_to all_accesses_path
  end

  def show
    @access = Access.find(params[:id])
  end

  def destroy
    Access.destroy(params[:id])
    redirect_to (:back)
  end
 
end
