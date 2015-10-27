 $ ->
   $(document).on 'change', '#faculty_id', (evt) ->
    name = this.options[this.selectedIndex].text;
    $("#faculty_name").text(name)
    $.ajax '/faculty_course_room_timings/update_faculty_details',
      type: 'GET'
      dataType: 'script'
      data: {
        faculty_id: $("#faculty_id option:selected").val()
      }
