exec = require('child_process').exec


task "build", "Compile coffee files to JS", ->
    console.log "Compile main file..."
    command = "coffee -o public/javascripts/ -c client/*.coffee"
    exec command, (err, stdout, stderr) ->
        if err
            console.log "Error: \n #{err}"
            process.exit 1
        else
            console.log "Compilation succeeded."

task "watch", "Watch & compile coffee files", ->
    console.log "Watching and compiling coffee files..."
    command = "coffee -w -o public/javascripts/ -c client/*.coffee"
    exec command