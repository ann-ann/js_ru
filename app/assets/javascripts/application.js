// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require chosen-jquery
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).ready( function() {
  select = $(".chzn-select").chosen({
    no_results_text: "Создать новый тег: ",
  });

  var input = $('#question_tag_ids_chosen').find('input')
  select.on('chosen:no_results',function(evt, params){
    input.on('keyup', function(e) {
      if (e.which == 13 || e.which == 188 || e.key == ',') {
        if(input.val() != '' && input.val().slice(-1) == ',') {
          var value = params.chosen.search_results.find('span').text().replace(/[`~!@#$%^&*()|+=?;:'",.<>\{\}\[\]\\\/]/gi, '');;
          var index = parseInt($('#question_tag_ids').find('option').last().val()) + 1
          select.append(new Option(value, index,true).outerHTML);
          select.trigger("chosen:updated");
        }
      }
    });
  });
});

$(document).ready(function(){
 $('#new_question').submit(function(){
    names = []
    $('.search-choice').each(function( ) {
      names.push($(this).text());
      $('#tags_names').val(names);
    });
  });
});
