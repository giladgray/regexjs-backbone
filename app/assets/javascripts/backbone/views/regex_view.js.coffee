class RegexBackbone.Views.Regex extends Backbone.View
  template: JST["backbone/templates/regex"]

  events:
    'click #addTest': 'addTest'
    'click #expand':  'expandAll'
    'click #clapse':  'collapseAll'
    'blur #regex':    'updateTests'
    'blur #options':  'updateTests'

  initialize: () =>
    # an empty list of tests
    @tests = []

  getRegex: () =>
    $("#error").hide()
    # try to create the RegExp object, display the error if it fails
    try
      regex = new RegExp(@$("#regex").val().replace(/\s/g, ''), @$("#options").val())
    catch err
      return @$("#error").show().text(err.message)

  addTest: () =>
    # create the test view
    testString = @$("#newTest").val()
    view = new RegexBackbone.Views.Test(testString: testString)

    # attach test HTML to page and store view in list
    @$("#tests").append(view.render().el)
    @tests.push(view)

    # erase the new test string field
    @$("#newTest").val('')

  updateTests: () =>
    # cache the regex
    regex = @getRegex()
    # update every test in the list
    test.update(regex) for test in @tests
    # TODO remove views from list if they have been removed from UI (by X button)

  expandAll: =>
    # expands all test results
    @$('.result').collapse('show')

  collapseAll: =>
    # collapses all test results
    @$('.result').collapse('hide')

  render: =>
    $(@el).html(@template())
    return this
