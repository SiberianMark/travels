//引入基础gulp模块
var gulp= require('gulp');
//引入处理模块
//less预编译
var less=require('gulp-less');
//多文件索引，用于多文件编译作为对应表
var sourcemaps=require('gulp-sourcemaps');
//引入异常处理模块,当出现异常时不终止watch事件（gulp-plumber），并提示我们出现了错误（gulp-notify）。
var notify=require('gulp-notify');
var plumber = require('gulp-plumber');



//新建任务编译多个less文件,另外生成sourcemap保证当less有各种引入关系是可以进行查找
gulp.task('compliLess',function(){
	return gulp.src('./less/*.less')
			   .pipe(sourcemaps.init())//创建索引文件
			   .pipe(plumber({errorHandler:notify.onError('Error <%= error.message %>')}))//监控错误
			   .pipe(less())
			   .pipe(sourcemaps.write())
			   .pipe(gulp.dest('./css'));
});

//监听自动编译
gulp.task('watchComLess',function(){
	gulp.watch('./less/*.less',['compliLess']);
});



//引入压缩js模块
var uglify = require('gulp-uglify')
//引入合并模块
var concat = require('gulp-concat');
//新建任务压缩部分js文件
gulp.task('uglfyCommon',function(){
	return gulp.src(['./src/js/common/jquery.min.js','./src/js/common/jquery.cookie.js','./src/js/common/doT.min.js','./js/common/config.js','./src/js/common/function.js'])
		.pipe(concat('common.js'))
		.pipe(uglify())
		.pipe(gulp.dest('./dist/js'))
});

//新建任务压缩部分js文件
gulp.task('uglfyJS',['uglfyCommon'],function(){
	gulp.src(['./src/js/JMCalender.js','./src/js/JMDate.js','./src/js/head.js.js','./src/js/head.css.js','./src/js/head.meta.js'])
		.pipe(uglify())
		.pipe(gulp.dest('./dist/js'))
});

gulp.task('watchUgJs',function(){
	gulp.watch('./src/js/**/*.js')
})


//压缩html,css
//npm install gulp-minify-css gulp-htmlmin run-sequence --save-dev
var sequence = require('run-sequence'),
	htmlmin = require('gulp-htmlmin'),
	cssmin = require('gulp-minify-css');


var htmlSrc = './*.html';

var cssSrc = './css/**/*.css';



gulp.task('htmlmin',function(){
	var options={
		removeComment:true,//清除HTML注释
		collapseWhitespace:true,//清除空格
		removeEmptyAttributes:true,//清除属性空格
		removeScriptTypeAttrbutes:false,//清除script的type
		removeStyleLinkTypeAttributes: true,
		minifyJS:true,
		minifyCSS:true
	}
	return gulp.src(htmlSrc)
		   	   .pipe(htmlmin(options))
		   	   .pipe(gulp.dest('./dist',{base:'.'}))
})

gulp.task('cssmin',function(){
	return gulp.src(cssSrc)
		  	   .pipe(cssmin())
		  	   .pipe(gulp.dest('./dist/css',{base:'.'}))
});

// hash自动修改版本号
// 

var rev = require('gulp-rev'),
	revCollector = require('gulp-rev-collector'),
	assetRev = require('gulp-asset-rev');


var revJsSrc = './js/**/*.js';

var revCssSrc = './css/**/*.css'

var revFontsSrc='./fonts/*';
var revImgSrc=['./img/*'];

var revHtmlSrc = './*.html';

//生成revfile
//	js
gulp.task('revJs',function(){
	return gulp.src(revJsSrc)
			   .pipe(rev())
			   .pipe(rev.manifest())
			   .pipe(gulp.dest('./rev/js'))
})
//	css
gulp.task('revCss',function(){
	return gulp.src(revCssSrc)
			   .pipe(rev())
			   .pipe(rev.manifest())
			   .pipe(gulp.dest('./rev/css'))
})
//	img
gulp.task('revImg',function(){
	return gulp.src(revImgSrc)
			   .pipe(rev())
			   .pipe(rev.manifest())
			   .pipe(gulp.dest('./rev/img'))
})
//	fonts
gulp.task('revFonts',function(){
	return gulp.src(revFontsSrc)
			   .pipe(rev())
			   .pipe(rev.manifest())
			   .pipe(gulp.dest('./rev/fonts'))
})

//替换html对应版本号
gulp.task('revHtml',function(){
	var options={
		removeComment:true,//清除HTML注释
		collapseWhitespace:true,//清除空格
		removeEmptyAttributes:true,//清除属性空格
		removeScriptTypeAttrbutes:false,//清除script的type
		removeStyleLinkTypeAttributes: true,
		minifyJS:true,
		minifyCSS:true
	}
	return gulp.src(['./rev/**/*.json',revHtmlSrc])
			   .pipe(revCollector())
			   .pipe(htmlmin(options))//压缩html
			   .pipe(gulp.dest('./dist',{base:'.'}))
})
//替换css对应版本号
gulp.task('revColCss',function(){
	return gulp.src(['./rev/**/*.json',revCssSrc])
			   .pipe(revCollector())
			   .pipe(cssmin())//压缩css
			   .pipe(gulp.dest('./dist/css',{base:'.'}))
})
gulp.task('default',function(done){
	sequence(
		['uglfyJS'],
		['compliLess'],
		['revJs','revCss','revImg','revFonts'],
		['revHtml'],
		['revColCss'],
		done);
})