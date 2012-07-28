class RegexBackbone.Routers.RegexesRouter extends Backbone.Router
  initialize: (options) ->
    @regexes = new RegexBackbone.Collections.RegexesCollection()
    @regexes.reset options.regexes

  routes:
    "new"      : "newRegex"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  index: ->
    console.log "rendering index"
    @view = new RegexBackbone.Views.Regex()
    $("#regex").html(@view.render().el)