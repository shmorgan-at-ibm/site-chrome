gulp   = require 'gulp'
uglify = require 'gulp-uglify'
jshint = require 'gulp-jshint'

gulp.task 'scripts', ->
  gulp.src 'src/js/*.js'
    .pipe jshint()
    .pipe jshint.reporter 'default'
    .pipe uglify()
    .pipe gulp.dest 'build'
