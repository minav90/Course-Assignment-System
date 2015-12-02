# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#building_select', (evt) ->
    $.ajax 'class/update_room',
      type: 'GET'
      dataType: 'script'
      data: {
        building_id: $("#building_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'change', '#room_select', (evt) ->
    $.ajax 'class/update_capacity',
      type: 'GET'
      dataType: 'script'
      data: {
        room_id: $("#room_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'change', '#day_combination_select', (evt) ->
    $.ajax 'class/update_timeslot',
      type: 'GET'
      dataType: 'script'
      data: {
        day_combination_id: $("#day_combination_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")