# Generated seeds from existing database records
# Run this task with: rails db:generate_seeds

# Create tags
react_native_tag = Tag.find_or_create_by!(name: "React Native")
game_development_tag = Tag.find_or_create_by!(name: "Game Development")
mobile_tag = Tag.find_or_create_by!(name: "Mobile")
ai_tag = Tag.find_or_create_by!(name: "AI")
discord_api_tag = Tag.find_or_create_by!(name: "Discord API")

# Create Mood Hops
mood_hops = Project.find_or_create_by!(name: "Mood Hops") do |project|
  project.thumbnail_desc = "A Complex React Native Project - A simple mobile platformer game with levels based on emotions."
  project.desc = "Our team jumped at the opportunity to create a game for our Mobile App Development class' final project. We demonstrated our skills with React Native by doing something no one has done before, creating a platformer game using the tools given to us by React Native. Tools used to render responsive web apps became a game engine where we brought our ideas to life. Mood Hops uses Firebase to handle user accounts and stores save data for level highscores to the device it's played on. With the technologies we are using it would be possible to expand online functionalities by instead saving highscores to the cloud and adding an online leaderboard between users."
  project.img_1_desc = "Login"
  project.img_2_desc = "Select a Level"
  project.img_3_desc = "and Play!"
  project.color = "#ec4899"
end

# Associate tags with Mood Hops
mood_hops.tags = [ react_native_tag, mobile_tag, game_development_tag ] if mood_hops.tags.empty?

# Create Discord Chatbot
discord_chatbot = Project.find_or_create_by!(name: "Discord Chatbot") do |project|
  project.thumbnail_desc = "A Local AI Powered Chatbot - Uses Discord API to allow AI to communicate with users."
  project.desc = "This program demonstrates the limitless possibilities integrating APIs create. Using the LM Studio sdk to send commands from a codebase to a locally run LLM alongside discord.js, which integrates with the Discord API, has allowed me to create an AI agent which can communicate with Discord users. Using the power of an LLM allows one to create a chatbot with its own personality and goals to bring some fun to a Discord server. The chatbot also has a growing list of commands which can be run by Discord users to gain information from other APIs or generate embedded and interactive responses."
  project.github_link = "https://github.com/TerrellAW/Discord-Chatbot"
  project.img_1_desc = "Bored Fish responds to messages!"
  project.img_2_desc = "Its status is logged in the console."
  project.img_3_desc = "Can integrate with MMO game APIs."
  project.color = "#FF4B33"
end

# Associate tags with Discord Chatbot
discord_chatbot.tags = [ ai_tag, discord_api_tag ] if discord_chatbot.tags.empty?

# Create Allergy Free Recipes
allergy_free_recipes = Project.find_or_create_by!(name: "Allergy Free Recipes") do |project|
  project.thumbnail_desc = "A web app that allows users to find allergy free recipes using a search and filtering engine."
  project.desc = "Using the Next.js technology stack, I built this web app around a search funtion with additional filtration capabilities to filter out allergens for users looking for recipes. The search function will filter for recipes based on the user's search terms, and hide any recipes that contain the ingredients the user is allergic to."
  project.link = "https://allergy-free-recipes.vercel.app/"
  project.github_link = "https://github.com/TerrellAW/Allergy-Free-Recipes"
  project.img_1_desc = "Search for Recipes!"
  project.img_2_desc = "Log in with Google!"
  project.img_3_desc = "Add your own recipes!"
  project.color = "#4766CD"
end

# Associate tags with Allergy Free Recipes
allergy_free_recipes.tags = [ react_native_tag, game_development_tag, mobile_tag ] if allergy_free_recipes.tags.empty?

# Console output
puts "Seeded #{Project.count} projects and #{Tag.count} tags"
