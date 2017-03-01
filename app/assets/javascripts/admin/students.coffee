jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('#student_student_degrees_attributes_0_student_university_id').parent().show()
  student_universities = $('#student_student_degrees_attributes_0_student_university_id').html()
  $('#student_student_degrees_attributes_0_country_id').change ->
    country = $('#student_student_degrees_attributes_0_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(student_universities).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#student_student_degrees_attributes_0_student_university_id').html(options)
      $('#student_student_degrees_attributes_0_student_university_id').parent().show()
    else
      $('#student_student_degrees_attributes_0_student_university_id').empty()
      $('#student_student_degrees_attributes_0_student_university_id').parent().show()



  $('#student_student_degrees_attributes_0_student_city_id').parent().show()
  student_cities = $('#student_student_degrees_attributes_0_student_city_id').html()
  $('#student_student_degrees_attributes_0_country_id').change ->
    country = $('#student_student_degrees_attributes_0_country_id :selected').text()
    escaped_countrys = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    optionss = $(student_cities).filter("optgroup[label='#{escaped_countrys}']").html()
    if optionss
      $('#student_student_degrees_attributes_0_student_city_id').html(optionss)
      $('#student_student_degrees_attributes_0_student_city_id').parent().show()
    else
      $('#student_student_degrees_attributes_0_student_city_id').empty()
      $('#student_student_degrees_attributes_0_student_city_id').parent().show()
    