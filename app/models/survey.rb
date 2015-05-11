class Survey < ActiveRecord::Base
  belongs_to :creator, {class_name: "User"}
  has_many :questions
  has_many :completed_surveys
  has_many :answers


  validates :title, presence: true, length: {minimum: 3}

  scope :not_in_list, -> survey_list { where.not(id: survey_list )}

    #ZM: Delete out commented out code please 
  # def count_results(id)
  #   count = Survey.where(survey_id: id).count
  # end

end
