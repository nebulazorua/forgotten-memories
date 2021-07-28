package;

#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import Options;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;

using StringTools;

class StarterState extends MusicBeatState
{
  override public function create(){
    FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
    #if polymod
    polymod.Polymod.init({modRoot: "mods", dirs: ['introMod']});
    #end

    OptionUtils.bindSave();
    OptionUtils.loadOptions(OptionUtils.options);
    PlayerSettings.init();
    FlxG.save.bind('funkin', 'ninjamuffin99');

    Highscore.load();
    FlxG.switchState(new VideoState('assets/videos/cutscene.webm', new TitleState()));
  }

}
