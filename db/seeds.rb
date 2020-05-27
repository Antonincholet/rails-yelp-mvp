'require faker'

puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants..."
33.times do
  restaurant = { name: "#{Faker::Coffee.blend_name}",
                address: "#{Faker::Address.full_address}",
                phone_number: "#{Faker::PhoneNumber.cell_phone}",
                category: [ "chinese", "italian", "japanese", "french", "belgian" ].sample }
  valid_restau = Restaurant.create!(restaurant)
  puts "Created #{valid_restau.name}"
  3.times do
    review = { content: "#{Faker::GreekPhilosophers.quote}",
            rating: "#{Faker::Number.between(from: 0, to: 5)}",
            restaurant: valid_restau}
    valid_review = Review.create!(review)
    puts "Created review : #{valid_review.content} || #{valid_review}"
  end
end
puts "Finished!"
