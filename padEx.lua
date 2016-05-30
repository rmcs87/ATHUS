---Exemplo de uso do modulo <b>Pad</b>.
-- Exemplo semelhante ao spritesEx.lua, porem permite ao usuario controlar o avatar pela tela.
module('examples.padEx', package.seeall);

local sprite = require'athus.view.sprite'
local animation = require'athus.core.animation'
local eng = require'athus.core.engine'
local pad = require'athus.interaction.pad'

running = false;							--Variavel para controlar se o avatar corre ou n�o;

-- Funcao de atualizacao;
function update()
	-- Variaveis de controle das teclas; 
	local up = p1:getKey('CURSOR_UP');
	local down = p1:getKey('CURSOR_DOWN');
	local left = p1:getKey('CURSOR_LEFT');
	local rigth = p1:getKey('CURSOR_RIGHT');
	local one = p1:getKey('1');
	
	-- Variavel de controle de mudanca do avatar;
	local change = false;
	
	-- Caso alguma tecla tenha sido pressionada, ou esteja sendo pressionada o jogo e atualizado;
	if up == 'press' or up == 'release' then
		s:setState(2);
		s:setSpeed({0,-7.5});
		s:nextFrame();
		change = true;
	elseif down == 'press' or down == 'release' then
		s:setState(0);
		s:setSpeed({0,7.5});
		s:nextFrame();
		change = true;
	elseif left == 'press' or left == 'release' then
		s:setState(1);
		s:setSpeed({-7.5,0});
		s:nextFrame();
		change = true;
	elseif rigth == 'press' or rigth == 'release' then
		s:setState(3);
		s:setSpeed({7.5,0});
		s:nextFrame();
		change = true;
	else
		s:setSpeed({0,0});
		change = false;
	end
	
	-- Caso o avatar deva correr;
	if one == 'press'then
		s:setState(s:getState() + 4);
		running = true;
		local temp = s:getSpeed();
		s:setSpeed({temp[1] * 2 , temp[2] * 2});
	elseif one == 'release' and runnin == true then
		s:setState(s:getState() - 4);
		running = false;
	end
	
	-- Se houve mudanca a posicao � atualizada;
	if change == true then
		speedTemp = s:getSpeed();
		positionTemp = s:getPosition();		
		s:setPosition({positionTemp[1] + speedTemp[1] , positionTemp[2] + speedTemp[2]});
	end
end

-- Funcao de desenho do avatar;
function draw()
	e:clean();
	e:buffer(s);
	e:refresh();
end

-- Cria um novo controle;
p1 = pad.Pad:new();

-- Cria os sprites;
s = sprite.Sprite:new('imgs/robo.png' , 322 , 200 , 40.25 , 40);

--Cria o Controle de Tela
e = eng.Engine:new();

-- Cria a animcao;
a1 = animation.Animation:new();
a1:setPeriod(200);
a1:start(update,draw);