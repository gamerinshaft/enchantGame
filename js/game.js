// Generated by CoffeeScript 1.7.1
(function() {
  var Character, DISPLAY_HEIGHT, DISPLAY_WIDTH, GameScene, Map1, Map2, Player, SubGameScene, charaStop, charas, checkPosition, core, isChara,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  DISPLAY_WIDTH = 304;

  DISPLAY_HEIGHT = 320;

  enchant();

  core = {};

  charas = [];

  GameScene = (function(_super) {
    __extends(GameScene, _super);

    function GameScene() {
      var player;
      GameScene.__super__.constructor.call(this);
      this.bg = new Sprite(DISPLAY_WIDTH, DISPLAY_HEIGHT);
      this.map = new Map1();
      this.player = new Player({
        chara: "reimu",
        map: this.map,
        x: 120,
        y: 120
      });
      this.chara1 = new Character({
        chara: "sanae",
        x: "4",
        y: "5",
        frame: "0",
        map: this.map,
        player: this.player
      });
      this.chara2 = new Character({
        chara: "sakuya",
        x: "5",
        y: "8",
        frame: "0",
        map: this.map,
        player: this.player
      });
      this.chara3 = new Character({
        chara: "marisa",
        x: "15",
        y: "15",
        frame: "0",
        map: this.map,
        player: this.player
      });
      charas.push(this.chara1);
      charas.push(this.chara2);
      charas.push(this.chara3);
      player = this.player;
      this.pad = new Pad();
      this.pad.x = 192;
      this.pad.y = 210;
      this.addChild(this.map);
      this.addChild(this.player);
      this.addChild(this.chara1);
      this.addChild(this.chara2);
      this.addChild(this.chara3);
      this.addChild(this.pad);
    }

    return GameScene;

  })(Scene);

  SubGameScene = (function(_super) {
    __extends(SubGameScene, _super);

    function SubGameScene(px, py, map) {
      SubGameScene.__super__.constructor.call(this);
      this.bg = new Sprite(DISPLAY_WIDTH, DISPLAY_HEIGHT);
      this.map = map;
      this.player = new Player({
        chara: "reimu",
        map: this.map,
        x: px,
        y: 5
      });
      this.pad = new Pad();
      this.pad.x = 192;
      this.pad.y = 210;
      this.addChild(this.map);
      this.addChild(this.player);
      this.addChild(this.pad);
    }

    SubGameScene.prototype.onenterframe = function() {
      if (this.player.y < 0) {
        return core.popScene();
      }
    };

    return SubGameScene;

  })(Scene);

  window.onload = function() {
    var assets;
    core = new Core(DISPLAY_WIDTH, DISPLAY_HEIGHT);
    core.fps = 24;
    assets = [];
    assets.push('./img/chara/miku.png');
    assets.push('./img/chara/honoka.png');
    assets.push('./img/chara/kotori.png');
    assets.push('./img/chara/umi.png');
    assets.push('./img/chara/eri.png');
    assets.push('./img/chara/nozomi.png');
    assets.push('./img/chara/nico.png');
    assets.push('./img/chara/rin.png');
    assets.push('./img/chara/hanayo.png');
    assets.push('./img/chara/kayo.png');
    assets.push('./img/chara/maki.png');
    assets.push('./img/chara/tohou.png');
    assets.push('./img/chara/reimu.png');
    assets.push('./img/chara/marisa.png');
    assets.push('./img/chara/sanae.png');
    assets.push('./img/chara/sakuya.png');
    assets.push('./img/map/map1.png');
    core.preload(assets);
    core.onload = function() {
      this.gameScene = new GameScene();
      return this.pushScene(this.gameScene);
    };
    return core.debug();
  };

  checkPosition = function(x, y) {
    return console.log("x=" + x + ",y=" + y);
  };

  isChara = function(name) {
    switch (name) {
      case "miku":
        return core.assets['./img/chara/miku.png'];
      case "honoka":
        return core.assets['./img/chara/honoka.png'];
      case "kotori":
        return core.assets['./img/chara/kotori.png'];
      case "umi":
        return core.assets['./img/chara/umi.png'];
      case "eri":
        return core.assets['./img/chara/eri.png'];
      case "nozomi":
        return core.assets['./img/chara/nozomi.png'];
      case "nico":
        return core.assets['./img/chara/nico.png'];
      case "rin":
        return core.assets['./img/chara/rin.png'];
      case "hanayo":
        return core.assets['./img/chara/hanayo.png'];
      case "kayo":
        return core.assets['./img/chara/kayo.png'];
      case "maki":
        return core.assets['./img/chara/maki.png'];
      case "reimu":
        return core.assets['./img/chara/reimu.png'];
      case "marisa":
        return core.assets['./img/chara/marisa.png'];
      case "sanae":
        return core.assets['./img/chara/sanae.png'];
      case "sakuya":
        return core.assets['./img/chara/sakuya.png'];
    }
  };

  charaStop = function(state) {
    switch (state) {
      case 'down':
        return 1;
      case 'left':
        return 4;
      case 'right':
        return 7;
      case 'up':
        return 10;
    }
  };

  Map1 = (function(_super) {
    __extends(Map1, _super);

    function Map1() {
      var collision, mapArray;
      Map1.__super__.constructor.call(this, 16, 16);
      this.image = core.assets['./img/map/map1.png'];
      mapArray = [[166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 166, 166, 166, 166, 166, 166, 166, 11, 11, 11, 166, 166, 166, 166, 166, 166, 166, 166]];
      collision = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1]];
      this.loadData(mapArray);
      this.collisionData = collision;
    }

    return Map1;

  })(Map);

  Map2 = (function(_super) {
    __extends(Map2, _super);

    function Map2() {
      var collision, mapArray;
      Map2.__super__.constructor.call(this, 16, 16);
      this.image = core.assets['./img/map/map1.png'];
      mapArray = [[166, 166, 166, 166, 166, 166, 166, 166, 11, 11, 11, 166, 166, 166, 166, 166, 166, 166, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 8, 8, 8, 8, 8, 8, 8, 11, 11, 11, 8, 8, 8, 8, 8, 8, 8, 166], [166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166, 166]];
      collision = [[1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]];
      this.loadData(mapArray);
      this.collisionData = collision;
    }

    return Map2;

  })(Map);

  Character = (function(_super) {
    __extends(Character, _super);

    function Character(options) {
      this.tohou = ["marisa", "reimu", "sanae", "sakuya"];
      this.chara = options.chara;
      this.map = options.map;
      this.player = options.player;
      Character.__super__.constructor.call(this, 32, 32);
      this.image = isChara(this.chara);
      this.frame = options.frame;
      this.x = options.x * 16;
      this.y = options.y * 16;
      this.tick = 0;
      this.count = 0;
      this.rand = Math.floor(Math.random() * 4);
    }

    Character.prototype.isTohou = function() {
      return this.tohou.indexOf(this.chara) !== -1;
    };

    Character.prototype.onenterframe = function() {
      if (this.count > 5) {
        this.rand = Math.floor(Math.random() * 5);
        this.count = 0;
      } else {
        this.count++;
      }
      if (this.rand === 0) {
        this.state = 'down';
        this.frame = this.tick % 2 * 2;
        this.tick++;
        this.y += 4;
        if (this.map.hitTest(this.x + 15, this.y + 32) || this.intersect(this.player)) {
          return this.y -= 4;
        }
      } else if (this.rand === 1) {
        if (this.isTohou()) {
          this.frame = this.tick % 3 + 3;
        } else {
          this.frame = this.tick % 2 * 2 + 3;
        }
        this.state = 'left';
        this.tick++;
        this.x -= 4;
        if (this.map.hitTest(this.x + 4, this.y + 29) || this.intersect(this.player)) {
          return this.x += 4;
        }
      } else if (this.rand === 2) {
        if (this.isTohou()) {
          this.frame = this.tick % 3 + 6;
        } else {
          this.frame = this.tick % 2 * 2 + 6;
        }
        this.state = 'right';
        this.tick++;
        this.x += 4;
        if (this.map.hitTest(this.x + 20, this.y + 29) || this.intersect(this.player)) {
          return this.x -= 4;
        }
      } else if (this.rand === 3) {
        this.y -= 4;
        if (this.map.hitTest(this.x + 15, this.y + 25) || this.intersect(this.player)) {
          this.y += 4;
        }
        this.state = 'up';
        this.frame = this.tick % 2 * 2 + 9;
        return this.tick++;
      } else {
        return this.frame = charaStop(this.state);
      }
    };

    return Character;

  })(Sprite);

  Player = (function(_super) {
    __extends(Player, _super);

    function Player(options) {
      this.tohou = ["marisa", "reimu", "sanae", "sakuya"];
      this.chara = options.chara;
      this.map = options.map;
      Player.__super__.constructor.call(this, 32, 32);
      this.image = isChara(this.chara);
      this.frame = 0;
      this.tick = 0;
      this.x = options.x;
      this.y = options.y;
      this.state = '';
    }

    Player.prototype.isTohou = function() {
      return this.tohou.indexOf(this.chara) !== -1;
    };

    Player.prototype.onenterframe = function() {
      var gameScene, i, _results, _results1, _results2;
      i = charas.length;
      if (this.y > DISPLAY_HEIGHT) {
        gameScene = new SubGameScene(this.x, this.y, new Map2());
        this.y = DISPLAY_HEIGHT - 20;
        core.pushScene(gameScene);
      }
      if (core.input.down) {
        this.state = 'down';
        this.frame = this.tick % 2 * 2;
        this.tick++;
        this.y += 4;
        _results = [];
        while (i >= 0) {
          if (this.map.hitTest(this.x + 15, this.y + 32) || this.intersect(charas[i--])) {
            _results.push(this.y -= 4);
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      } else if (core.input.left) {
        if (this.isTohou()) {
          this.frame = this.tick % 3 + 3;
        } else {
          this.frame = this.tick % 2 * 2 + 3;
        }
        this.state = 'left';
        this.tick++;
        this.x -= 4;
        _results1 = [];
        while (i >= 0) {
          if (this.map.hitTest(this.x + 4, this.y + 29) || this.intersect(charas[i--])) {
            _results1.push(this.x += 4);
          } else {
            _results1.push(void 0);
          }
        }
        return _results1;
      } else if (core.input.right) {
        if (this.isTohou()) {
          this.frame = this.tick % 3 + 6;
        } else {
          this.frame = this.tick % 2 * 2 + 6;
        }
        this.state = 'right';
        this.tick++;
        this.x += 4;
        _results2 = [];
        while (i >= 0) {
          if (this.map.hitTest(this.x + 20, this.y + 29) || this.intersect(charas[i--])) {
            _results2.push(this.x -= 4);
          } else {
            _results2.push(void 0);
          }
        }
        return _results2;
      } else if (core.input.up) {
        this.y -= 4;
        while (i >= 0) {
          if (this.map.hitTest(this.x + 15, this.y + 25) || this.intersect(charas[i--])) {
            this.y += 4;
          }
        }
        this.state = 'up';
        this.frame = this.tick % 2 * 2 + 9;
        return this.tick++;
      } else {
        return this.frame = charaStop(this.state);
      }
    };

    return Player;

  })(Sprite);

}).call(this);
