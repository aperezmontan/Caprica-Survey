$(document).ready(function() {
  $("#draftBtn").on('click',createDraftSurvey);
  $("#addQuestionsBtn").on('click',addQuestions);
  $("#surveySearch").keyup(filterSurveys);
  $("#saveOpenBtn").on('click',updateSurvey);
});

var createDraftSurvey = function(e){
  e.preventDefault();
  $("#createForm").append("<input type='hidden' name='survey[status]' value='draft' />");
  $.ajax({
    url: "/survey/create",
    method: "post",
    data: $("#createForm").serialize()
  }).done(function(response){
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

var filterSurveys = function(e){
  var searchTxt = $("#surveySearch").val();
  searchTxt = searchTxt.trim();
  if (searchTxt){
    $( ".surveysContainer>li" ).each(function(){
       if ( $(this).is(":contains('" + searchTxt + "')") ) {
          $(this).css("display","block");
       } else {
          $(this).css("display","none");
       }
    });
  } else {
    $( ".surveysContainer>li" ).css("display","block");
  }
}

var updateSurvey = function(e) {
  $("#surveyUpdateForm").append("<input type='hidden' name='survey[status]' value='open' />");
  $("#surveyUpdateForm").submit();
};
