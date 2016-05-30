<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="gameNcl" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<!-- Regioes -->
		<regionBase>
			<region id="rgTv">
				<region id="rgMedia" height="100%" width="100%" zIndex="2"/>
				<region id="rgGame" height="100%" width="100%" zIndex="1"/>
			</region>
		</regionBase>
		<!-- Descritores -->
		<descriptorBase>
			<descriptor id="dMedia" region="rgMedia"/>
			<descriptor focusIndex="luaGame" id="dGame" region="rgGame"/>
		</descriptorBase>
		
		<!-- Conectores -->
		<connectorBase>
			<causalConnector id="onBeginStartStop">
				<simpleCondition role="onBegin"/>
				<compoundAction operator="seq">
					<simpleAction role="start"/>	
					<simpleAction role="stop"/>
				</compoundAction>				
			</causalConnector>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onBeginStartN">
				<simpleCondition role="onBegin"/>
				<simpleAction max="unbounded" qualifier="par" role="start"/>
			</causalConnector>
			<causalConnector id="onPausePause">
				<simpleCondition role="onPause"/>
				<simpleAction role="pause"/>
			</causalConnector>
			<causalConnector id="onResumeReesume">
				<simpleCondition role="onResume"/>
				<simpleAction role="resume"/>
			</causalConnector>
			<causalConnector id="onStopStop">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop"/>
			</causalConnector>
			<causalConnector id="onBeginSet">
				<simpleCondition role="onBegin"/>
				<simpleAction role="set" value="$newSound"/>
			</causalConnector>
			<causalConnector id="onEndSet">
				<simpleCondition role="onEnd"/>
				<simpleAction role="set" value="$newSound"/>
			</causalConnector>
		</connectorBase>
		
	</head>
	<body>
		<!-- Porta -->
		<port component="lua" id="pBody"/>
		<!-- Medias -->
		<media id="programSettings" type="application/x-ginga-settings">
			<property name="service.currentKeyMaster" value="luaGame"/>
		</media>

		<media id="lua" src="colisionEx.lua" descriptor="dGame">
			<area id="media1Play"/>
			<area id="media1Mute"/>
			<area id="media1Start"/>
			
			<area id="media2Play"/>
			<area id="media2Mute"/>
			<area id="media2Start"/>
			
			<area id="media3Play"/>
			<area id="media3Mute"/>
			<area id="media3Start"/>		
		</media>
		
		<media id="media1" src="media/media1.mp4" descriptor="dMedia">
			<property name="soundLevel"/>			
		</media>
		
		<media id="media2" src="media/media2.mp3" descriptor="dMedia">
			<property name="soundLevel"/>			
		</media>
		
		<media id="media3" src="media/media3.mp3" descriptor="dMedia">
			<property name="soundLevel"/>			
		</media>
				
		<!-- Links das midias , 2x -->
		<!-- Media 1 -->
		<link id="inciaMedia1" xconnector="onBeginStart">
			<bind component="lua" interface="media1Play" role="onBegin"/>
			<bind component="media1" role="start"/>
		</link>
		<link id="StartMedia1" xconnector="onBeginStartStop">
			<bind component="lua" interface="media1Start" role="onBegin"/>
			<bind component="media1" role="start"/>
			<bind component="media1" role="stop"/>
		</link>
		<link id="PausaMedia1" xconnector="onPausePause">
			<bind component="lua" interface="media1Play" role="onPause"/>
			<bind component="media1" role="pause"/>
		</link>
		<link id="ResumeMedia1" xconnector="onResumeReesume">
			<bind component="lua" interface="media1Play" role="onResume"/>
			<bind component="media1" role="resume"/>
		</link>
		<link id="StopMedia1" xconnector="onStopStop">
			<bind component="lua" interface="media1Play" role="onEnd"/>
			<bind component="media1" role="stop"/>
		</link>
		<link id="MuteMedia1" xconnector="onBeginSet">
			<bind component="lua" interface="media1Mute" role="onBegin"/>
			<bind component="media1" role="set" interface="soundLevel">
				<bindParam name="newSound" value="0"/>				
			</bind>
		</link>
		<link id="UnMuteMedia1" xconnector="onEndSet">
			<bind component="lua" interface="media1Mute" role="onEnd"/>
			<bind component="media1" role="set" interface="soundLevel">
				<bindParam name="newSound" value="1"/>				
			</bind>
		</link>
		
		<!-- Media 2 -->
		<link id="inciaMedia2" xconnector="onBeginStart">
			<bind component="lua" interface="media2Play" role="onBegin"/>
			<bind component="media2" role="start"/>
		</link>
		<link id="StartMedia2" xconnector="onBeginStartStop">
			<bind component="lua" interface="media2Start" role="onBegin"/>
			<bind component="media2" role="start"/>
			<bind component="media2" role="stop"/>
		</link>
		<link id="PausaMedia2" xconnector="onPausePause">
			<bind component="lua" interface="media2Play" role="onPause"/>
			<bind component="media2" role="pause"/>
		</link>
		<link id="ResumeMedia2" xconnector="onResumeReesume">
			<bind component="lua" interface="media2Play" role="onResume"/>
			<bind component="media2" role="resume"/>
		</link>
		<link id="StopMedia2" xconnector="onStopStop">
			<bind component="lua" interface="media2Play" role="onEnd"/>
			<bind component="media2" role="stop"/>
		</link>
		<link id="MuteMedia2" xconnector="onBeginSet">
			<bind component="lua" interface="media2Mute" role="onBegin"/>
			<bind component="media2" role="set" interface="soundLevel">
				<bindParam name="newSound" value="0"/>				
			</bind>
		</link>
		<link id="UnMuteMedia2" xconnector="onEndSet">
			<bind component="lua" interface="media2Mute" role="onEnd"/>
			<bind component="media2" role="set" interface="soundLevel">
				<bindParam name="newSound" value="1"/>				
			</bind>
		</link>
		
		<!-- Media 3 -->
		<link id="inciaMedia3" xconnector="onBeginStart">
			<bind component="lua" interface="media3Play" role="onBegin"/>
			<bind component="media3" role="start"/>
		</link>
		<link id="StartMedia3" xconnector="onBeginStartStop">
			<bind component="lua" interface="media3Start" role="onBegin"/>
			<bind component="media3" role="start"/>
			<bind component="media3" role="stop"/>
		</link>
		<link id="PausaMedia3" xconnector="onPausePause">
			<bind component="lua" interface="media3Play" role="onPause"/>
			<bind component="media3" role="pause"/>
		</link>
		<link id="ResumeMedia3" xconnector="onResumeReesume">
			<bind component="lua" interface="media3Play" role="onResume"/>
			<bind component="media3" role="resume"/>
		</link>
		<link id="StopMedia3" xconnector="onStopStop">
			<bind component="lua" interface="media3Play" role="onEnd"/>
			<bind component="media3" role="stop"/>
		</link>
		<link id="MuteMedia3" xconnector="onBeginSet">
			<bind component="lua" interface="media3Mute" role="onBegin"/>
			<bind component="media3" role="set" interface="soundLevel">
				<bindParam name="newSound" value="0"/>				
			</bind>
		</link>
		<link id="UnMuteMedia3" xconnector="onEndSet">
			<bind component="lua" interface="media3Mute" role="onEnd"/>
			<bind component="media3" role="set" interface="soundLevel">
				<bindParam name="newSound" value="1"/>				
			</bind>
		</link>
		
	</body>
</ncl>
