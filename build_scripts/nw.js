const fs = require('fs');

if (process.argv.length === 2) {
    console.error('Expected at least one argument!');
    process.exit(1);
}

var func = {
    "-r" : run,
    "-b" : build
}[process.argv[2]];

var isTest = process.argv[2] == "-r";

if (func == null)
{
    console.log("error use -r or -b arguments");
}

try{
    fs.mkdirSync("bin");
} catch(err) {
    if (err.code !== 'EEXIST') throw err;
}

createPackageFile(isTest);
copyHtmlFiles();
copyIconFile();
copyDataFiles();

var builder = createBuilder();
func(builder);

function run(nw) {
    nw.run().then(function () {
        console.log('all done!');
    }).catch(function (error) {
        console.error(error);
    });
}

function build(nw) {
    nw.options.flavor = "normal";

    nw.build().then(function () {
        fs.copyFileSync("./binaries/ffmpeg.dll", "./build/clapp-player/win64/ffmpeg.dll");
        console.log('all done!');
    }).catch(function (error) {
        console.error(error);
    });
}

function createBuilder() {
    var NwBuilder = require('nw-builder');
    var nw = new NwBuilder({
        files: './bin/**', // use the glob format
        platforms: ['win64'],
        version: '0.38.4',
        winIco: "./icons/icon.ico"
    });

    nw.on('log', console.log);

    return nw;
}

function createPackageFile (isTest) {
    var package = {
        "name" : process.env.npm_package_name + isTest ? "_test" : "",
        "version" : process.env.npm_package_version,
        "main": "index.html",
        "window" : {
            "icon" : "./icon.png"
        },
        "dependencies": {
            "@cliqz/adblocker": "^0.12.0"
        }
    }

    fs.writeFileSync("./bin/package.json", JSON.stringify(package), 'utf-8');
}

function copyHtmlFiles()
{
    fs.copyFileSync("./html/index.html", "./bin/index.html");
}

function copyIconFile()
{
    fs.copyFileSync("./icons/icon.png", "./bin/icon.png");
}

function copyDataFiles()
{
    fs.copyFileSync("./data/easylist.txt", "./bin/easylist.txt");
}