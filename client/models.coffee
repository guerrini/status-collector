@app = window.app ? {}
@app.models = {}

class StatusPost extends Backbone.Model
	url: 'status_posts'


@app.models.StatusPost = StatusPost