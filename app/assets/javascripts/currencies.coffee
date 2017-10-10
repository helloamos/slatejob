

$(document).on 'ajax:beforeSend', '.ajax-form', () ->
  $('#form-errors').empty()
  clearErrors()

$(document).on 'ajax:success', '.ajax-form', (data, status, xhr) ->
  $("#form-errors").html "<div class='success'>Post update success</div>"
  clearErrors()

$(document).on 'ajax:error', '.ajax-form', (data, status, xhr) ->
  $("#form-errors").html "<div class='error'>Post update error</div>"
  markFormErrors(status, false)

window.markFormErrors = (status) ->
  try
    errors_array = JSON.parse(status.responseText)
    for key of errors_array
      selector = '[id$=' + key + ']'
      if $(selector).length > 0 && $(selector).data('errorOn') != undefined
        markWithError(selector, errors_array[key])
      else
        $('#form-errors').append "<div class='error'>"+key+': '+errors_array[key]+"</div>"
  catch

window.markWithError = (field_selector, error) ->
  $(field_selector).after "<div class='formError'>" + error + "</div>"
  row.find("label:first").wrap "<div class='field_with_errors'></div>"
  $(field_selector).wrap "<div class='field_with_errors'></div>"

window.clearErrors = () ->
  $('input').each ->
    row = $(this).parents('.field')
    row.find('.formError').remove()
    row.find('.field_with_errors').find('>input,>label').unwrap()