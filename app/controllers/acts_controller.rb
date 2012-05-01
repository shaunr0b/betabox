class ActsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Act.all
  end
  
  def show
    respond_with Act.find(params[:id])
  end
  
  def create
    respond_with Act.create(params[:Act])
  end
  
  def update
    respond_with Act.update(params[:id], params[:act])
  end
  
  def destroy
    respond_with Act.destroy(params[:id])
  end
end
