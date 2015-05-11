get '/user/:id' do |id|
  surveys = Survey.where(creator: id)

  #ZM: Be careful about updating this here.. spec. in a GET route
  #ZM: It should happen everytime the resonse_count get's updated.
  surveys.each do |survey|
    if survey.response_count == survey.closing_number
      survey.status = 'closed'
      survey.save
    end
  end
  #ZM: This is a prefect place for scopes! 
  #ZM: TODO: look into groups
  open_surveys = surveys.where(status: "open") 
  closed_surveys = surveys.where(status: "closed")
  draft_surveys = surveys.where(status: "draft")
  erb :'/users/profile', locals: {open: open_surveys, closed: closed_surveys, draft: draft_surveys}
end


