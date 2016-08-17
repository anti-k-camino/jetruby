handle_orders= ->  
  $('.new_order').bind 'ajax:success', (e, data, status, xhr) -> 
    $('.order_errors').html("")
    $('.order_legend').html("<p class='created'>Order set</p>")    
  .bind 'ajax:error', (e, xhr, status, error) ->
    $('.order_errors').html('Errors occured')    
$(document).ready(handle_orders)||$(document).on('page:load', handle_orders)||$(document).on('page:update', handle_orders)