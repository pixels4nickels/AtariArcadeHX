package gamelibs;

@:native ("ScoreManager")
extern class ScoreManager {
	/**
	 * The ScoreManager provides the ability to track and update the user's score
	 * including automatically tweening the text field's value, and formatting
	 * the score with a prefix, leading zeroes, and commas.
	 * @class ScoreManager
	 * @param {Text} text The EaselJS text instance to update.
	 * @constructor
	 */
	public function new (text:String):Void;

	/**
	 * The current score.
	 * @property score
	 * @type Number
	 * @default 0
	 */
	public var score:Int;

	/**
	 * The score currently displayed.
	 * @property displayScore
	 * @type Number
	 * @default 0
	 * @protected
	 */
	public var displayScore:Float;

	/**
	 * The number of leading zeroes to use in the displayed score.
	 * @property leading
	 * @type Number
	 * @default 0
	 */
	public var leading:Float;

	/**
	 * A string prefix to display along with the score.
	 * @property prefix
	 * @type String
	 * @default ""
	 */
	public var prefix:String;

	/**
	 * A reference to the text instance that will be updated.
	 * @property text
	 * @type Text
	 * @protected
	 */
	public var text:String;

	public var milestones:Array <Dynamic>;

	/**
	 * Initialize the ScoreManager by creating a new Tween and setting the textRef.
	 * @method initialize
	 * @param {Text} text A reference to the EaselJS Text instance used to display the score.
	 * @protected
	 */
	public function initialize (text:String):Void;

	/**
	 * Returns a properly formatted display string of the current score, even in mid-tween. Used to manually
	 * set a score Text object.
	 * @method getScore
	 * @param actualScore Get the actual score, not the display score, but formatted.
	 * @return {String} The current score, formatted.
	 */
	public function getScore (actualScore:Dynamic):String;

	/**
	 * Sets the score by running a tween.
	 * @method setScore
	 * @param {Number} newScore New score value.
	 * @param {Boolean} tween If the ScoreManager should tween the score (true) or just set it (false). The
	 * default is true.
	 */
	public function setScore (newScore:Float, tween:Bool):Void;

	/**
	 * Add some score points to the overall score. This is the recommended method for scoring a game.
	 * @method addScore
	 * @param {Number} score The points to add
	 * @param {Boolean} tween If the score should tween or not. The default is true.
	 */
	public function addScore (score:Float, tween:Bool):Void;

	/**
	 * Remove some score points from the overall score. This is the recommended method for
	 * giving a penalty to the player.
	 * @method subtractScore
	 * @param {Number} score The points to remove
	 * @param {Boolean} tween If the score should tween or not. The default it true.
	 */
	public function subtractScore (score:Float, tween:Bool):Void;

	/**
	 * If there is a text reference, update it immediately.
	 * @method update
	 * @param {Number} prefix Minimum number of values for the score. Ex: If the score is 100, and prefix is 6, text is
	 * updated to read "000,100".
	 */
	public function update (prefix:Float):Void;

	/**
	 * After the score update, check if it beats any milestones. If a milestone is beat, the array discards the
	 * milestone and informs the Achievement manager.
	 * @method checkMilestones
	 * @private
	 */
	public function checkMilestones ():Void;

	/**
	 * Set a score milestone, which includes score to beat and the game reference.
	 * @method setMilestone
	 * @param {Number} score Score value to beat.
	 * @param {game} game Reference to the game being played.
	 * @private
	 */
	public function setMilestone (score:Float, game:Game):Void;


}