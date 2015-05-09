class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :completedsurveys
  validates :description, presence: true, length: {minimum: 2}

end

