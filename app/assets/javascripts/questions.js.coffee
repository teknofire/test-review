# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '[data-toggle="answer_type"]', (e) ->
  selected = $(e.target).find(':selected').val()
  switch selected
    when 'multiple_choice_radio'
      $('.correct_answer_input').prop('type', 'radio')
    when 'multiple_choice_checkbox'
      $('.correct_answer_input').prop('type', 'checkbox')
    when 'text'
      $('.correct_answer_input').prop('type', 'checkbox')
  