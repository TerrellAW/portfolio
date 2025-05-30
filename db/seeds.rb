# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create tags first
react_native_tag = Tag.find_or_create_by!(name: 'React Native')
game_dev_tag = Tag.find_or_create_by!(name: 'Game Development')
mobile_tag = Tag.find_or_create_by!(name: 'Mobile')

# Create Mood Hops project
mood_hops = Project.find_or_create_by!(name: 'Mood Hops') do |project|
  project.thumbnail_desc = 'A Complex React Native Project - A simple mobile platformer game with levels based on emotions.'
  project.desc = 'Our team jumped at the opportunity to create a game for our Mobile App Development class\' final project. We demonstrated our skills with React Native by doing something no one has done before, creating a platformer game using the tools given to us by React Native. Tools used to render responsive web apps became a game engine where we brought our ideas to life. Mood Hops uses Firebase to handle user accounts and stores save data for level highscores to the device it\'s played on. With the technologies we are using it would be possible to expand online functionalities by instead saving highscores to the cloud and adding an online leaderboard between users.'
  project.img_1_desc = 'Login'
  project.img_2_desc = 'Select a Level'
  project.img_3_desc = 'and Play!'
end

# Associate tags with Mood Hops (only if not already associated)
mood_hops.tags << [ react_native_tag, game_dev_tag, mobile_tag ] unless mood_hops.tags.any?

puts "Seeded #{Project.count} projects and #{Tag.count} tags"
