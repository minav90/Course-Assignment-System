$ ->
  $(document).on 'change', '.day_combinations_select', (evt) ->
    for i in [1..$(".day_combinations_select").length]
      if $(".day_combinations_select")[i-1].id == this.id
        time_slot_select_id = "#" + $(".time_slots_select")[i-1].id         
    $.ajax '/faculty_preferences/update_time_slots',
      type: 'GET'
      dataType: 'json'
      data: {
        day_combination_id: $("#" + this.id + " option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        $(time_slot_select_id).empty()
        i = 0
        for time_slot_id,time_slot of data.data
            $(time_slot_select_id).append($("<option/>",{value: time_slot_id,text: time_slot}))
          i++
  $(".day_combinations_select").trigger('change')
