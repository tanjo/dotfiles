var gulp = require('gulp');
var pug = require('gulp-pug');
var sass = require('gulp-sass');

gulp.task('pug', function() {
  return gulp.src(['./pug/**/*.pug'])
    .pipe(pug({
      pretty: true
    }))
    .pipe(gulp.dest('./'));
});

gulp.task('sass', function() {
  return gulp.src(['./sass/**/*.scss'])
    .pipe(sass())
    .pipe(gulp.dest('./css'));
});
