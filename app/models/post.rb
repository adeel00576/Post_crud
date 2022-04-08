class Post < ApplicationRecord
    
    has_many :taggings, dependent: :delete_all
    has_many :tags, through: :taggings, dependent: :delete_all
    belongs_to :user
    has_many :likes, dependent: :delete_all
    has_many :comments, dependent: :delete_all

    validates :description, :title, presence: true

    def tag_list
        tags.pluck(&:name).join(', ')
    end
    
    def tag_list=(names)
        self.tags = names.split(',').map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end

end
