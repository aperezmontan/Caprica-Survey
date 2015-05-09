get '/surveys' do
  user_surveys = CompletedSurvey.where(taker_id: current_user.id)
  surveys_ids = user_surveys.map{ |completed_survey| completed_survey.survey_id }
  surveys = Survey.not_in_list(surveys_ids)
  erb :"surveys/index", locals: {surveys: surveys }
end

get '/survey/create' do
  erb :"surveys/create"
end

post '/survey/create' do
  params[:survey][:creator_id] = current_user.id
  survey = Survey.new(params[:survey])
  return [500,"Couldn't create survey"] unless survey.save
  questions = params["questions"]
  questions.each_with_index do |question,index|
    if !question.empty?
      question_created = Question.create(description: question, survey_id: survey.id)
      params["answers"]["#{index}"].each do |answer|
          if !answer.empty?
            Answer.create(description: answer, question_id: question_created.id)
          end
      end
    end
  end
  return "success" if request.xhr?
  redirect '/surveys'
end

get '/survey/:id/results' do |id|
  questions = Survey.find(id).questions
  erb :"/surveys/results", locals: {questions: questions}
end

get '/question/:id/results' do |id|
  question = Question.find(id)
  percent = question.answer_count(question)
  erb :'/questions/results', locals:{percent: percent, question: question}
end

get '/survey/:id' do
  survey = Survey.find(params[:id])
  erb :'surveys/show', locals:  {survey: survey, user_id: current_user.id}
end

post '/user/:user_id/survey/:survey_id' do
  survey = params[:survey_id]
  params["answers"].values.each do |answer_id|
      CompletedSurvey.create(answer_id: answer_id, survey_id: params[:survey_id], taker_id: params[:user_id])
  end
  sample = Survey.find(survey)
  sample.response_count += 1
  sample.save
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
