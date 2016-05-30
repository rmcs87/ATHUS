---Exemplo de uso do modulo de <b>Colision</b>.
--Sao criado dois objetos de jogo, onde um(avatar) e controlado pelo jogador,
--que pode se moviemntar pela tela, porem nao consegue passar por cima do segundo objeto (pedra). 
module('examples.colisionEx', package.seeall);
local sprite = require'athus.view.sprite'
local animation = require'athus.controller.animation'
local pad = require'athus.model.pad'
local colision = require 'athus.controller.colision'

running = false;							--Variavel para controlar se o avatar corre ou nao;

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
	local colided = false;
	
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
	
	-- Se houve mudanca a posicao e nao ha colisao � atualizada;
	if change == true then
		speedTemp = s:getSpeed();
		positionTemp = s:getPosition();		
		s:setPosition({positionTemp[1] + speedTemp[1] , positionTemp[2] + speedTemp[2]});
		
		colided = c:boxColisionByPair(s, w);
		-- Se houver colisao coloca o avatar junto ao obstaculo;
		if colided == true then
			if speedTemp[1] > 0 then
				s:setPosition({w:getPosition()[1]-s:getSize()[1]-1,s:getPosition()[2]});
			elseif speedTemp[1] < 0 then
				s:setPosition({w:getPosition()[1]+w:getSize()[1]+1,s:getPosition()[2]});
			elseif speedTemp[2] > 0 then
				s:setPosition({s:getPosition()[1],w:getPosition()[2]-s:getSize()[2]-1});
			elseif speedTemp[2] < 0 then
				s:setPosition({s:getPosition()[1],w:getPosition()[2]+w:getSize()[2]+1});
			end
		end		
	end
end

-- Funcao de desenho do avatar;
function draw()
	canvas:clear();
	position = s:getPosition();
	canvas:compose(position[1],position[2],s:getImg());
	position = w:getPosition();
	canvas:compose(position[1],position[2],w:getImg());
	canvas:flush();
end

-- Cria um novo controle;
p1 = pad.Pad:new();

-- Cria os sprites;
s = sprite.Sprite:new('imgs/robo.png' , 322 , 200 , 40.25 , 40);
w = sprite.Sprite:new('imgs/wall.jpg' , 300 , 300 , 300 , 300);
w:setPosition({50,50});

-- Cria objeto colisao;
c = colision.Colision:new();

-- Cria a animcao;
a1 = animation.Animation:new();
a1:setPeriod(200);
a1:start(update,draw);