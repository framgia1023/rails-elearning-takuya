class Choice < ApplicationRecord
  belongs_to :word
  belongs_to :lesson, optional: true

  validates :choice, presence: true

  has_many :answer
  
end
