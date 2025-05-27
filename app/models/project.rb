class Project < ApplicationRecord
    validates :name, presence: true # Ensure name is present
    validates :thumbnail_desc, presence: true # Ensure project card description is present
    validates :desc, presence: true # Ensure full description is present
    validates :link, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "is not a valid URL" } # Link to project page
    validates :github_link, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "is not a valid URL" }, allow_blank: true # GitHub repository link
    validates :img_1_desc, presence: true # Text under first image
    validates :img_2_desc, presence: true # Text under second image
    validates :img_3_desc, presence: true # Text under third image
    has_one_attached :thumbnail # Image for display on project card
    has_one_attached :img_1 # First image on page
    has_one_attached :img_2 # Second image on page
    has_one_attached :img_3 # Third image on page
    has_and_belongs_to_many :tags # Tags for project cards
end
