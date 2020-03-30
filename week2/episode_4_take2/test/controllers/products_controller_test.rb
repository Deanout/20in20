require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { available: @product.available, catering: @product.catering, dairy_free: @product.dairy_free, description: @product.description, featured: @product.featured, gluten_free: @product.gluten_free, kosher: @product.kosher, name: @product.name, peanut_free: @product.peanut_free, price: @product.price, vegan: @product.vegan, vegetarian: @product.vegetarian } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { available: @product.available, catering: @product.catering, dairy_free: @product.dairy_free, description: @product.description, featured: @product.featured, gluten_free: @product.gluten_free, kosher: @product.kosher, name: @product.name, peanut_free: @product.peanut_free, price: @product.price, vegan: @product.vegan, vegetarian: @product.vegetarian } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
