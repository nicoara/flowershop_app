require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
  	@order_delivered_1 = create(:order, is_delivered: true)
  	@order_delivered_2 = create(:order, is_delivered: true)
  	@order_pending_1 = create(:order, is_delivered: false)
  	@order_pending_2 = create(:order, is_delivered: false)
  end

  test "should get index" do
    get orders_path
    assert_response :success
    assert_select 'li', count: 4
    assert_select "li[id='#{@order_delivered_1.id.to_s}']"
    assert_select "li[id='#{@order_delivered_2.id.to_s}']"
    assert_select "li[id='#{@order_pending_1.id.to_s}']"
    assert_select "li[id='#{@order_pending_2.id.to_s}']"
  end

  test "should sort on pending" do
    get orders_path(:sort => true)
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='#{@order_delivered_1.id.to_s}']"
    assert_select "li[id='#{@order_delivered_2.id.to_s}']"

    get orders_path(:sort => false)
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='#{@order_pending_1.id.to_s}']"
    assert_select "li[id='#{@order_pending_2.id.to_s}']"
  end
end
