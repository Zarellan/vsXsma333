package;

#if desktop
import Discord.DiscordClient;
#end
import haxe.Timer;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flash.text.TextField;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import flixel.system.FlxSound;
import Achievements;
import sys.FileSystem;
import flash.system.System;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;


using StringTools;

class Room1 extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.2'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	

	var camFollow:FlxObject;
	var camFollowPos:FlxObject;



	var blackTransition:FlxSprite;

	


	var logo1:FlxSprite;

	var bf1:FlxSprite;	
	var bf11:FlxSprite;	
	var bf2:FlxSprite;


	var cameraD:FlxSprite;

	var soundPlayed1:Bool = false;

	var soundPlayed2:Bool = false;




	var xSma333Dial:FlxSprite;


	





	


	//var timer:Float = 0; testing elapsed




	var house1:FlxSprite;

	var house2:FlxSprite;

	var woodTest:FlxSprite;








	var ySize:Int = 17000;

	









	var view:String;




	// dialogue variables starts

	var dialogue:FlxText;

	var diag1:Array<String> = ["N","o","w"," ","w","h","e","r","e"," ","d","i","d"," ","I"," ","p","l","a","c","e"," ","b","o","o","k"," ","o","f"," ","\"","h","o","w"," ","t","o"," ","c","r","a","f","t"," ","n","e","t","h","e","r","i","t","e"," ","p","i","c","k","a","x","e","\n","f","o","r"," ","b","e","g","i","n","n","e","r","s","\""];
	
	var diag2:Array<String> = ["h","e","y"," ","m","o","h","a","m","m","e","d"];

	//var diag2:Array<String> = ["w","h","a","t"," ","t","h","e"];

	//var diag3:Array<String> = ["w","h","a","t"," ","d","o"," ","y","o","u"," ","w","a","n","t"];


	var count:Int = 0;

	var dialogueBoxMc:FlxSprite;

	var dialogueRepeater:Bool = true;

	var canDiag:Bool = true;

	var time:Float = 0.05;

	var dialogueInt:Int = 1;

	var numbo:Int = 0;

	var canSkip:Bool = true;

	var camHUD1:FlxCamera;

	var camGame1:FlxCamera;

	var timeSkip:Float;


	var caseSkip:Bool = true;


	var numberor:Int;


	var diagVar:Int;

	var skipDone:Bool = false;


	var dialogueVar:Array<String>;


	// dialogue variables ends


	override function create()
	{
		FlxG.mouse.visible = true;
		FlxG.mouse.useSystemCursor = true;

		camGame1 = new FlxCamera();

		camHUD1 = new FlxCamera();
		camHUD1.bgColor.alpha = 0;

		



		//trace(Sys.environment()["USERNAME"]);
		/*if(Sys.environment()["USERNAME"] == "Felix")
			{
				//trace("it's you");
				//System.exit(0);
				MusicBeatState.switchState(new Arab());
			}
			else
				{
					trace("nvm");
				}*/

		var today = Date.now();
		

		
		
		//Application.current.window.alert("Message", "Title");

		//System.exit(0);

		

		

		//trace(music);


		

		

		//FlxTween.tween(musicSprite,  {alpha: 1}, 1 ,{ease: FlxEase.linear});



		


		if (today.getHours() < 6 || today.getHours() > 18)
			{
				view = 'minecraft view 2';
				//trace("go sleep");
			}
		else
			{
				view = 'minecraft view';
				//trace("oh nvm");
			}

			

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("in Xsma333 room", null);
		#end
		/* debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1')); */

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		//FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		FlxTransitionableState.skipNextTransIn = true;
		FlxTransitionableState.skipNextTransOut = true;

		persistentUpdate = persistentDraw = true;

		//var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(0).loadGraphic(Paths.image(view));
		bg.scrollFactor.set(0.35, 0.1);

		if (today.getHours() < 18 || today.getHours() > 6)
			{
				bg.setGraphicSize(3000,2500);
				//trace("go sleep");
			}
		else
			{
				bg.setGraphicSize(3000,2500);
				//trace("oh nvm");
			}
		//bg.setGraphicSize(3000,2500);
		bg.updateHitbox();
		bg.screenCenter();
		bg.x += 1020; 
		bg.y -= 200; 
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		

		woodTest = new FlxSprite(-2310,-3485).loadGraphic(Paths.image('map/MainMenu/room1'));
		//bg.scrollFactor.set(0, yScroll);
		//woodTest.setGraphicSize(13000,11000);
		woodTest.scale.set(1.07,1.07);
		//house2.updateHitbox();
		//woodTest.screenCenter();
		//woodTest.y += 670;
		//woodTest.x += 2950;
		woodTest.antialiasing = ClientPrefs.globalAntialiasing;
		woodTest.updateHitbox();
		add(woodTest);


		

		logo1 = new FlxSprite(-700,1180).loadGraphic(Paths.image('logo'));
		//logo1.scrollFactor.set(0, 0);
		logo1.setGraphicSize(10000,100);
		logo1.alpha = 0;
		logo1.updateHitbox();
		add(logo1);



		cameraD = new FlxSprite(340,740).loadGraphic(Paths.image('Black'));
		//cameraD.scrollFactor.set(0, 0);
		cameraD.setGraphicSize(50,50);
		cameraD.alpha = 0;
		cameraD.updateHitbox();
		cameraD.antialiasing = ClientPrefs.globalAntialiasing;



		blackTransition = new FlxSprite(-1000,-600).loadGraphic(Paths.image('Black'));
		blackTransition.scrollFactor.set(0, 0);
		//blackTransition.setGraphicSize(50,50);
		blackTransition.scale.set(3,3);
		//cameraD.alpha = 0;
		blackTransition.updateHitbox();
		blackTransition.antialiasing = ClientPrefs.globalAntialiasing;



		//FlxTween.tween(blackTransition,  {alpha: 0}, 1 ,{ease: FlxEase.circOut});

			new FlxTimer().start(0.25, function(tmr:FlxTimer)
					{
						
						FlxTween.tween(blackTransition,  {alpha: 0}, 0.25 ,{ease: FlxEase.linear});					
					});

		

		

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);


		

		

		

			
			//bf run
			var yPlace:Int = 800;
			bf1 = new FlxSprite(-80, -100 + yPlace);
			bf1.updateHitbox();
			bf1.y -= 0;
			//bf1.scrollFactor.set(0, 0);
			
			
			bf1.frames = Paths.getSparrowAtlas('bf_running');

			bf1.animation.addByIndices('run', 'idle', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, true);
			

			


			bf11 = new FlxSprite(0, 40 + yPlace);
			//bf11.scrollFactor.set(0, 0);
			
			
			bf11.frames = Paths.getSparrowAtlas('bf_legs');

			bf11.animation.addByIndices('runL', 'run legs', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, true);
			


			bf2 = new FlxSprite(0, -90 + yPlace);
			//bf2.scrollFactor.set(0, 0);
			
			bf2.frames = Paths.getSparrowAtlas('BOYFRIEND');

			bf2.animation.addByIndices('stop', 'BF idle dance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, true);
			
			bf2.flipX = true;



			//add(bf11);
			bf11.scale.set(0.5,0.5);
			bf11.updateHitbox();
			//add(bf1);
			bf1.scale.set(0.5,0.5);
			add(bf2);
			bf2.scale.set(0.5,0.5);
			bf2.updateHitbox();

			bf1.x += 250;
			bf2.x += 250;
			bf11.x += 250;

			bf1.antialiasing = ClientPrefs.globalAntialiasing;
			bf2.antialiasing = ClientPrefs.globalAntialiasing;
			bf11.antialiasing = ClientPrefs.globalAntialiasing;







			add(cameraD);


			xSma333Dial = new FlxSprite(230, 225);
			//bf2.scrollFactor.set(0, 0);
			
			xSma333Dial.frames = Paths.getSparrowAtlas('xsma333Dial');

			xSma333Dial.animation.addByIndices('stand', 'xsma333Dial stand', [0], "", 24, true);
			xSma333Dial.animation.addByIndices('headache', 'xsma333Dial headache', [0], "", 24, true);
			xSma333Dial.animation.addByIndices('oldXsma', 'xsma333Dial oldXsma333', [0], "", 24, true);
			xSma333Dial.scale.set(0.25,0.25);
			add(xSma333Dial);



			dialogueBoxMc = new FlxSprite(0 + 100,530).loadGraphic(Paths.image('dialogueBoxMc'));
			dialogueBoxMc.scrollFactor.set();
			dialogueBoxMc.setGraphicSize(1264 - 200,190);
			dialogueBoxMc.alpha = 0;
			//dialogueBoxMc.screenCenter();
			dialogueBoxMc.updateHitbox();
			add(dialogueBoxMc);

		


			dialogue = new FlxText(135, 570, 0, "", 32);
			dialogue.scrollFactor.set();
			//dialogue.x = 135 + 400;
			dialogue.setPosition(-68,535);
			dialogue.screenCenter();
			dialogue.x = 135;
			dialogue.y = 550;
			dialogue.setFormat(Paths.font("Minecraft.otf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

			dialogue.alpha = 1;
			//dialogue.letterSpacing = 1;

			add(dialogue);

			//FlxG.cameras.setDefaultDrawTarget(camGame1, false);
		


			//FlxG.cameras.setDefaultDrawTarget(camGame1, false);

			


			
			FlxG.cameras.reset(camGame1);
			//FlxG.cameras.add(camHUD1, false);
			//FlxG.cameras.add(camGame1, false);

			//woodTest.cameras = [camGame1];

			dialogueBoxMc.cameras = [camHUD1];
			dialogue.cameras = [camHUD1];

			//FlxG.cameras.add(camHUD1, false);

			//FlxG.cameras.add(camGame1, false);

			FlxG.cameras.add(camHUD1, false);

			//FlxG.cameras.setDefaultDrawTarget(camGame1, true);


			//camHUD1.visible = false;

			//FlxG.cameras.setDefaultDrawTarget(camGame1, true);


			//FlxCamera.defaultCameras = [camGame1];

			//FlxG.addCamera(camHUD1);
		
			var thingieVar = xSma333Dial;

			FlxG.watch.add(thingieVar, "x");
			FlxG.watch.add(thingieVar, "y");
			FlxG.watch.add(thingieVar.scale, "x");	
			FlxG.watch.add(thingieVar.scale, "y");
			

			///FlxG.camera.zoom = 0.1;

			//camHUD1.zoom = 0.5;

			//camGame1.zoom = 0.7;

			FlxG.camera.zoom = 1;

			add(blackTransition);

			cameraD.x = bf2.x + 50;

			cameraD.y = bf2.y;

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	/*function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('faisalConfirm1'), 0.7);
		trace('Giving achievement "friday_night_play"');
	} */
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{

		if (FlxG.sound.music.volume >= 0)
			{
			FlxG.sound.music.volume -= 0.015;
			}

			

		bf2.animation.play('stop');
		xSma333Dial.animation.play('stand');


		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		super.update(elapsed);

		FlxG.camera.follow(cameraD, null, 1);

		//var n:Int = 0;

		if (canDiag == true)
			{

				if (dialogueInt == 1 && canDiag)
					{
						count = 0;
						diagVar = 4;

						
								
						new FlxTimer().start(1, function(tmr:FlxTimer)
							{
								
								bf2.flipX = false;

								if (!soundPlayed1)
								FlxG.sound.play(Paths.sound('whoosh1'), 0.7);

								soundPlayed1 = true;
								new FlxTimer().start(0.5, function(tmr:FlxTimer)
									{
										
										bf2.flipX = true;

										if (!soundPlayed2)
										FlxG.sound.play(Paths.sound('whoosh2'), 0.7);

										soundPlayed2 = true;

										new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												
												FlxTween.tween(cameraD,  {x: bf2.x + 600}, 1 ,{ease: FlxEase.circOut});
												new FlxTimer().start(1, function(tmr:FlxTimer)
													{
														if (dialogueInt == 1)
															{
														count = 0;
														dialogue.text = "";
														canDiag = true;
														dialogueInt += 1;
														trace(dialogueInt);
														dialogueRepeater = true;
														//numbo += 1;
														//caseSkip = false;
															}
														
						
														
													});	
				
												
											});	
										
		
										
									});				

								
							});					
						
					
					}
		

			if (dialogueInt == 2 && canDiag)
				{

						
	
					onDialogue(diag1, diag1.length, true, 2, 2.5 ,"xsma333Sound",0.03);
					dialogueBoxMc.alpha = 1;
			
				}

				if (dialogueInt == 3 && canDiag)
					{
	
							
		
						onDialogue(diag2, diag2.length, true, 3, 2.5 ,"bfSound",0.05);
					
				
					}

					//onDialogue(diag1, diag1.length, true, 1, 2.5 ,"bfSound",0.05);// dialogueVar1 , diagVar1 , canSkip , numberOfDialogue , timeSkip
					//onDialogue(diag2, diag2.length, true, 2, 2.5 ,"xsma333Sound",0.05);
					//onDialogue(diag3, diag3.length, true, 3, 2.5 ,"xsma333Sound",0.05);
			}
			else
				{
					if (FlxG.keys.justPressed.Z && count >= diagVar && canSkip)
						{
							//numbo += 1;
							count = 0;
							dialogue.text = "";
							canDiag = true;
							dialogueInt += 1;
							trace(dialogueInt);
							//numbo += 1;
							dialogueRepeater = true;
							//caseSkip = false;
							
						}
					if (count >= diagVar && !canSkip)
						{
							new FlxTimer().start(timeSkip, function(tmr:FlxTimer)
								{
									if (!skipDone && count >= diagVar && !canSkip)
										{
											count = 0;
											dialogue.text = "";
											canDiag = true;
											dialogueInt += 1;	
											trace(dialogueInt);
											skipDone = true;
											dialogueRepeater = true;
											//caseSkip = false;
										}
									
								});
						}
				}


				FlxG.camera.follow(cameraD, null, 1);

				if (FlxG.keys.pressed.LEFT)
					{
						cameraD.x -= 20;
					}
				else if (FlxG.keys.pressed.RIGHT)
					{
						cameraD.x += 20;
					}

				if (FlxG.keys.pressed.DOWN)
					{
						cameraD.y += 20;
					}
				else if (FlxG.keys.pressed.UP)
					{
						cameraD.y -= 20;
					}
				
	}


	public function onDialogue(dialogueVar1:Array<String>,diagVar1:Int,canSkip1:Bool,numberOfDialogue:Int,timeSkip1:Float,charSound:String,time1:Float):Void
		{
				//numberor = 1;

				numberor = numberOfDialogue;

				//dialogueVar = diag1;

				dialogueVar = dialogueVar1;

				//diagVar = diag1.length;

				diagVar = diagVar1;

				//canSkip = true;

				canSkip = canSkip1;

				time = time1;

				if (!canSkip)
					{
						//timeSkip = 2.5;
						timeSkip = timeSkip1;
						skipDone = false;
					}
						if (dialogueRepeater == true)
							{
						new FlxTimer().start(time, function(tmr:FlxTimer)
							{
								
								
								if (count < dialogueVar.length && dialogueInt == numberor && canDiag)
									{
									dialogue.text += dialogueVar[count];
									count++;
									
								
								FlxG.sound.play(Paths.sound(charSound),0.7);
								dialogueRepeater = true;
									
									}
									else
										{
											if (dialogueInt == numberor)
												{
											canDiag = false;
											caseSkip = true;
												}
										}
							});
							dialogueRepeater = false;
							}
						//dialogue.text = "";

						if (FlxG.keys.justPressed.Z && count < diagVar && canSkip)
							{
								count = diagVar;
								dialogue.text = "";
								for (i in 0...diagVar)
									{
										dialogue.text += dialogueVar[i];
									}
							}
		}



}
