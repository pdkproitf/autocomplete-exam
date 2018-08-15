# Autocomplete for form

autocomplete = (event) ->
  input = event.target
  word_list = document.getElementById('word_list')
  # minimum number of characters before we start to generate suggestions
  min_characters = 1
  # clear any previously loaded options in the datalist
  word_list.innerHTML = ''
  if input.value.length < min_characters
    return
  else
    # abort any pending requests
    window.hinterXHR.abort()

    window.hinterXHR.onreadystatechange = ->
      if @readyState == 4 and @status == 200
        # We're expecting a json response so we convert it to an object
        response = JSON.parse(@responseText)
        if response and response.data
          response.data.forEach (item) ->
            # Create a new <option> element.
            option = document.createElement('option')
            option.value = item['word']
            # attach the option to the datalist element
            word_list.appendChild option
            return
      return

    window.hinterXHR.open 'GET', '/search/' + input.value, true
    window.hinterXHR.send()
  return

window.addEventListener 'load', ->
  # Add a keyup event listener to our input element
  word_input = document.getElementById('word_input')
  word_input.addEventListener 'keyup', (event) ->
    autocomplete event
    return
  window.hinterXHR = new XMLHttpRequest
  return
