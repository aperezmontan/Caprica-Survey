class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey

  validates :description, presence: true, length: {minimum: 3}
end
