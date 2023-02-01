# Preview all emails at http://localhost:3000/rails/mailers/user
class UserMailerPreview < ActionMailer::Preview
  def checkout_email
    #hardcoded order to preview
    order = Order.new(id:5, email: "frankdux@kumite.jk", total_cents: 8799)

    UserMailer.with(order: order).checkout_email
  end
end