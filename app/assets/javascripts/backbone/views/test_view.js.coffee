testId = 0

class RegexBackbone.Views.Test extends Backbone.View
  template: JST["backbone/templates/test"]
  captureTemplate: JST["backbone/templates/capture"]

  tagName: 'li'
  className: 'test'

  events:
    'click .btn.remove': 'remove'
    'click .btn.resize': 'resize'
    'click .btn.clapse': 'collapse'

  initialize: () =>
    # unique incremental ID for every test
    @id = ++testId

  reset: () =>
    @$('.match').text('')
    @$('.captures').html('')

  update: (regex) =>
    @reset()
    string = @$('.string').val()
    return unless string? and string.length > 0

    matches = regex.exec(string)
    console.log string, " => ", matches

    if matches == null
      # sometimes it just doesn't work out
      @$('.match').val("no match!")
      @$el.removeClass('pass fail').addClass('fail')
    else
      # other times you print the matched string...
      @$('.match').val(matches[0])
      # and list the captures
      @$(".captures").append(@captureTemplate(capture: match)) for match in matches.slice(1)
      @$el.removeClass('pass fail').addClass('pass')

  resize: (evt) =>
    # make the test take up the full container width
    @$el.toggleClass('full')
    @toggleIcon @$('.btn.resize i'), 'icon-resize-full', 'icon-resize-small'

  collapse: ->
    # collapse behavior happens automatically, this just toggles the icon
    @toggleIcon @$('.btn.clapse i'), 'icon-minus', 'icon-plus'

  render: =>
    $(@el).html(@template(id: @id, string: @options.testString))
    return this

  toggleIcon: (iconEl, classA, classB) ->
    if(iconEl.hasClass(classA))
      iconEl.attr('class', classB)
    else
      iconEl.attr('class', classA)