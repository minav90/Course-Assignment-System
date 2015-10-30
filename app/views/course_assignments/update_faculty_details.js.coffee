$("#course_ctr").empty().append("<%= escape_javascript(render(:partial => @course_assignments, 
			:locals => {:buildings => @buildings,:courses => @courses, :assigned_buildings => @assigned_building_ids})) %>")

$(".building_select").on 'change', (evt) ->
    $.ajax 'course_assignments/update_room',
      type: 'GET'
      dataType: 'json'
      data: {
        building_select_id: this.id
        building_id: this.options[this.selectedIndex].value
      }
      success: (data, textStatus, jqXHR) ->
        $(data.select_id).empty()
        for room_id,room_name of data.data
          $(data.select_id).append($("<option/>",{value: room_id,text: room_name}))
        $(data.select_id).trigger('change')

$(".room_select").on 'change', (evt) ->
 $.ajax 'course_assignments/update_day_combination',
      type: 'GET'
      dataType: 'json'
      data: {
        room_select_id: this.id
        room_id: this.options[this.selectedIndex].value
      }
      success: (data, textStatus, jqXHR) ->
        $(data.select_id).empty()
        for day_combination_id,day_combination of data.data
          $(data.select_id).append($("<option/>",{value: day_combination_id,text: day_combination}))
        $(data.select_id).trigger('change')

$(".day_combination_select").on 'change', (evt) ->
 $.ajax 'course_assignments/update_time_slot',
      type: 'GET'
      dataType: 'json'
      data: {
        day_combination_select_id: this.id
        day_combination_id: this.options[this.selectedIndex].value
      }
      success: (data, textStatus, jqXHR) ->
        $(data.select_id).empty()
        for time_slot_id,time_slot of data.data
          $(data.select_id).append($("<option/>",{value: time_slot_id,text: time_slot}))

$(".building_select").trigger('change')
