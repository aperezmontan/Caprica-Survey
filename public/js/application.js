$(document).ready(function() {
  $("#draftBtn").on('click',createDraftSurvey);
  $("#addQuestionsBtn").on('click',addQuestions);
  $("#surveySearch").keyup(filterSurveys);
  $("#saveOpenBtn").on('click',updateSurvey);
  $(".delSurvey").on('submit', deleteSurvey);

  // ZM: Idk what this does yet... but it looks cool
  $.expr[":"].contains = $.expr.createPseudo(function(arg) {
    return function( elem ) {
        return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
    };
  });

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
      alert(JSON.stringify(response));
  });

};

var addQuestions = function(){
  var cur_index = $('.question').length - 1;
  var questions_to_add = 3;
  $.get("/questions/layout",{index:'index'},function(response){
      for(var i = 1; i <= questions_to_add; i++){
        //ZM: Louis just being him... i'd rename this 
        var aux = response.replace(/index/g,cur_index + i);
        $("#createBtnContainer").before(aux);
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
          //ZM: Use a toggle(true) toggle(false)
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

var deleteSurvey = function(e) {
  e.preventDefault();
  $.ajax({
    url: "/authenticate",
    method: "get",
    data: {signup:'false'}
  }).done(function(response){
    $("#signin").append(response);
    $("#signoutLink").hide();
    //ZM: I would use event delegation here, and call another function
    $("#signinForm").on('submit',{delEventUrl: e.target.action, delEventMethod: e.target.method, delData: $(e.target).serialize() },checkLogin);
    $("#signin").modal();
  }).fail(function(response){
      alert(JSON.stringify(response));
  });
}

var checkLogin = function(e){
  e.preventDefault();
  $.ajax({
    url: e.target.action,
    method: e.target.method,
    data: $(e.target).serialize()
  }).done(function(response){
    if( response == 'true'){
        var data = {};
        data['url'] = e.data.delEventUrl;
        data['method'] = e.data.delEventMethod;
        data['data'] = e.data.delData;
        delSurveyFunction(data);
    } else {
      $("#msgBox").html("Login incorrect");
    }
  }).fail(function(response){
      alert(JSON.stringify(response));
  });
}

var delSurveyFunction = function(data){
  $.ajax({
    url: data.url,
    method: data.method,
    data: data.data
  }).done(function(response){
      if(response == "true"){
        var url_parts = data.url.split("/")
        $("#survey_"+ url_parts[url_parts.length - 1]).remove();
         $.modal.close();
      } else {
        alert("Could not delete the survey");
      }
  }).fail(function(response){
      alert(JSON.stringify(response));
  });
}

