class UserMailerPreview < ActionMailer::Preview
  def checkout_email
    UserMailer.with(order: order).checkout_email
  end
end