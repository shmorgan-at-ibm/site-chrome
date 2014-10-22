gulp    = require 'gulp'
connect = require 'gulp-connect'

gulp.task 'server', ->
  connect.server
    root: 'build',
    port: 4000

