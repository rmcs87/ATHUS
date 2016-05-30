---Exemplo de uso do modulo <b>Net</b>.
--E criada uma conexao com a Google, e feita uma pesquisa estou com sorte com a palavra 'casa', exibindo na tela o resultado da consulta.<br><br>

module('examples.netEx', package.seeall);

local net = require'athus.interaction.net'
local tool = require'athus.core.tools'

t = tool.Tools:new();

function f1(s)
	t:exibeTexto(100,100, 'Data: ' .. s ,20, 'white');
end

function f2(s2)
	t:exibeTexto(100,100, 'Mng: ' .. s2 ,20, 'white');
	if s2 == 'connected' then
		n:send('get /search?hl=pt-BR&btnI&q=casa\n');
	end
end

n = net.Net:new('www.google.com.br', 80);

n:registerData(f1);
n:registerMng(f2);

n:connect();