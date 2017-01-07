$(document).ready(function() {
  
  $('#addQuestions').on('click', function(event){
    
    event.preventDefault();
    var question = $('#params_question').val();
    var question_id = $("#question_id").val();
    $('form#question').hide();

    $.post('/poll/' + question_id + '/' 
       + 'add_questions', {question_name: question}, function(data) {
      $('#poll_name').html(data);

    });

  });






// $('#addOptions').on('click', function(event){

//     event.preventDefault();
//     var option = $('#params_option').val();
//     var option_id = $('#option_id').val();
//     $.post('/question/' + option_id + '/' + 'add_option'), {option_body: option}, function(data) {
//      setTimeout(function(){
//         $('input,textarea','#form1').val(''); //clearing inputs
//     },1);
//     //..................

//   }


// });


});




