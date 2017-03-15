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
global.config      = require "#{homeDir}/config"
global.config.keys = require "#{homeDir}/keys"
global.Helpers     = Core.Helpers
Core.createPackagesDir()

module.exports = ()->

	console.log "PlethoraThemes".cyan + " Atlas CLI v#{global.VERSION}".magenta + " [os:#{PLATFORM}]".gray + " [debug:#{global.DEBUG}]".gray
	Core.loadModules(program)
	Core.init(program)

