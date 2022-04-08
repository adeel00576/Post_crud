class Comment < ApplicationRecord
    belongs_to :post, dependent: :delete
    belongs_to :user, dependent: :delete
end
