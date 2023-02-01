class UserMailer < ApplicationMailer

  def checkout_email
    @order = params[:order]
    mail(to: @order.email, subject: "Receipt for your Jungle purchase: Order # #{@order.id}")
  end
end

