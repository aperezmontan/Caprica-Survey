get "/questions/layout" do 
  #ZM: If you are only ever calling this via ajax, you do not need the request.xhr?
	erb :"surveys/_question_answers", layout: false, locals: { index: params[:index]} if request.xhr?
end