class Word < ApplicationRecord
  belongs_to :category
  belongs_to :lesson, optional: true

  validates :word, presence: true

  has_many :choices, dependent: :destroy  
  accepts_nested_attributes_for :choices

  validate :check_choices

  has_many :answer

  def correct
    choices.find_by(correct: true).choice
  end

  private
  def check_choices
    choice = choices.collect {|c| c.correct || nil }.compact
    if choice.size == 0
      errors.add(:choices_correct,"can't be blank")
    elsif choice.size > 1 
      errors.add(:choices_correct,"can have only one choice")
    end
  end
  
end
