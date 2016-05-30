---Exemplo teste do modulo <b>TileSet</b>.
--Este exemplo mostra como criar um tileSet e retirar dele um Tile qualquer.
module('examples.tsEx', package.seeall);

local tile = require'athus.view.tileSet'
local tools = require'athus.core.tools'

---Funcao de desenho da animacao.
function draw(c)
	canvas:clear();
	canvas:compose(20,20,c);
	canvas:flush();
end

t = tile.TileSet:new('imgs/ts.png' , 256 , 1024 , 32 , 32);



draw(t:getImg());

tool = tools.Tools:new();
tool:timer(5000,function() t:setTile(12); draw(t:getImg()); end);
