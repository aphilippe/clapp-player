if (process.argv.length === 2) {
    console.error('Expected at least one argument!');
    process.exit(1);
}

var NwBuilder = require('nw-builder');
var nw = new NwBuilder({
    files: './bin/**', // use the glob format
    platforms: ['win64'],
    version: '0.38.4'
});

nw.on('log', console.log);

if (process.argv[2] === '-r') {
    nw.run().then(function () {
        console.log('all done!');
    }).catch(function (error) {
        console.error(error);
    });
}

if (process.argv[2] === '-b') {
    nw.options.flavor = "normal";
    nw.build().then(function () {
        console.log('all done!');
    }).catch(function (error) {
        console.error(error);
    });
}