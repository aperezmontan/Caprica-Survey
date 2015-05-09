get '/user/:id' do |id|
  surveys = Survey.where(creator: id)
  surveys.each do |survey|
    if survey.response_count == survey.closing_number
      survey.status = 'closed'
      survey.save
    end
  end
  opensurveys = surveys.where(status: "open")
  closedsurveys = surveys.where(status: "closed")
  draftsurveys = surveys.where(status: "draft")
  erb :'/users/profile', locals: {open: opensurveys, closed: closedsurveys, draft: draftsurveys}
end


