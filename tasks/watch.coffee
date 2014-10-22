gulp = require 'gulp'

gulp.task 'watch', ['lint-spaces'], ->
  gulp.watch 'src/html/*.html', ['include']
  gulp.watch 'src/scss/**/*.scss', ['styles']
  gulp.watch 'src/js/*.js', ['scripts']
