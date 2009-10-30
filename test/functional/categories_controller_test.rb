require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def test_index
    get :index
    assert_response :success
    assert_template 'index'
    
    categories = Category.find(:all)
    categories.each do |category|
      assert_select 'table#index_item_list td', :content => category.description
    end
  end
  
  def test_new
    get :new
    assert_response :success
    assert_template 'new'
    
    assert_select 'form input', :count => 2
    assert_select 'input', :type => 'submit', :value => 'Create'
  end
  
  def test_create
    post :create, :category => {:description => 'Somewhere'}
    assert_response :redirect
    assert_redirected_to :action => :index
  end
  
  def test_failing_create
    post :create, :category => {}
    
    category = assigns(:category)
    assert_equal false, category.valid?
    assert_equal 1, category.errors.size
    assert category.errors.on(:description)
  end
  
  def test_show
    get :show, :id => 1
    assert_response :success
    assert_template 'show'
    
    category = assigns(:category)
    assert_not_nil category
    assert category.valid?
  end
  
  def test_edit
    get :edit, :id => 3
    assert_response :success
    assert_template 'edit'
    
    category = assigns(:category)
    assert_not_nil category
    assert category.valid?
    assert_select 'input', :type => 'submit', :value => 'Update'
    assert_select 'input', :content => category.description
  end
  
  def test_update
    category_id = 2
    post :update, :id => category_id, :category => {:description => 'Updating some category'}
    assert_response :redirect
    assert_redirected_to category_path(Category.find(category_id))
    
    assert_equal 'Updating some category', Category.find(category_id).description
  end
  
  def test_destroy
    category_id = 4
    assert_not_nil Category.find(category_id)
    
    post :destroy, :id => category_id
    assert_response :redirect
    assert_redirected_to :action => 'list'
    
    assert_raise(ActiveRecord::RecordNotFound) {
      Category.find(category_id)
    }
  end
  
end
