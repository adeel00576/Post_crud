class Tag < ApplicationRecord
    has_many :taggings, dependent: :delete_all
    has_many :posts, through: :taggings, dependent: :delete_all
    
    
end
