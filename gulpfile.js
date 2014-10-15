// Require Gulp and Co.
var gulp       = require('gulp');
var sass       = require('gulp-sass');
var jshint     = require('gulp-jshint');
var scsslint   = require('gulp-scss-lint');
var lintspaces = require('gulp-lintspaces');
var connect    = require('gulp-connect');
var include    = require('gulp-file-include');

// Asset paths
var htmlPath   = 'html/*.html';
var sassPath   = 'scss/**/*.scss';
var jsPath     = 'js/*.js';
var distPath   = 'dist/';
var buildPath   = 'build/';

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
  return gulp.src([sassPath, '!scss/shared/bourbon/**/*.scss', '!scss/shared/_reset.scss'])
    .pipe(scsslint(lintConfig))
    .pipe(sass(sassConfig))
    .pipe(gulp.dest(distPath));
});

// Include HTML partials in primary layout
gulp.task('include', function() {
  gulp.src(['html/index.html'])
    .pipe(include())
    .pipe(gulp.dest(distPath));
});

// Watch files for changes
gulp.task('watch', function() {
  gulp.watch(htmlPath, ['include']);
  gulp.watch(sassPath, ['styles']);
  gulp.watch(jsPath, ['scripts']);
});

// Web server
gulp.task('server', function() {
  connect.server({
    root: distPath,
    port: 4000
  });
});

// Default task definition
gulp.task('default', ['scripts', 'styles', 'server', 'include', 'watch']);
