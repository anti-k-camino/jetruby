ready = ->  
  $(document).on 'click', '.edit_toggle', (e) ->
    e.preventDefault()
    $('.edit_toggle').hide()
    $('.edit_user').show()
$(document).ready(ready) || $(document).on('page:load', ready) || $(document).on('page:update', ready)

