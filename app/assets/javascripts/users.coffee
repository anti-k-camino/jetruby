# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->  
  $(document).on 'click', '.edit_toggle', (e) ->
    e.preventDefault()
    $('.edit_toggle').hide()
    $('.edit_user').show()  
    


$(document).ready(ready) || $(document).on('page:load', ready) || $(document).on('page:update', ready)

