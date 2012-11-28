package gametemplate.src;

import gamelibs.multiplayer.GamePacket;
import gamelibs.multiplayer.FramePacket;
import easeljs.display.Stage;
import gamelibs.multiplayer.GameInfo;

@:expose ("Atari.currentGame.Game")
class Game {
	/**
	* The Game classes are meant to be used as a reference when creating new games.
	* @module Game
	*/

	/**
	* Notify the framework that the player has lost the game. The score and level should be updated
	* by the time this has been called. <b>This callback is required.</b>
	* @event onGameOver
	*/
	public function onGameOver(event:Dynamic):Void
	{

	}

	/**
	* Notify the framework that a level has been complete. The score and game level should updated
	* by the time this has been called. <b>This callback is required.</b>
	* @event onLevelComplete
	*/
	public function onLevelComplete(event:Dynamic):Void
	{

	}

	/**
	* Notify the framework that the game has been completed. The score, level, and number of lives
	* should be updated by the time this has been called. <b>This callback is required.</b>
	* @event onGameComplete
	*/
	public function onGameComplete(event:Dynamic):Void
	{

	}

	/**
	* Notify the framework that the user has lost a life. The score, game life count, and level
	* should be updated by the time this has been called. This callback is not required.
	* @event onLifeLost
	*/
	public function onLifeLost(event:Dynamic):Void
	{

	}

	/**
	* Notify the framework that the player has awarded an achievement. This is TBD, but achievements
	* will likely be stored in the user's profile, and may be shown to a user when they are achieved/received.
	* This callback is not required.
	* @event onGameAchievement
	* @param {Object|Achievement} achievement The achievement details. TBD.
	* @todo
	*/
	public function onGameAchievement(event:Dynamic):Void
	{

	}

	/**
	* An error has occurred in the game. This could either be a general fault, a detection of cheating,
	* or any other specific error case. The framework will log the error, and may display a dialog, or
	* end the game depending on the warning level. <b>This callback is required.</b>
	* @event gameError
	* @param {Object} error The "error" object, including the following properties:
	* <ol>
	*     <li>title: The error type or title</li>
	*     <li>message: The error message body</li>
	*     <li>errorLevel The level of the error, which determines how the framework
	* will handle it.<ul>
	*          <li>GameMediator.ERROR_NOTIFY: Minor errors, which can be logged</li>
	*          <li>GameMediator.ERROR_WARNING: Minor errors which can be displayed</li>
	*          <li>GameMediator.ERROR_CRITICAL: Major errors which prevent further gameplay</li>
	*      </ul></li>
	*  </ol>
	*/
	public function onGameError(event:Dynamic):Void
	{

	}

	/**
	* Notify the framework with a general notification from the game. This is an alternate method to
	* display messaging to the player that is not caused by an error. This callback is not required.
	* @event gameNotification
	* @param {Object|Notification} notification The notification object, which contains the following properties:
	* <ol>
	*     <li>title: The title of the notification</li>
	*     <li>message: The body content of the notification</li>
	* </ol>
	*/
	public function onGameNotification(event:Dynamic):Void
	{

	}




	/**
	* Create a new Game instance
	* @class Game
	* @constructor
	*/
	public function new (assets:Dynamic, stage:Stage, gameInfo:GameInfo):Void
	{

	}

	/**
	* Initialize the game. The initialization method is called externally by the
	* game framework to pass in the assets & stage. <b>This method is required.</b>
	* @method initialize
	* @param {Object} assets An object containing the loaded images, JSON, audio, etc.
	* @param {Stage} stage A reference to the EaselJS Stage
	* @param {GameInfo} gameInfo The information packet containing all the game info data.
	* a list of the players, the "room" name, and other pertinent info.
	*/
	public function initialize (assets:Dynamic, stage:Stage, gameInfo:GameInfo):Void
	{

	}

	/**
	* The user has chosen to continue by paying a token. The game must either resume where it left off
	* (if possible), or begin at the last level played. <b>This method is required.</b>
	* @method continueGame
	* @param keepPoints If the game should continue with the current score, or empty the score.
	*/
	public function continueGame (keepPoints:Dynamic):Void
	{

	}

	/**
	* The game is getting cleaned up, in preparation for a new game. Do any tasks
	* that need to happen (stop audio, timers, etc). <b>This method is required.</b>
	* @method destroy
	*/
	public function destroy ():Void
	{

	}

	/**
	* Get the game events/state for the current frame. This may return null some of the time, it
	* is up to your game to decide how to minimize the amount of framepackets being sent.
	* PLEASE READ: http://playerio.com/documentation/tutorials/building-flash-multiplayer-games-tutorial/synchronization
	* @method getFramePacket
	* @return {FramePacket} The current game packet for the frame.
	*/
	public function getFramePacket ():FramePacket
	{
		 return new FramePacket();
	}

	/**
	* Create a sync packet for the other games. This method is only called on host game instances to create
	* a synchronization packet for the other players. This is always fired after the game tick and frame packets
	* are collected. <b>All multi-player games require the getGamePacket method.</b>
	* @method getGamePacket
	* @return {GamePacket} The current game packet.
	*/
	public function getGamePacket ():GamePacket
	{
		  return new GamePacket();
	}
	/**
	* The framework has requested the current game state, usually after the player wins or loses.
	* <b>This method is required.</b>
	* @method getScore
	* @return {Object} An object containing properties for the current<ul>
	*     <li>score: A number representing the player's game score.</li>
	*     <li>level: A number representing how many levels the player has <i>started</i>.</li>
	*     <li>lives: The number of lives the user currently has. If they have lost, it should be zero.</li>
	* </ul>
	*/
	public function getScore ():Dynamic
	{

	}

	/**
	* Pause/Resume game. The actual pause/resume happens outside of the game, but
	* the individual games may need to respond to it (stop timers, etc). <b>This method is required.</b>
	* @method pause
	* @param paused Whether the game is paused or not.
	*/
	public function pause (paused:Dynamic):Void
	{

	}


	/**
	* A player has been disconnected from the current multiplayer game.
	* @method playerDisconnected
	*/
	public function playerDisconnected ():Void
	{

	}

	/**
	* The game has instructed the game to either reduce the experience due to bad FPS, or resume the high=
	* quality experience as framerate has returned to normal.
	* @method reduceFrameRate
	* @param {Boolean} reduce If the game should reduce the experience (true), or resume it (false).
	*/
	public function reduceFrameRate (reduce:Bool):Void
	{

	}

	/**
	* The user has chosen to restart the game. The game should restart from the beginning with zero score
	* and the default number of lives. <b>This method is required.</b>
	* @method restart
	*/
	public function restart ():Void
	{

	}

	/**
	 * Start playing. This method is called when the game is ready, and the user chooses to start it
	 * or the multiplayer game starts. <b>This method is required.</b>
	 * @method startGame
	 */
	public function startGame ():Void
	{

	}

	/**
	* Apply a sync packet from the server or a host player. This should overwrite the entire game's state
	* to keep all the games synchronized. This is always applied before player actions and the game tick.
	* <b>Only games with full synchronization require the sync command.</b>
	* @method sync
	* @param {GamePacket} packet The game state object sent by the host.
	*/
	public function sync (packet:GamePacket):Void
	{

	}

	/**
	* Tick the game. Games will not manage their own tick functionality. While a game is in progress,
	* tick will be called by an external manager class. It will be up to the game class to run the required
	* logic during a tick, including updating the stage. <b>This method is required.</b> The stage
	* will be updated after the tick completes.
	* @method tick
	*/
	public function tick ():Void
	{

	}

	/**
	* Apply other player's game actions. This is injected into your game as packets from other players are received.
	* Note that this is always fired after sync packets are applied, and before the game tick.
	* <b>All multi-player games require the updatePlayers()method.</b>
	* @method updatePlayers
	* @param {Array} packets A list of FramePackets for the other players.
	* This list will contain a unique id for each player.
	*/
	public function updatePlayers (packets:Array <Dynamic>):Void
	{

	}

}