class Project < ApplicationRecord
    validates :name, presence: true # Ensure name is present
    validates :desc, presence: true # Ensure description is present
    validates :img_1_desc, presence: true # Text under first image
    validates :img_2_desc, presence: true # Text under second image
    validates :img_3_desc, presence: true # Text under third image
    has_one_attached :thumbnail # Image for display on project card
    has_one_attached :img_1 # First image on page
    has_one_attached :img_2 # Second image on page
    has_one_attached :img_3 # Third image on page
end
