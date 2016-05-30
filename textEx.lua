---Exemplo de uso do modulo <b>Text</b>.
-- Este exemplo alinha o texto em formato justificado.<br><br>
--Este modulo possui funcionamento instavel se comparado aso demais, precisando ainda de 
-- mais testes e correcao de possiveis erros.
module('examples.textEx', package.seeall);

local text = require'athus.view.text'
local eng = require'athus.core.engine'


t = text.Text:new('teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste ',420,98);

t:attrColor('white');
t:attrHAlign('justify');
t:attrSize(18);
t:attrStyle('bold');
t:draw();
t:setPosition({12,12});

e = eng.Engine:new();

e:clean();
e:buffer(t);
e:refresh();