class ScaffoldController < ApplicationController
  def index
    
    if params[:seg1].nil? 
      @subgroups = ProductGroup.roots
      
    elsif params[:seg2].nil?
      @group = ProductGroup.find(params[:seg1])
      @products = @group.products
      @subgroups = @group.children
      
    elsif params[:seg3].nil?
      @group = ProductGroup.find(params[:seg2])
      @products = @group.products
      @subgroups = @group.children
    
    else
      @group = ProductGroup.find(params[:seg3])
      @products = @group.products
      @subgroups = @group.children
    
    end
    
  end
  
end
