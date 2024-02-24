Admin.destroy_all

Admin.create!(email: "admin@example.com", password: 123456)

50.times do |i|
    Admin.create!(email: Faker::Internet.safe_email, password: 123456)
end
