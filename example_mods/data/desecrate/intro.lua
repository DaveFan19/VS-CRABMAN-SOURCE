local bg = 'introshit' -- don't touch this

local allowCountdown = false

function onStartCountdown() -- No countdown yet
    if not allowCountdown then
	    return Function_Stop
	end

	if allowCountdown then
	    return Function_Continue
	end
end

function onCreatePost() -- sprite loading
	makeLuaSprite('intro', 'introshit/'..bg, 0, 0)
	scaleObject('intro', 1.1, 1.19);
	runTimer('fadeTimer', 3, 1)

	addLuaSprite('intro', true)
	setObjectCamera('intro', 'camOther')
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
	    doTweenAlpha('delete', 'intro', 0, 0.5, 'backIn')
		allowCountdown = true
		startCountdown()
		
	end
end

function onTweenCompleted(tag) -- everything goes bye bye
    if tag == 'delete' then
	    removeLuaSprite('intro', true)
		
	end
end

local timeshit = 0;
enabled = false
function onUpdate()
	if enabled == true then
 doTweenY('opponentFloatshit', 'dad', (math.sin(timeshit*5)*40), 0.001, 'linear')
 timeshit = timeshit+0.01
	end
 end

function onBeatHit()
	if curBeat == 175 then
		enabled = true
	end
end