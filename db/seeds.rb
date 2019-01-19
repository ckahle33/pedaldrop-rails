20.times do |t|
  user = User.new(
    email: "dev#{t}@pedaldrop.com",
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.now
  )
  user.save
  Product.find_or_create_by(
    name: "#{Faker::Music.album} #{%w(fuzz delay distortion).sample}",
    item_type: "Pedal",
    price:   [100, 200, 300].sample,
    amount: [20, 50, 100].sample,
    description: Faker::BojackHorseman.tongue_twister
  )
  puts "Creating User, Product and Brand for #{t}"
end
