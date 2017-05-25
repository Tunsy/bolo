$(document).ready(function(){
    $('.ui.accordion')
      .accordion()
    ;
    $('.ui.avatar.image')
        .popup()
    ;
    $('#pending').hide();
    $('#past').hide();
});

$(".approve-reservation").click(function() {
    $(this).closest('tr').hide('slow', function(){ $(thi).remove(); });
});

$(".deny-reservation").click(function() {
    $(this).closest('tr').hide('slow', function(){ $(thi).remove(); });
});


$("#home-button").click(function() {
    $('#home').show();
    $('#pending').hide();
    $('#past').hide();
});

$("#pending-button").click(function() {
    $('#pending').show();
    $('#home').hide();
    $('#past').hide();
});

$("#past-button").click(function() {
    $('#home').hide();
    $('#pending').hide();
    $('#past').show();
});

$('#registration-form')
  .form({
    fields: {
      firstname: {
        identifier: 'first-name',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter your first name'
          }
        ]
      },
      lastname: {
        identifier: 'last-name',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter your last name'
          }
        ]
      },
      email: {
        identifier: 'email',
        rules: [
          {
            type   : 'email',
            prompt : 'Please enter a valid email'
          }
        ]
      },
      password: {
        identifier: 'password',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter a password'
          },
          {
            type   : 'minLength[6]',
            prompt : 'Your password must be at least {ruleValue} characters'
          }
        ]
      },
      terms: {
        identifier: 'terms',
        rules: [
          {
            type   : 'checked',
            prompt : 'You must agree to the terms and conditions'
          }
        ]
      }
    }
  })

  $('#login-form')
  .form({
    fields: {
      email: {
        identifier: 'email',
        rules: [
          {
            type   : 'email',
            prompt : 'Please enter a valid email'
          }
        ]
      },
      password: {
        identifier: 'password',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter a password'
          },
        ]
      },
    }
  })