// Require Gulp and Co.
var gulp       = require('gulp');
var sass       = require('gulp-sass');
var jshint     = require('gulp-jshint');
var scsslint   = require('gulp-scss-lint');
var lintspaces = require('gulp-lintspaces');

// Asset paths
var sassPath   = 'scss/**/*.scss';
var jsPath     = 'js/*.js';
var distPath   = 'dist/';

// Configuration objects
var sassConfig = { 'outputStyle': 'compressed' };
var lintConfig = { 'config': '.scss-lint.yml' };

// JavaScript tasks
gulp.task('scripts', function() {
  return gulp.src(jsPath)
    .pipe(jshint())
    .pipe(jshint.reporter('default'))
    .pipe(gulp.dest(distPath));
});

// SASS tasks
gulp.task('styles', function() {
  return gulp.src(sassPath)
    .pipe(scsslint(lintConfig))
    .pipe(sass(sassConfig))
    .pipe(gulp.dest(distPath));
});

// Watch files for changes
gulp.task('watch', function() {
  gulp.watch(sassPath, ['styles']);
  gulp.watch(jsPath, ['scripts']);
});

// Default task definition
gulp.task('default', ['scripts', 'styles', 'watch']);
