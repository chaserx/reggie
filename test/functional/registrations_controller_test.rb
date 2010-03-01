require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Registration.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Registration.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Registration.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to registration_url(assigns(:registration))
  end
  
  def test_edit
    get :edit, :id => Registration.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Registration.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Registration.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Registration.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Registration.first
    assert_redirected_to registration_url(assigns(:registration))
  end
  
  def test_destroy
    registration = Registration.first
    delete :destroy, :id => registration
    assert_redirected_to registrations_url
    assert !Registration.exists?(registration.id)
  end
end
