class Project < ApplicationRecord
    validates :name, presence: true # Ensure name is present
end
