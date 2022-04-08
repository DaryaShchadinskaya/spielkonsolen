class DeviceMailer < ApplicationMailer

  def device_booking
    # @user = params[:user]
    # @device = params[:device]
    @greeting = "Hi"
    mail(
      from: "spielkonsolen@example.com",
      to: User.first.email, 
      cc: User.all.pluck(:email), 
      bcc: "secret@example.com", 
      subject: "Booking device"
    ) 
  end
end
