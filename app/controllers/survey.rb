get '/surveys' do
  user_surveys = CompletedSurvey.where(taker_id: 1)
  surveys_ids = user_surveys.map{ |completed_survey| completed_survey.survey_id }
  surveys = Survey.not_in_list(surveys_ids)
  erb :"surveys/index", locals: {surveys: surveys }
end

get '/survey/create' do
  erb :"surveys/create"
end

post '/survey/create' do
  survey = Survey.new(title: params[:survey][:title], creator_id: 1)
  return [500,"Couldn't create survey"] unless survey.save
  questions = params["questions"]
  questions.each_with_index do |question,index|
    question_created = Question.create(description: question, survey_id: survey.id)
    params["answers"]["#{index}"].each do |answer|
        Answer.create(description: answer, question_id: question_created.id)
    end
  end
  redirect '/surveys'
end

get '/survey/:id' do
  survey = Survey.find(params[:id])
  erb :'surveys/show', locals:  {survey: survey, user_id:1}
end

post '/user/:user_id/survey/:survey_id' do
  params["answers"].values.each do |answer_id|
      CompletedSurvey.create(answer_id: answer_id, survey_id: params[:survey_id], taker_id: params[:user_id])
  end
  redirect '/surveys'
end

get '/survey/:id/update' do |id|
  survey = Survey.find(id)
  return [500,"Can't edit an open survey"] unless survey.status == 'draft'
  erb :"surveys/update" , locals: { survey: survey}
end

put '/status/survey/:id' do
  survey = Survey.find(params[:id])
  survey.status = params[:survey][:status]
  survey.save
  redirect "/user/#{survey.creator.id}"
end

delete '/survey/:id' do
  survey = Survey.find(params[:id])
  survey.destroy
  redirect "/user/#{survey.creator.id}"
end

put "/survey/:id" do |id|
  survey = Survey.find(id)
  survey.update_attributes(params[:survey])

  params[:questions].each do |question_id, description |
      question = Question.find(question_id)
      question.description = description
      question.save
      params[:answers]["#{question.id}"].each do |answer_id, description |
          answer = Answer.find(answer_id)
          answer.description = description
          answer.save
      end
  end
  redirect "/user/#{survey.creator.id}"
end
