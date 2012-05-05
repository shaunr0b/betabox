class ProductGroupsController < ApplicationController
  respond_to :json
  
  def index
    @product_groups = ProductGroup.order('name').all
    respond_with @product_groups
  end
  
  def show
    @product_group = ProductGroup.find(params[:id])
    respond_with @product_group
  end
  
  def create
    respond_with ProductGroup.create(params[:product_group])
  end
  
  def update
    respond_with ProductGroup.update(params[:id], params[:product_group])
  end
  
  def destroy
    respond_with ProductGroup.destroy(params[:id])
  end
end
