@app = window.app ? {}
@app.views = {}

class StatusReportView extends Backbone.View
	el: '#status-report'
	initialize: ->
		console.log '==== Initializing report view!'
		# events: 'sync reset change': 'render'
		@listenTo(@collection, 'sync', @render, @)
		# @collection.bind 'reset', @render, @
		@collection.fetch()
		console.log 'report:', @collection
	render: ->
		console.log '==== Rendering report (view)', @collection
		thelist = $(@el)
		thelist.empty()

		@collection.each (model) ->
			item = new @app.views.StatusReportPostView({model: model})
			thelist.append item.render().el
			@
		console.log '---- Rendering report (view) - finished'

class StatusReportPostView extends Backbone.View
	tagname: 'li'
	className: 'status-post'
	template: _.template($('#report-post-tmpl').html())
	initialize: ->
		console.log '==== Initializing report post (view)', @model.get('id')
		@listenTo @model, 'change', @render		
		@listenTo @model, 'add', @render	
		@listenTo @model, 'remove', @unrender	
		@render()
	render: ->
		console.log '==== Rendering report post (view)', @model.get('id')
		item_html = @template(@model.toJSON())
		console.log 'item html', item_html
		console.log 'element', $(@.el)
		console.log '---- Rendering report post (view) - finished'
		$(@el).html(item_html)
		@
	unrender: =>
		$(@el).remove()
	# remove: ->
	# add: ->


@app.views.StatusReportView = StatusReportView
@app.views.StatusReportPostView = StatusReportPostView
@app.statusReportView = new StatusReportView({collection: @app.statusReport})
@app.statusReportPostView = new StatusReportPostView({model: new @app.models.StatusPost})


# @app.statusReport.fetch()


# var el = ($ @app.statusList.get('el'))
# el.append '<span>Yo wassup</span>'