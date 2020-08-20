#!/usr/bin/env node
const sh = require('shelljs');
const fs = require('fs');
const _ = require('lodash');
const ShapeShifter = require('regpack/shapeShifter');

const DEBUG = process.argv.indexOf('--debug') >= 0;

const g_shaderExternalNameMap = {};

sh.cd( __dirname );

const run = cmd =>
{
    const code = sh.exec( cmd ).code;
    if( code !== 0 )
        process.exit( code );
};

const regpacked = js =>
{
    let result = new ShapeShifter().preprocess(js, {
        hashWebGLContext: true,
        contextVariableName: 'g',
        contextType: 1,
        reassignVars: true,
        varsNotReassigned: ['g','a'],
        useES6: true,
    })[2].contents;

    // Global in for loop conflicts with let-delcared vars later.
    if( result.startsWith('for(') )
        result = result.replace('for(', 'for(let ');

    return result;
};

const buildShaderExternalNameMap = shaderCode =>
{
    let i = 0;
    _.uniq( shaderCode.match(/[vau]_[a-zA-Z0-9]+/g) )
        .forEach( x => g_shaderExternalNameMap[x] = `x${i++}` );
};

const minifyShaderExternalNames = code =>
{
    for( let k in g_shaderExternalNameMap )
        code = code.replace( new RegExp( k, 'g' ), g_shaderExternalNameMap[k] );

    return code;
};

const generateShaderFile = () =>
{
    run( 'mono tools/shader_minifier.exe --no-renaming-list main --format js -o build/shaders.js --preserve-externals shaders/*' );

    let shaderCode = fs.readFileSync('build/shaders.js', 'utf8');

    buildShaderExternalNameMap( shaderCode );

    shaderCode = minifyShaderExternalNames( shaderCode );

    shaderCode = shaderCode
        .split('\n')
        .map( x => x.replace(/^var/, 'export const') )
        .join('\n');

    fs.writeFileSync('src/shaders.gen.ts', shaderCode);
};

const wrapWithHTML = js =>
{
    let htmlTemplate = fs.readFileSync( DEBUG ? 'src/index.debug.html' : 'src/index.release.html', 'utf8' );

    if( !DEBUG ) htmlTemplate = htmlTemplate
        .split('\n')
        .map( line => line.trim() )
        .join('')
        .trim();

    return htmlTemplate.replace('__CODE__', js.trim());
};

const main = () =>
{
    sh.mkdir( '-p', 'build' );
    fs.writeFileSync( 'src/debug.gen.ts', `export const DEBUG = ${DEBUG ? 'true' : 'false'};\n` );

    console.log('Minifying shaders...');
    generateShaderFile();
    console.log('Compiling typescript...');
    run( 'tsc --outDir build' );
    console.log('Rolling up bundle...');
    run( 'rollup -c' + ( DEBUG ? ' --config-debug' : '' ));

    let x = fs.readFileSync('build/bundle.js', 'utf8');
    x = minifyShaderExternalNames( x );
    x = x.replace(/const /g, 'let ');
    if( !DEBUG ) x = regpacked( x );
    x = wrapWithHTML( x );

    fs.writeFileSync( 'build/out.html', x );

    if( !DEBUG )
    {
        run( 'tools/advzip/advzip-linux-x64 --shrink-insane -i 10 -a out.zip build/out.html' );

        const zipStat = fs.statSync('out.zip');
        const percent = Math.floor((zipStat.size / 13312) * 100);

        console.log(''); 
        console.log(`  Final bundle size: ${zipStat.size} / 13312 bytes (${percent} %)`);
        console.log(''); 
    }
};

main();