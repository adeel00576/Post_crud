class Like < ApplicationRecord
    belongs_to :user, dependent: :delete
    belongs_to :post, dependent: :delete
    # validates :user_id , uniqueness: {scope: :post_id}
end
