class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]
    # mail(to: <ADMIN_EMAIL>, subject: "Confirmation of the device booking")
  end
end
