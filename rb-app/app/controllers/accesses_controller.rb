class AccessesController < ApplicationController
 
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    @accesses = Access.all
  end

  def create
    Access.create(params[:access])
    respond_with(status: 200)
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
    redirect_to all_accesses_path
  end

 def json_request? request.format.json?
 end

end
