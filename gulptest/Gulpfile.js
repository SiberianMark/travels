/*
***前期准备
***安装gulp :cnpm install gulp --save-dev 
*************3.2.3、--save：将保存配置信息至package.json（package.json是nodejs项目配置文件）；
*************3.2.4、-dev：保存至package.json的devDependencies节点，不指定-dev将保存至dependencies节点；一般保存在dependencies的像这些express/ejs/body-parser等等。
*************3.2.5、为什么要保存至package.json？因为node插件包相对来说非常庞大，所以不加入版本管理，将配置信息写入package.json并将其加入版本管理，其他开发者对应下载即可（命令提示符执行npm install，则会根据package.json下载所有需要的包，npm install --production只下载dependencies节点的包）。**
*****************常用的插件*********************
****	(1)sass的编译(gulp-sass)
****    (2)自动添加css前缀(gulp-autoprefixer)
****    (3)压缩css(gulp-minify-css)
****    (4)js代码校验(gulp-jshint)
****    (5)合并js文件(gulp-concat)
****    (6)压缩js代码(gulp-uglify)
****    (7)压缩图片(gulp-imagemin)
****    (8)自动刷新页面(gulp-livereload)
****    (9)图片缓存，只有图片替换了才压缩(gulp-cache)
****    (10)更改提醒(gulp-notify)
****    (11)less的编译(gulp-less)
************************************************
可以一键安装上面所以插件，指令：
cnpm install gulp-less gulp-sass gulp-autoprefixer gulp-minify-css gulp-jshint gulp-concat gulp-uglify gulp-imagemin gulp-notify gulp-rename gulp-livereload gulp-cache --save-dev	
***安装可能需要的模块
**************gulp-concat:文件合并
**************gulp-uglify:js压缩
************* gulp-sass:sass编译
************* gulp-imagemin:图片压缩--------|图片会有所损耗
************* imagemin-pngquant:深度压缩------|图片会有所损耗
*************npm install gulp-imagemin imagemin-pngquant --save-dev
***
6. 注意事项（Attention）

watch 的时候路径不要用 './path'，直接使用 '/path' 即可不然会导致新增文件无法被 watch。
gulp 对于 one after one 的任务链，需要加 return，比如 gulp clean
*/



// 1.引入基础库gulp
var gulp = require('gulp');
//2.引入需完成任务所需的插件，如文件合并gulp-concat，需先安装
var concat=require('gulp-concat');
var uglify=require('gulp-uglify');

//图片压缩require
var imagemin=require('gulp-imagemin');//图片压缩
var pngquant=require('imagemin-pngquant');//深度压缩

//图片压缩task
gulp.task('imagemin',function(){
	return gulp.src('./src/img/**/*.{png,jpg,gif,svg}')//导入源文件
			   .pipe(imagemin({
			   	 progressive:true,//无损压缩JPG
			   	 svgoPlugins:[{removeViewBox:false}],
			   	 use:[pngquant()]//使用pngquant进行深度压缩
			   }))
			   .pipe(gulp.dest('dist/image'));//输出路径
});

//网页自动刷新（文件变动后即时刷新页面）
var paths=['./src/js/function.js','./src/js/common.js'];
//3.利用四个gulp API 写项目的自动化构建任务，比如合并几个JS文件

gulp.task('concatUg',function(){//注册任务
	return gulp.src(paths)//引入要合并的文件--return 习惯上用上会比较好，因为这是gulp用来做依赖实现并行或者同步执行任务的方式；
	.pipe(concat('libs.js'))//合并成libs
	.pipe(uglify())//合并完进行文件压缩
	.pipe(gulp.dest('dist/js'));//输出到dist/js文件夹内
});


//4.执行已经注册好的gulp任务
// 在cmd gulp contact
// 
// 5.通过watch监控并自动化执行任务重新合并压缩
gulp.task('watchConcatUg',function(){
	gulp.watch(paths,['concatUg']);
});



//6.修改执行命令,一键执行
gulp.task("default",['concatUg','concatConfig','watchConcatUg']);
// 
// 
//二.1.修改设计实现同步执行任务
//二 2. 合并common,function之后再合并压缩config.js
//二 4. 增加任务
gulp.task('concatConfig',['concatUg'],function(){//注册任务
	//获取源文件
	return gulp.src(['dist/js/libs.js','./src/js/config.js'])
	.pipe(concat('libsconfig.js'))//合并
	.pipe(uglify())//压缩
	.pipe(gulp.dest('dist/js'))//输出
});

// 源文件common.js 12k;function.js 37k;config.js 39k; 压缩合并libsconfig.js 42k   12+37+39-42/12+37+39>50% 提高50%以上















// 合并压缩注意事项：
// 
/*
***src参数可以用匹配模式也可以特定文件有
***合并的顺序问题有讲究吗？有，放在前面的文件会先合并在生成文件的顶部
***合并的全局污染问题？有可能，所以在合并之前要确保合并文件没有全局污染问题，这个可以通过构建工具进行检查，或者保证合并的文件是模块化处理的
***如何判断是否可以合并？保证没有全局污染
***合并压缩之后是否可以使用；可以
***为何有多任务执行顺序的问题，因为我们知道一个项目里面有太多的文件js,css,less,img等，所以一个项目肯定会存在很多个不同的任务，所以
***需要同步的任务大多数是后一个任务需要依赖前一个任务的输出，如合并压缩之后结果再与其他文件进行合并压缩，并行一般只两个任务没有依赖输出关系，例如js压缩以及CSS压缩就没什么关系
***多任务时的执行顺序问题。gulp的运行顺序不同于grunt，是并行的，可用return 定义成依赖，
***例如：在 Gulp 里，即使你像下面这样，将任务 release 定义为依赖另外两个任务 clean, minify，实际在运行 release 之前，clean 和 minify 仍是并行运行的。
//gulp.task('clean', function(){
//   return gulp.src("./dist/*.js", { read: false }).pipe(rimraf());
// });
//gulp.task('minify', function(){
//    return gulp.src('./js/*.js').pipe(uglify()).pipe(gulp.dest("./dist/js"));
// });
// gulp.task('release', ['clean', 'minify'], function(){
//    // do stuff
// });
//
//比较完美地解决了这一问题
//gulp.task('clean', function(){
    return gulp.src("./dist/*.js", { read: false }).pipe(rimraf());
// });
// gulp.task('minify', ['clean'], function(){
//     return gulp.src('./js/*.js').pipe(uglify()).pipe(gulp.dest("./dist/js"));
// });
// gulp.task('release', ['clean', 'minify'], function(){
//    // do stuff
// });
***最终解决方案：国内的 Teambition 团队开源了 gulp-sequence ，以及国外开发者开发的 run-sequence 均能很好地解决这个问题。它们提供了类似的调用方式，下面的代码演示如何使用 run-sequence 按顺序地运行多个或多组 Gulp 任务：
var runSequence = require('run-sequence');
gulp.task('default', function(callback) {
    runSequence('clean',
        ['less', 'scripts'],
        'watch',
        callback);
});
 */
