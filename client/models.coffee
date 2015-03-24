@app = window.app ? {}
@app.models ?= {}
csrf_token = ($ 'meta[name="csrf-token"]').attr('content')

$.ajaxSetup({
	# headers: { authenticity_token: csrf_token } # Without get 405 (Padrino)
	# headers: { 'X_CSRF_TOKEN': csrf_token }  # Without get 403 (Rack)
	# Get 405 (Padrino)
	headers: { authenticity_token: csrf_token, 'X_CSRF_TOKEN': csrf_token }
})

class StatusPost extends Backbone.Model
	urlRoot: '/status_posts'
	defaults:
		id: null
		content: ''

@app.models.StatusPost = StatusPost


# $('body').bind('ajaxSend', (elm,xhr,s) ->
# 	if(s.type=='POST' || s.type=='PUT' || s.type=='DELETE')
# 		xhr.setRequestHeader('HTTP_X_CSRF_TOKEN',csrf_token)
# 		xhr.setRequestHeader('X_CSRF_TOKEN',csrf_token)
# 		xhr.setRequestHeader('authenticity_token',csrf_token)
# 	)