---Exemplo de uso do modulo <b>Animation</b>.
--Um loop que controla e exibe um Cronometro.
module('examples.animationEx', package.seeall);

local animation = require'athus.controller.animation'

x = 0;
y = 0;

---Funcao de atualizacao da logica da primeira animacao.
--@usage a cada ciclo adiciona 1 no valor de x.
function u1()
		x = x + 1;
end

---Funcao de desenho da primeira animacao.
--@usage a cada ciclo imprime o valor de x.
function d1()

    canvas:attrColor (0,0,0,255);
    canvas:clear();
    canvas:attrColor (255,255,255,255);
    canvas:attrFont ('vera', 20,'bold');
    canvas:drawText (100, 100, 'X = '.. x);
    canvas:flush();

end

---Funcao que cria a animação, e a inicia passando as funcoes de atualizacao e desenho correspondentes.
--@usage instancia um objeto de animacao, logo apos seta o perido desta em 1s. Apos isto inicia a animacao.
--@see athus.controller.animation
function init()
	--Animacao 1
	a1 = animation.Animation:new();
	a1:setPeriod(1000);
	a1:start(u1,d1);
end

init();