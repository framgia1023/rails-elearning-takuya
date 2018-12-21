class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one :answer
end
