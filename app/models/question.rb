class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey

  validates :description, presence: true, length: {minimum: 3}

 def answer_list(question_id)
   Answer.where(question_id: question_id)
 end


 def answer_count(question_id)
   num_of_answers = []
   answer_list(question_id).map do |answer_choice|
     count = CompletedSurvey.where(answer_id: answer_choice.id).count
     num_of_answers << count
   end
   percent(num_of_answers)
 end

 def percent(array_of_answers)
   percent = []
   total = array_of_answers.inject(:+)
   array_of_answers.each do |answer|
     percent << ((answer.to_f / total.to_f) * 100)
   end
   return percent
 end
end
