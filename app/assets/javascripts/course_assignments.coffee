$ ->
   $(document).on 'change', "#faculty_id", (evt) ->
    $.ajax 'course_assignments/update_faculty_details',
      type: 'GET'
      dataType: 'script'
      data: {
        faculty_id: $("#faculty_id option:selected").val()
      }
