class Choice < ApplicationRecord
  belongs_to :word

  validates :choice, presence: true

  has_one :answer
  
end
