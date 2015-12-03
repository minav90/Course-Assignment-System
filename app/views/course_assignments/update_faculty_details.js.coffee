$("#course_ctr").empty().append("<%= escape_javascript(render(:partial => @course_assignments, 
			:locals => {:buildings => @buildings,:courses => @courses, :assigned_buildings => @assigned_building_ids})) %>")

$(document).on "change", ".building_select", (evt) ->
    course_id = ""
    for i in [1..$(".building_select").length]
      if $(".building_select")[i-1].id == this.id
        course_id = $(".course")[i-1].value
    $.ajax 'course_assignments/update_room',
      type: 'GET'
      dataType: 'json'
      data: {
        course_id: course_id
        building_id: this.options[this.selectedIndex].value
      }
      success: (data, textStatus, jqXHR) ->
        $(data.select_id).empty()
        i = 0
        for room_id,room_name of data.data
          if room_id != data.selected_val
            $(data.select_id).append($("<option/>",{value: room_id,text: room_name}))
          else
            $(data.select_id).append($("<option/>",{value: room_id,text: room_name,selected: "selected"}))
          i++
        $(data.select_id).trigger('change')

$(".room_select").on 'change', (evt) ->
    course_id = ""
    for i in [1..$(".room_select").length]
      if $(".room_select")[i-1].id == this.id
        course_id = $(".course")[i-1].value
    $.ajax 'course_assignments/update_day_combination',
      type: 'GET'
      dataType: 'json'
      data: {
        course_id: course_id
        room_id: this.options[this.selectedIndex].value
      }
      success: (data, textStatus, jqXHR) ->
        $(data.select_id).empty()
        i = 0
        for day_combination_id,day_combination of data.data
          if day_combination_id != data.selected_val
            $(data.select_id).append($("<option/>",{value: day_combination_id,text: day_combination}))
          else
            $(data.select_id).append($("<option/>",{value: day_combination_id,text: day_combination,selected: "selected"})) 
          i++
        $(data.select_id).trigger('change')

$(".day_combination_select").on 'change', (evt) ->
    course_id = ""
    for i in [1..$(".day_combination_select").length]
      if $(".day_combination_select")[i-1].id == this.id
        course_id = $(".course")[i-1].value
        room_id = $(".room_select")[i-1].value
    $.ajax 'course_assignments/update_time_slot',
      type: 'GET'
      dataType: 'json'
      data: {
        course_id: course_id
        room_id: room_id
        day_combination_id: this.options[this.selectedIndex].value
      }
      success: (data, textStatus, jqXHR) ->
        $(data.select_id).empty()
        i = 0
        for time_slot_id,time_slot of data.data
          if time_slot_id != data.selected_val
            $(data.select_id).append($("<option/>",{value: time_slot_id,text: time_slot}))
          else
            $(data.select_id).append($("<option/>",{value: time_slot_id,text: time_slot,selected: "selected"}))
          i++

$(".building_select").trigger('change')
