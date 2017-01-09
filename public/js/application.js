$(document).ready(function() {
  
  $('#addQuestions').on('click', function(event){
    
    event.preventDefault();
    var question = $('#params_question').val();
    var question_id = $("#question_id").val();
    $('form#question').hide();

    $.post('/poll/' + question_id + '/add_questions', {question_name: question}, function(data) {
      $('#poll_name').html(data);

    });

  });





  $(document).on('click','#addOptions', function(event){


    event.preventDefault();
    console.log('PREVENT DEFAULT');
    var id = $('.option').last().val();
    console.log("ID",id);

    var option = $('#params_option_' + id).val();
    var question_id = $('#question_id_' + id).val();
    console.log("ADD OPTION");
    $.post('/question/' + question_id + '/' + 'add_option',{option: option, id: id}, function(data) {
      console.log("data de add options",data)
      $('#option_' + id).append(data);

    });


  });


});




