get '/user/:id' do |id|
  surveys = Survey.where(creator: id)
  opensurveys = surveys.where(status: "open")
  closedsurveys = surveys.where(status: "closed")
  draftsurveys = surveys.where(status: "draft")
  erb :'/users/profile', locals: {open: opensurveys, closed: closedsurveys, draft: draftsurveys}
end


