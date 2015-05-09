$(document).ready(function() {
  $(".draftBtn").on('click',createDraftSurvey);
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
