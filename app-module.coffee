colors      = require 'colors'
path        = require 'path'
program     = require 'commander'
fs 			= require 'fs'

global.VERSION  = JSON.parse(fs.readFileSync( path.join( __dirname, 'package.json'),'utf8')).version
global.DEBUG    = process.env.DEBUG or false
global.PLATFORM = process.platform  # darwin | linux | win32

Core               = require 'plethora-atlas-core'
homeDir            = Core.getHomeDir()
global.homeDir 	   = homeDir 
global.modulesDir  = path.join( __dirname, 'node_modules/' )

global.modules     = [] # STORES LOADED MODULES NAMES
global.config      = {}
global.keys 	   = {}

module.exports = new Promise((resolve,reject)->

		Core.initConfig({ version: global.VERSION })
		.then((res)->

			global.Helpers     = Core.Helpers
			Core.loadModules(program)
			Core.init({ program: program })
			resolve({ msg: "Initializing..." })

		).catch(console.log)

).catch(console.log)


