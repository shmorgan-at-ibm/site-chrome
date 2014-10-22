gulp = require 'gulp'

gulp.task 'default', ['styles', 'scripts', 'html', 'min-html', 'watch', 'server']
