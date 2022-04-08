class Tagging < ApplicationRecord
    belongs_to :post, dependent: :delete
    belongs_to :tag, dependent: :delete
end
