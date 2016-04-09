$LOAD_PATH.unshift "."

require 'pp'
require 'curses'
require 'ui'
require 'role'
require 'race'
require 'alignment'
require 'selection_screen'
require 'player'
require 'attribute_generator'
require 'game'
require 'yaml'
require 'data_loader'
require 'messages'

Game.new.run
