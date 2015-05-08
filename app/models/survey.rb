class Survey < ActiveRecord::Base
  belongs_to :creator, {class_name: "User"}
  has_many :questions
  has_many :completed_surveys
  has_many :answers


  validates :title, presence: true, length: {minimum: 3}
end
