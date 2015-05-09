class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :completedsurveys
  validates :description, presence: true, length: {minimum: 2}

  def self.answer_list(question_id)
    Answer.where(question_id: question_id)
  end

  def self.answer_count(question_id)
    num_of_answers = []
    answer_list(question_id).map do |answer_choice|
      @count = CompletedSurvey.where(answer_id: answer_choice.id).count
      num_of_answers << @count
    end
    #   @percent = []
    #  total = num_of_answers.inject(:+)
    #  num_of_answers.each do |answer|
    #   @percent << (answer.to_f / total.to_f)
    # end
    # return @percent
  end

  def self.percent(array_of_answers)
    @percent = []
    total = array_of_answers.inject(:+)
    array_of_answers.each do |answer|
      @percent << (answer.to_f / total.to_f)
  end
end

