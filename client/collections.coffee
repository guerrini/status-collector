@app = window.app ? {}

class StatusReport extends Backbone.Collection
	model: app.StatusPost
	url:   'api/reports'

@app.StatusReport = new StatusReport