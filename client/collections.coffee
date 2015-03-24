@app = window.app ? {}

class StatusReport extends Backbone.Collection
	model: app.models.StatusPost
	url:   '/status_posts'

@app.statusReport = new StatusReport