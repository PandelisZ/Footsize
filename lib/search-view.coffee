{SelectListView} = require 'atom-space-pen-views'
gists = require 'public-gists'


module.exports =
class MySelectListView extends SelectListView
 menu: (itemList) ->
   @editor = atom.workspace.getActiveTextEditor()
   @addClass('overlay from-top')
   @setItems(itemList)
   @panel ?= atom.workspace.addModalPanel(item: this)
   @panel.show()
   @focusFilterEditor()

 viewForItem: (item) ->
   "<li>#{item.name}</li>"

 confirmed: (item) ->
   console.log("#{item} was selected")
   @editor.insertText(item.code)
   @panel.hide()

 cancelled: ->
   console.log("This view was cancelled")
