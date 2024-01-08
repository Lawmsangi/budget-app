class Payment < ApplicationRecord
    belongs_to :author, foreign_key: :author_id, class_name: 'User'
    has_and_belongs_to_many :categories
end
