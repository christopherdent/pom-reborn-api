# db/seeds.rb

puts 'Destroying old data, are you sure? (y/n)'
answer = gets.chomp.downcase
if answer == 'y'
    Pet.destroy_all
    User.destroy_all
    puts 'Old records destroyed, new seeds being created...'
else
  puts 'Nothing seeds added. Exiting...'
  exit
end


# db/seeds.rb

# Create sample users
User.create!(
  email: 'user1@example.com',
  password: 'password1',
  first_name: 'John',
  last_name: 'Doe',
  admin: false
)

User.create!(
  email: 'user2@example.com',
  password: 'password2',
  first_name: 'Jane',
  last_name: 'Smith',
  admin: true
)

# Create sample pets associated with users
User.all.each do |user|
  Pet.create!(
    name: 'Buddy',
    age: 3,
    owner: "#{user.first_name} #{user.last_name}",
    species: 'Dog',
    gender: 'Male',
    color: 'Brown',
    date_of_birth: Date.new(2020, 5, 10),
    health_score: 9.5,
    personality_traits: 'Friendly, Playful',
    pet_status: 'Active',
    bio: 'A lovable dog who enjoys long walks in the park.',
    weight: 25.5,
    user: user
  )

  Pet.create!(
    name: 'Whiskers',
    age: 2,
    owner: "#{user.first_name} #{user.last_name}",
    species: 'Cat',
    gender: 'Female',
    color: 'Gray',
    date_of_birth: Date.new(2021, 2, 15),
    health_score: 8.0,
    personality_traits: 'Independent, Curious',
    pet_status: 'Healthy',
    bio: 'A playful and independent cat who loves chasing toys.',
    weight: 8.7,
    user: user
  )
end
