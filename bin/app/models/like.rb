class Like < ApplicationRecord
  belongs_to :articles
  belongs_to :user
end
