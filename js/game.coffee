DISPLAY_WIDTH = 320
DISPLAY_HEIGHT = 320
enchant()
core = {}


class Player extends Sprite
  constructor: (options)->
    switch options.chara
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
    @frame = 0
    @tick = 0
    @x = 120
    @y = 120
    @state = ''
  onenterframe: ->
    if core.input.down
      @state ='down'
      @frame = @tick % 2 * 2
      @tick++
      @y += 4
    else if core.input.left
      @state ='left'
      @frame = @tick % 2 * 2 + 3
      @tick++
      @x -= 4
    else if core.input.right
      @state ='right'
      @frame = @tick % 2 * 2 + 6
      @tick++
      @x += 4
    else if core.input.up
      @state = 'up'
      @frame = @tick % 2 * 2 + 9
      @tick++
      @y -= 4
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


window.onload = ->
  core = new Core DISPLAY_WIDTH, DISPLAY_HEIGHT
  core.fps = 15
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
  core.preload assets


  core.onload = ->
    @player = new Player(chara: "miku")
    core.rootScene.addChild(@player)
  core.start()
