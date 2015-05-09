$(document).ready(function() {
  $("#draftBtn").on('submit',createDraftSurvey);
  $("#submitBtn").on('submit',createDraftSurvey);
  $("#addQuestionsBtn").on('click',addQuestions);
  
});

var createDraftSurvey = function(e){
  console.log(e);
  alert('here');
  e.preventDefault();
  $(e.target).append("<input type='hidden' name='survey[status]' value='draft' />");
  $.ajax({
    url: e.target.action,
    method: e.target.method,
    data: $(e.target).serialize()
  }).done(function(response){
    alert(response);
    if(response == "success"){
      window.location = "/surveys";
    }
  }).fail(function(response){
      alert(response);
  });

};

var addQuestions = function(){
  var cur_index = $('.question').length - 1;
  var questions_to_add = 3;
  $.get("/questions/layout",{index:'index'},function(response){
      for(var i = 1; i <= questions_to_add; i++){
        var aux = response.replace(/index/g,cur_index + i);
        $("#addQuestionsBtn").before(aux);        
      }
      cur_index += questions_to_add;
  });
}
