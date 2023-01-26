class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']
  
  def show
    @total_products = Product.count
    @total_categories = Category.count
  end

  private

  def product_params
    params.require(:product).permit(
      :category_id,
      :quantity
    )
  end
end
