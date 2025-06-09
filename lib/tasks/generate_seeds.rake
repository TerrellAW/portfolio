namespace :db do
  desc "Generate seeds.rb content from existing database records"
  task generate_seeds: :environment do
    puts "# Generated seeds from existing database records"
    puts "# Run this task with: rails db:generate_seeds"
    puts ""

    # Generate tags
    puts "# Create tags"
    Tag.all.each do |tag|
      puts "#{tag.name.downcase.gsub(' ', '_')}_tag = Tag.find_or_create_by!(name: \"#{tag.name}\")"
    end
    puts ""

    # Generate projects
    puts "# Create projects"
    Project.all.each do |project|
      project_var = project.name.downcase.gsub(/[^a-z0-9]/, "_").gsub(/_+/, "_")

      puts "#{project_var} = Project.find_or_create_by!(name: \"#{project.name}\") do |project|"
      puts "  project.thumbnail_desc = \"#{project.thumbnail_desc.gsub('\\', '\\\\').gsub('"', '\\"')}\"" if project.thumbnail_desc
      puts "  project.desc = \"#{project.desc.gsub('\\', '\\\\').gsub('"', '\\"')}\"" if project.desc
      puts "  project.link = \"#{project.link}\"" if project.link.present?
      puts "  project.github_link = \"#{project.github_link}\"" if project.github_link.present?
      puts "  project.img_1_desc = \"#{project.img_1_desc.gsub('\\', '\\\\').gsub('"', '\\"')}\"" if project.img_1_desc
      puts "  project.img_2_desc = \"#{project.img_2_desc.gsub('\\', '\\\\').gsub('"', '\\"')}\"" if project.img_2_desc
      puts "  project.img_3_desc = \"#{project.img_3_desc.gsub('\\', '\\\\').gsub('"', '\\"')}\"" if project.img_3_desc
      puts "  project.color = \"#{project.color}\"" if project.color.present?
      puts "end"
      puts ""

      # Generate tag associations
      if project.tags.any?
        tag_vars = project.tags.map { |tag| "#{tag.name.downcase.gsub(' ', '_')}_tag" }
        puts "# Associate tags with #{project.name}"
        puts "#{project_var}.tags = [ #{tag_vars.join(', ')} ] if #{project_var}.tags.empty?"
        puts ""
      end
    end

    puts "puts \"Seeded \#{Project.count} projects and \#{Tag.count} tags\""
  end
end
