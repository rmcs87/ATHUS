---Exemplo de uso do modulo <b>Media</b>.
--Sao criadas tres medias, que ao longo do tempo sao iniciadas, pausadas, e outros.
module('examples.mediaEx', package.seeall);

local media = require'athus.view.media'
local tool = require'athus.core.tools'

t = tool.Tools:new();

m1 = media.Media:new('media1','media1.mp4');

m2 = media.Media:new('media2','media2.mp3');

m3 = media.Media:new('media3','media3.mp3');

m1:start();
t:timer(5000,function() m1:pause(); end);
t:timer(10000,function()m1:resume(); end);
t:timer(15000,function()m1:stop(); end);
t:timer(20000,function()m1:start(); end);
t:timer(25000,function()m1:mute(); end);
t:timer(30000,function()m1:unMute(); end);