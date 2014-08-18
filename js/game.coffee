DISPLAY_WIDTH = 304
DISPLAY_HEIGHT = 320
enchant()
core = {}
charas = []


# ------------------------------------------------------------------------

class GameScene extends Scene
  constructor: ->
    super()
    @bg = new Sprite(DISPLAY_WIDTH, DISPLAY_HEIGHT)
    @map = new Map1()
    @player = new Player(chara: "reimu", map: @map, x: 120, y: 120)
    @chara1 = new Character(chara: "sanae", x: "4", y: "5", frame:"0", map: @map, player: @player)
    @chara2 = new Character(chara: "sakuya", x: "5", y: "8", frame:"0", map: @map, player: @player)
    @chara3 = new Character(chara: "marisa", x: "15", y: "15", frame:"0", map: @map, player: @player)
    charas.push(@chara1)
    charas.push(@chara2)
    charas.push(@chara3)
    player = @player
    @pad = new Pad()
    @pad.x = 192
    @pad.y = 210

    @addChild(@map)
    @addChild(@player)
    @addChild(@chara1)
    @addChild(@chara2)
    @addChild(@chara3)
    @addChild(@pad)
# ------------------------------------------------------------------------
class SubGameScene extends Scene
  constructor: (px,py, map)->
    super()
    @bg = new Sprite(DISPLAY_WIDTH, DISPLAY_HEIGHT)
    @map = map
    @player = new Player(chara: "reimu", map: @map, x: px, y: 5)
    @pad = new Pad()
    @pad.x = 192
    @pad.y = 210

    @addChild(@map)
    @addChild(@player)
    @addChild(@pad)
  onenterframe: ->
    if @player.y < 0
      core.popScene()

# ------------------------------------------------------------------------



window.onload = ->
  core = new Core DISPLAY_WIDTH, DISPLAY_HEIGHT
  core.fps = 24
  assets = []
  assets.push('./img/chara/miku.png')
  assets.push('./img/chara/honoka.png')
  assets.push('./img/chara/kotori.png')
  assets.push('./img/chara/umi.png')
  assets.push('./img/chara/eri.png')
  assets.push('./img/chara/nozomi.png')
  assets.push('./img/chara/nico.png')
  assets.push('./img/chara/rin.png')
  assets.push('./img/chara/hanayo.png')
  assets.push('./img/chara/kayo.png')
  assets.push('./img/chara/maki.png')
  assets.push('./img/chara/tohou.png')
  assets.push('./img/chara/reimu.png')
  assets.push('./img/chara/marisa.png')
  assets.push('./img/chara/sanae.png')
  assets.push('./img/chara/sakuya.png')
  assets.push('./img/map/map1.png')
  core.preload assets


  core.onload = ->
    @gameScene = new GameScene()
    @pushScene(@gameScene)
  core.start()


# ------------------------------------------------------------------------
checkPosition = (x, y)->
  console.log "x=" + x + ",y=" + y
# ------------------------------------------------------------------------
isChara = (name) ->
  switch name
    when "miku"
      return core.assets['./img/chara/miku.png']
    when "honoka"
      return core.assets['./img/chara/honoka.png']
    when "kotori"
      return core.assets['./img/chara/kotori.png']
    when "umi"
      return core.assets['./img/chara/umi.png']
    when "eri"
      return core.assets['./img/chara/eri.png']
    when "nozomi"
      return core.assets['./img/chara/nozomi.png']
    when "nico"
      return core.assets['./img/chara/nico.png']
    when "rin"
      return core.assets['./img/chara/rin.png']
    when "hanayo"
      return core.assets['./img/chara/hanayo.png']
    when "kayo"
      return core.assets['./img/chara/kayo.png']
    when "maki"
      return core.assets['./img/chara/maki.png']
    when "reimu"
      return core.assets['./img/chara/reimu.png']
    when "marisa"
      return core.assets['./img/chara/marisa.png']
    when "sanae"
      return core.assets['./img/chara/sanae.png']
    when "sakuya"
      return core.assets['./img/chara/sakuya.png']

# ------------------------------------------------------------------------
charaStop = (state) ->
  switch state
    when 'down'
      return 1
    when 'left'
      return 4
    when 'right'
      return 7
    when 'up'
      return 10

# ------------------------------------------------------------------------

class Map1 extends Map
  constructor: ->
    super(16,16)
    @image = core.assets['./img/map/map1.png']

    mapArray = [
      [ 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 166, 166, 166, 166, 166, 166, 166, 11, 11, 11, 166, 166, 166, 166, 166, 166, 166, 166 ]
    ]


    collision = [
      [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1 ]
    ]

    @loadData(mapArray)
    @collisionData = collision

# ------------------------------------------------------------------------

class Map2 extends Map
  constructor: ->
    super(16,16)
    @image = core.assets['./img/map/map1.png']

    mapArray = [
      [ 166, 166, 166, 166, 166, 166, 166, 166, 11, 11, 11, 166, 166, 166, 166, 166, 166, 166, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166 ]
      [ 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166 ]
    ]


    collision = [
      [ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ]
      [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
    ]

    @loadData(mapArray)
    @collisionData = collision
# ------------------------------------------------------------------------
class Character extends Sprite
  constructor: (options)->
    @tohou = ["marisa", "reimu", "sanae", "sakuya"]
    @chara = options.chara
    @map = options.map
    @player = options.player
    super(32,32)
    @image = isChara(@chara)
    @frame = options.frame
    @x     = options.x * 16
    @y     = options.y * 16
    @tick = 0
    @count = 0
    @rand = Math.floor(Math.random()*4)
  isTohou: ->
    return @tohou.indexOf(@chara) != -1

  onenterframe: ->
    if @count > 5
      @rand = Math.floor(Math.random()*5)
      @count = 0
    else
      @count++

    if @rand == 0
      @state ='down'
      @frame = @tick % 2 * 2
      @tick++
      @y += 4
      if @map.hitTest( @x + 15 , @y + 32) or @intersect(@player)
        @y -= 4
    else if @rand == 1
      if @isTohou()
        @frame = @tick % 3 + 3
      else
        @frame = @tick % 2 * 2 + 3
      @state ='left'
      @tick++
      @x -= 4
      if @map.hitTest( @x + 4, @y + 29) or @intersect(@player)
        @x += 4
    else if @rand == 2
      if @isTohou()
        @frame = @tick % 3 + 6
      else
        @frame = @tick % 2 * 2 + 6
      @state ='right'
      @tick++
      @x += 4
      if @map.hitTest( @x + 20 , @y + 29) or @intersect(@player)
        @x -= 4
    else if @rand == 3
      @y -= 4
      if @map.hitTest( @x + 15, @y + 25) or @intersect(@player)
        @y += 4
      @state = 'up'
      @frame = @tick % 2 * 2 + 9
      @tick++


    else
      @frame = charaStop(@state)


# ------------------------------------------------------------------------

class Player extends Sprite
  constructor: (options)->
    @tohou = ["marisa", "reimu", "sanae", "sakuya"]
    @chara = options.chara
    @map = options.map
    super(32,32)
    @image = isChara(@chara)
    @frame = 0
    @tick = 0
    @x = options.x
    @y = options.y
    @state = ''

  isTohou: ->
      return @tohou.indexOf(@chara) != -1


  onenterframe: ->
    i = charas.length
    if(@y > DISPLAY_HEIGHT)
      gameScene = new SubGameScene(@x,@y, new Map2())
      @y = DISPLAY_HEIGHT - 20 #少しキャラの位置を戻しておく
      core.pushScene(gameScene)

    if core.input.down
      @state ='down'
      @frame = @tick % 2 * 2
      @tick++
      @y += 4
      while i >= 0
        if @map.hitTest( @x + 15 , @y + 32) or @intersect(charas[i--])
          @y -= 4
    else if core.input.left
      if @isTohou()
        @frame = @tick % 3 + 3
      else
        @frame = @tick % 2 * 2 + 3
      @state ='left'
      @tick++
      @x -= 4
      while i >= 0
        if @map.hitTest( @x + 4, @y + 29) or @intersect(charas[i--])#charaの頭分+29
          @x += 4
    else if core.input.right
      if @isTohou()
        @frame = @tick % 3 + 6
      else
        @frame = @tick % 2 * 2 + 6
      @state ='right'
      @tick++
      @x += 4
      while i >= 0
        if @map.hitTest( @x + 20 , @y + 29) or @intersect(charas[i--]) #charaの頭分+29
          @x -= 4
    else if core.input.up
      @y -= 4
      while i >= 0
        if @map.hitTest( @x + 15, @y + 25) or @intersect(charas[i--])
          @y += 4
      @state = 'up'
      @frame = @tick % 2 * 2 + 9
      @tick++

      # if @map.hitTest( @x, @y + 29)
      #   @y += 4

    else
      @frame = charaStop(@state)






