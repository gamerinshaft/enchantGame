DISPLAY_WIDTH = 320
DISPLAY_HEIGHT = 320
enchant()
core = {}

class Player extends Sprite
  constructor: ->
    super(33,32)
    @image = core.assets['./img/chara/miku.png']
    @frame = 0
    @x = 120
    @y = 120


window.onload = ->
  core = new Core DISPLAY_WIDTH, DISPLAY_HEIGHT
  core.fps = 10
  assets = []
  assets.push('./img/chara/miku.png')
  core.preload assets


  core.onload = ->
    # player = new Sprite(33,32)
    # player.image = core.assets['./img/chara/miku.png']
    # player.frame = 0
    # player.x = 120
    # player.y = 120
    @player = new Player()
    core.rootScene.addChild(@player)
  core.start()
