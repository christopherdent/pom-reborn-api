# db/seeds.rb

puts 'Destroying old data, are you sure? (y/n)'
answer = gets.chomp.downcase
if answer == 'y'
    Pet.destroy_all
    User.destroy_all
    puts 'Terminated'
else
  puts 'Nothing seeds added. Exiting...'
  exit
end


# Create Users
user1 = User.new(email: 'user1@example.com', password: 'password', first_name: 'John', last_name: 'Doe')
user2 = User.new(email: 'user2@example.com', password: 'password', first_name: 'Jane', last_name: 'Smith')

# Save the users to the database and check if they were saved successfully
if user1.save && user2.save
  # Create Pets Associated with Users
  pet1 = user1.pets.create(name: 'Fluffy', species: 'Dog', age: 3)
  pet2 = user1.pets.create(name: 'Whiskers', species: 'Cat', age: 2)
  pet3 = user2.pets.create(name: 'Buddy', species: 'Dog', age: 4)

  puts 'Seed data has been created!'
else
  puts 'Error: Users were not saved to the database.'
end
