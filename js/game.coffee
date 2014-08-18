DISPLAY_WIDTH = 320
DISPLAY_HEIGHT = 320
enchant()
core = {}
map = {}





















class Player extends Sprite
  constructor: (options)->
    @tohou = ["marisa", "reimu", "sanae", "sakuya"]
    @chara = options.chara

    switch @chara
      when "miku"
        super(33,32)
        @image = core.assets['./img/chara/miku.png']
        break
      when "honoka"
        super(31, 37)
        @image = core.assets['./img/chara/honoka.png']
        break
      when "kotori"
        super(32, 37)
        @image = core.assets['./img/chara/kotori.png']
        break
      when "umi"
        super(32, 37)
        @image = core.assets['./img/chara/umi.png']
        break
      when "eri"
        super(37, 37)
        @image = core.assets['./img/chara/eri.png']
        break
      when "nozomi"
        super(37, 37)
        @image = core.assets['./img/chara/nozomi.png']
        break
      when "nico"
        super(37, 37)
        @image = core.assets['./img/chara/nico.png']
        break
      when "rin"
        super(29, 36)
        @image = core.assets['./img/chara/rin.png']
        break
      when "hanayo"
        super(29, 36)
        @image = core.assets['./img/chara/hanayo.png']
        break
      when "kayo"
        super(29, 36)
        @image = core.assets['./img/chara/kayo.png']
        break
      when "maki"
        super(29, 36)
        @image = core.assets['./img/chara/maki.png']
        break
      when "reimu"
        super(32, 32)
        @image = core.assets['./img/chara/reimu.png']
        break
      when "marisa"
        super(32, 32)
        @image = core.assets['./img/chara/marisa.png']
        break
      when "sanae"
        super(32, 32)
        @image = core.assets['./img/chara/sanae.png']
        break
      when "sakuya"
        super(32, 32)
        @image = core.assets['./img/chara/sakuya.png']
        break

    @frame = 0
    @tick = 0
    @x = 120
    @y = 120
    @state = ''



  isTohou: ->
      return @tohou.indexOf(@chara) != -1


  onenterframe: ->
    if core.input.down
      @state ='down'
      @frame = @tick % 2 * 2
      @tick++
      @y += 4
      checkPosition(@x, @y)
      if map.hitTest( @x + 15 , @y + 32)
        @y -= 4
    else if core.input.left
      if @isTohou()
        @frame = @tick % 3 + 3
      else
        @frame = @tick % 2 * 2 + 3
      @state ='left'
      @tick++
      @x -= 4
      checkPosition(@x, @y)
      if map.hitTest( @x + 4, @y + 29) #charaの頭分+29
        @x += 4
    else if core.input.right
      if @isTohou()
        @frame = @tick % 3 + 6
      else
        @frame = @tick % 2 * 2 + 6
      @state ='right'
      @tick++
      @x += 4
      checkPosition(@x, @y)
      if map.hitTest( @x + 20 , @y + 29) #charaの頭分+29
        @x -= 4
    else if core.input.up
      @y -= 4
      if map.hitTest( @x + 15, @y + 25)
        @y += 4
      @state = 'up'
      @frame = @tick % 2 * 2 + 9
      @tick++

      checkPosition(@x, @y)
      # if map.hitTest( @x, @y + 29)
      #   @y += 4

    else
      switch @state
        when 'down'
          @frame = 1
          break
        when 'left'
          @frame = 4
          break
        when 'right'
          @frame = 7
          break
        when 'up'
          @frame = 10
          break
        else































class rootMap extends Map
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





checkPosition = (x, y)->
  console.log "x=" + x + ",y=" + y

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
    @player = new Player(chara: "reimu")
    @map = new rootMap()
    map = @map
    core.rootScene.addChild(map)
    core.rootScene.addChild(@player)
  core.start()
