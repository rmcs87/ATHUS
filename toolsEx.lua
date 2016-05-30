---Exemplo de uso do modulo <b>Tools</b>.
--Este exemplo imprime na tela a altura do canvas de desenho, e após 5s imprime a largura do canvas de desenho.

module('examples.toolsEx', package.seeall);

local tools = require'athus.core.tools'

--funcao teste;
function f1()
	--Imprime a largura da tela;
	tool:exibeTexto(100,200,tool:getScreenWidth(),20, 'white' );
end

tool = tools.Tools:new();
--Imprime a altura da tela;
tool:exibeTexto(100,100,tool:getScreenHeigth(),20, 'white' );
--Apos 5s ira chamar a funcao f1;
tool:timer(5000,f1);
