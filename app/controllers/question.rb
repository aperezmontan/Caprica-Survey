get "/questions/layout" do 
	erb :"surveys/_question_answers", layout: false, locals: { index: params[:index]} if request.xhr?
end