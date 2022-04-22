User.create(email: 'admin@example.com', password: '123456', role: 0)

device.user = user
device.image.attach(
  io: File.open('app/assets/images/default_image.jpg'),
  filename: 'default_image.jpg'
)
device.save!

# CART
Cart.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"
