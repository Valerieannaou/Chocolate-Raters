require 'test_helper'

class ChocolatiersControllerTest < ActionController::TestCase
  setup do
    @chocolatier = chocolatiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chocolatiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chocolatier" do
    assert_difference('Chocolatier.count') do
      post :create, chocolatier: { address: @chocolatier.address, chocolatier_type: @chocolatier.chocolatier_type, chocolatier_url: @chocolatier.chocolatier_url, city: @chocolatier.city, country_code: @chocolatier.country_code, email: @chocolatier.email, name: @chocolatier.name, phone: @chocolatier.phone, state_code: @chocolatier.state_code, zip_code: @chocolatier.zip_code }
    end

    assert_redirected_to chocolatier_path(assigns(:chocolatier))
  end

  test "should show chocolatier" do
    get :show, id: @chocolatier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chocolatier
    assert_response :success
  end

  test "should update chocolatier" do
    put :update, id: @chocolatier, chocolatier: { address: @chocolatier.address, chocolatier_type: @chocolatier.chocolatier_type, chocolatier_url: @chocolatier.chocolatier_url, city: @chocolatier.city, country_code: @chocolatier.country_code, email: @chocolatier.email, name: @chocolatier.name, phone: @chocolatier.phone, state_code: @chocolatier.state_code, zip_code: @chocolatier.zip_code }
    assert_redirected_to chocolatier_path(assigns(:chocolatier))
  end

  test "should destroy chocolatier" do
    assert_difference('Chocolatier.count', -1) do
      delete :destroy, id: @chocolatier
    end

    assert_redirected_to chocolatiers_path
  end
end
