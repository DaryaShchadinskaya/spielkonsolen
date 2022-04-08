require "test_helper"

class DeviceMailerTest < ActionMailer::TestCase
  test "device_booking" do
    mail = DeviceMailer.device_booking
    assert_equal "Device booking", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
