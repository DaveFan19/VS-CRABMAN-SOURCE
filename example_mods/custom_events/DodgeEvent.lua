function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('spacebar');
    precacheImage('laser')
	precacheSound('Dodged');
end

function onEvent(name, value1, value2)
    dadX = getProperty('dad.x')
    dadY = getProperty('dad.y')
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('spacebar', 'spacebar', 400, 200);
    luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 25, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
	scaleLuaSprite('spacebar', 0.50, 0.50); 
    addLuaSprite('spacebar', true); 

    makeAnimatedLuaSprite('laser', 'laserblast', dadX-130, dadY-320);
    luaSpriteAddAnimationByPrefix('laser', 'laser', 'laser', 25, true);
    addLuaSprite('laser', true); 
    luaSpritePlayAnimation('laser', 'laser');

	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   
   Dodged = true;
   playSound('laser_moment', 0.7);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('spacebar');
   removeLuaSprite('laser');
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);

   
   elseif tag == 'Died' and Dodged == true then
   Dodged = false

   end
end