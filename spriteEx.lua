---Exemplo de uso do modulo <b>Sprite</b>.
--Aqui temos uma animacao em Sprites, que a cada 25s muda o estado da animacao.
--A Animcao se trata de um avatar se movimentando nas quatro direcoes.
module('examples.spritesEx', package.seeall);

local sprite = require'athus.view.sprite'
local animation = require'athus.core.animation'
local tools = require'athus.core.tools'

s = nil;
--- Funcao de update da animcao.
function update()	
	s:nextFrame();
end

---Funcao de desenho da animacao.
function draw()
	canvas:clear();
	canvas:compose(20,20,s:getImg());
	canvas:flush();
end

s = sprite.Sprite:new('imgs/robo.png' , 322 , 200 , 40.25 , 40);

a1 = animation.Animation:new();
a1:setPeriod(200);
a1:start(update,draw);


tool = tools.Tools:new();
tool:timer(2500,function() s:setState(1) end);
tool:timer(5000,function() s:setState(2) end);
tool:timer(7500,function() s:setState(3) end);
tool:timer(10000,function() s:setState(4) end);
tool:timer(12500,function() s:setState(5) end);
tool:timer(15000,function() s:setState(6) end);
tool:timer(17500,function() s:setState(7) end);
tool:timer(20000,function() s:setState(8) end);
