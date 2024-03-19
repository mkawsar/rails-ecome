class AdminController < ApplicationController
    before_action :authenticate_admin!

    def index
        @orders = Order.where(fulfilled: false).order(created_at: :desc).take(5)
        @quick_stats = {
            sales: Order.where(created: Time.now.midnight..Time.now).count,
            revenue: Order.where(created: Time.now.midnight..Time.now).sum(:total).round,
            avg_sale: Order.where(created: Time.now.midnight..Time.now).average(:total),
            per_sale: OrderProduct.joins(:order).where(orders: { created_at: Time.now.midnight..Time.now }).average(:quantity)
        }
    end
end
