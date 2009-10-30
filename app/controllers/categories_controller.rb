class CategoriesController < ApplicationController
  
  def index
    @categories = Category.find(:all)
    @page_title = 'Listing categories'
  end
  
  def new
    @category = Category.new
    @page_title = 'New category'
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "The category '#{@category.description}' has been added"
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @page_title = "Showing category '#{@category.description}'"
  end
  
  def edit
    @category = Category.find(params[:id])
    @page_title = "Editing category '#{@category.description}'"
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "The category has been updated"
      redirect_to category_path(@category)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    flash[:notice] = "The category '#{@category.description}' has been removed."
    @category.destroy
    redirect_to :action => 'index'
  end
  
end
