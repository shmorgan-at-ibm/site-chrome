gulp    = require 'gulp'
minHTML = require 'gulp-minify-html'

gulp.task 'min-html', ->
  gulp.src ['src/html/nav.html', 'src/html/footer.html']
    .pipe minHTML {'quotes': true}
    .pipe gulp.dest 'build'
