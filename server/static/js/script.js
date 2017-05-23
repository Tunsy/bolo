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