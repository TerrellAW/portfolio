# Generated seeds from existing database records
# Run this task with: rails db:generate_seeds

# Create tags
react_native_tag = Tag.find_or_create_by!(name: "React Native")
game_development_tag = Tag.find_or_create_by!(name: "Game Development")
mobile_tag = Tag.find_or_create_by!(name: "Mobile")
ai_tag = Tag.find_or_create_by!(name: "AI")
discord_api_tag = Tag.find_or_create_by!(name: "Discord API")
react_tag = Tag.find_or_create_by!(name: "React")
nextjs_tag = Tag.find_or_create_by!(name: "Next.js")
web_dev_tag = Tag.find_or_create_by!(name: "Web Development")
monogame_tag = Tag.find_or_create_by!(name: "MonoGame")

# Create Mood Hops
mood_hops = Project.find_or_create_by!(name: "Mood Hops")
mood_hops.update!(
  thumbnail_desc: "A Complex React Native Project - A simple mobile platformer game with levels based on emotions.",
  desc: "Our team jumped at the opportunity to create a game for our Mobile App Development class' final project. We demonstrated our skills with React Native by doing something no one has done before, creating a platformer game using the tools given to us by React Native. Tools used to render responsive web apps became a game engine where we brought our ideas to life. Mood Hops uses Firebase to handle user accounts and stores save data for level highscores to the device it's played on. With the technologies we are using it would be possible to expand online functionalities by instead saving highscores to the cloud and adding an online leaderboard between users.",
  img_1_desc: "Login",
  img_2_desc: "Select a Level",
  img_3_desc: "and Play!",
  color: "#ec4899",
  is_featured: true
)

# Associate tags with Mood Hops
mood_hops.tags = [ react_native_tag, mobile_tag, game_development_tag ] if mood_hops.tags.empty?

# Create Discord Chatbot
discord_chatbot = Project.find_or_create_by!(name: "Discord Chatbot")
discord_chatbot.update!(
  thumbnail_desc: "A Local AI Powered Chatbot - Uses Discord API to allow AI to communicate with users.",
  desc: "This program demonstrates the limitless possibilities integrating APIs create. Using the LM Studio SDK to send commands from a codebase to a locally run LLM alongside discord.js, which integrates with the Discord API, has allowed me to create an AI agent which can communicate with Discord users. Using the power of an LLM allows one to create a chatbot with its own personality and goals to bring some fun to a Discord server. The chatbot also has a growing list of commands which can be run by Discord users to gain information from other APIs or generate embedded and interactive responses.",
  github_link: "https://github.com/TerrellAW/Discord-Chatbot",
  img_1_desc: "Bored Fish responds to messages!",
  img_2_desc: "Its status is logged in the console.",
  img_3_desc: "Can integrate with MMO game APIs.",
  color: "#FF4B33",
  is_featured: true
)

# Associate tags with Discord Chatbot
discord_chatbot.tags = [ ai_tag, discord_api_tag ] if discord_chatbot.tags.empty?

# Create Allergy Free Recipes
allergy_free_recipes = Project.find_or_create_by!(name: "Allergy Free Recipes")
allergy_free_recipes.update!(
  thumbnail_desc: "A web app for searching and sharing recipes - Uses a custom search and filtering engine to allow users to find allergy free recipes.",
  desc: "Using the Next.js technology stack, I built this web app around a search funtion with additional filtration capabilities to filter out allergens for users looking for recipes. The search function will filter for recipes based on the user's search terms, and hide any recipes that contain the ingredients the user is allergic to.",
  link: "https://allergy-free-recipes.vercel.app/",
  github_link: "https://github.com/TerrellAW/Allergy-Free-Recipes",
  img_1_desc: "Search for Recipes!",
  img_2_desc: "Log in with Google!",
  img_3_desc: "Add your own recipes!",
  color: "#4766CD"
)

# Associate tags with Allergy Free Recipes
allergy_free_recipes.tags = [ react_tag, nextjs_tag, wev_dev_tag ] if allergy_free_recipes.tags.empty?

# Create C# Loving Bones PONG
pong_game = Project.find_or_create_by!(name: "C# Loving Bones PONG")
pong_game.update!(
  thumbnail_desc: "A PONG game with a skeletal aesthetic - Uses MonoGame and C# to recreate a classic game for learning purposes.",
  desc: "I built this game using nothing but the MonoGame framework to learn how videogames work. This game can be improved, but it is a fully functional videogame with a relatively custom game engine, since I didn't use a pre-made one. I learned alot about how games work and this not only got my foot in the door for game development, but also made me a better programmer.",
  github_link: "https://github.com/TerrellAW/CSharp_Loving_Bones_PONG",
  img_1_desc: "Start the game!",
  mg_2_desc: "Play against a friend!",
  img_3_desc: "Win or lose!",
  color: "#FFFFFF",
  is_featured: true
)

# Associate tags with C# Loving Bones PONG
pong_game.tags = [ game_development_tag, monogame_tag ] if pong_game.tags.empty?

# Console output
puts "Seeded #{Project.count} projects and #{Tag.count} tags"
