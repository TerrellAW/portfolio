class Project < ApplicationRecord
    validates :name, presence: true # Ensure name is present
    validates :thumbnail_desc, presence: true # Ensure project card description is present
    validates :desc, presence: true # Ensure full description is present
    validates :link, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "is not a valid URL" }, allow_blank: true # Link to project page
    validates :github_link, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "is not a valid URL" }, allow_blank: true # GitHub repository link
    validates :img_1_desc, presence: true # Text under first image
    validates :img_2_desc, presence: true # Text under second image
    validates :img_3_desc, presence: true # Text under third image
    validates :color, format: { with: /\A#[0-9A-Fa-f]{6}\z/, message: "must be a valid hex color (e.g., #22d3ee)" }, allow_blank: true # Project color scheme
    has_and_belongs_to_many :tags # Tags for project cards

    after_create :create_image_folders

  # Smart File Path Methods
  def thumbnail_path
    file_path = Rails.root.join("public", "images", "projects", id.to_s, "thumbnail.gif")
      if File.exist?(file_path)
        "/images/projects/#{id}/thumbnail.gif"
      else
        "https://placeholder.pics/svg/500x300/cccccc/ffffff/Placeholder"
      end
    end

  def img_1_path
    file_path = Rails.root.join("public", "images", "projects", id.to_s, "img_1.gif")
      if File.exist?(file_path)
        "/images/projects/#{id}/img_1.gif"
      else
        "https://placeholder.pics/svg/500x300/cccccc/ffffff/Placeholder"
      end
    end

  def img_2_path
    file_path = Rails.root.join("public", "images", "projects", id.to_s, "img_2.gif")
      if File.exist?(file_path)
        "/images/projects/#{id}/img_2.gif"
      else
        "https://placeholder.pics/svg/500x300/cccccc/ffffff/Placeholder"
      end
    end

  def img_3_path
    file_path = Rails.root.join("public", "images", "projects", id.to_s, "img_3.gif")
      if File.exist?(file_path)
        "/images/projects/#{id}/img_3.gif"
      else
        "https://placeholder.pics/svg/500x300/cccccc/ffffff/Placeholder"
      end
  end

  # Get project color with fallback to default
  def project_color
      color.present? ? color : "#ffffff"
  end

    private

    # Create image directories for each page automatically
    def create_image_folders
        folder_path = Rails.root.join("public", "images", "projects", id.to_s)
        FileUtils.mkdir_p(folder_path)
    end
end
