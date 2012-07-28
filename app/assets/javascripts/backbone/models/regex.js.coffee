class RegexBackbone.Models.Regex extends Backbone.Model
  paramRoot: 'regex'

  defaults:
    title: null
    pattern: null
    modifiers: null
    notes: null

class RegexBackbone.Collections.RegexesCollection extends Backbone.Collection
  model: RegexBackbone.Models.Regex
  url: '/regexes'
