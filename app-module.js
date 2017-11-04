// Generated by CoffeeScript 1.12.4
var Core, colors, fs, homeDir, path, program;

colors = require('colors');

path = require('path');

program = require('commander');

fs = require('fs');

global.VERSION = JSON.parse(fs.readFileSync(path.join(__dirname, 'package.json'), 'utf8')).version;

global.DEBUG = process.env.DEBUG || false;

global.PLATFORM = process.platform;

Core = require('plethora-atlas-core');

homeDir = Core.getHomeDir();

global.homeDir = homeDir;

global.modulesDir = path.join(__dirname, 'node_modules/');

global.modules = [];

global.config = {};

global.keys = {};

module.exports = new Promise(function(resolve, reject) {
  return Core.initConfig({
    version: global.VERSION
  }).then(function(res) {
    global.Helpers = Core.Helpers;
    Core.loadModules(program);
    Core.init({
      program: program
    });
    return resolve({
      msg: "Initializing..."
    });
  })["catch"](console.log);
})["catch"](console.log);
