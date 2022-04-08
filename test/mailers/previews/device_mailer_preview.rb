# Preview all emails at http://localhost:3000/rails/mailers/device_mailer
class DeviceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/device_mailer/device_booking
  def device_booking
    DeviceMailer.device_booking
  end

end
