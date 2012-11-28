package atari;

@:native ("GameBootstrap")
extern class GameBootstrap {

	/**
	* Initialize the GameBootstrap.
	* @method initialize
	* @static
	*/
	public static function initialize():Void;

	/**
	 * The EaselJS stage element.
	 * @property stage
	 * @type HTMLCanvasElement
	 * @static
	 * @protected
	 */
	public static var stage = null; // Reference to an Easel Stage

	/**
	 * A reference to the actual HTML canvas.
	 * @property canvas
	 * @type HTMLCanvasElement
	 * @static
	 * @protected
	 */
	public static var canvas = null;

	/**
	 * The last-loaded game ID, such as "pong". The id determines the manifest that is loaded.
	 * @property gameId
	 * @type String
	 * @static
	 * @protected
	 */
	public static var gameId = null; // ID of current game (eg: "pong")

	/**
	 * The baseUrl that the last game request used.
	 * @property baseUrl
	 * @type String
	 * @static
	 * @protected
	 */
	public static var baseUrl = null;

	/**
	 * The id-based list of loaded assets for the last gameAssets.
	 * @property gameAssets
	 * @type Object
	 * @static
	 * @protected
	 */
	public static var gameAssets = null; // The preloaded assets for the current game

	/**
	 * The game list manifest, which describes all games.
	 * @property manifest
	 * @type Object
	 * @static
	 * @protected
	 */
	public static var manifest = null;

	/**
	 * The GameShell that owns the current game window that initialized the bootstrap.
	 * This property is looked up manually via window.parent.Atari.GameShell.
	 * @property owner
	 * @type Class
	 * @static
	 * @protected
	 */
	public static var owner = null;

	public static var mediator = null;

	public static var startTime = 0;

	/**
	 * The minimum load time we allow. This ensures that if all we need to load is scripts,
	 * that the scripts have time to initialize before we start the game.
	 * @property MIN_LOAD_TIME
	 * @type {Number}
	 * @default 500
	 * @static
	 */
	public static var MIN_LOAD_TIME = 500;


	/**
	 * Start a game. The canvas is resized based on the manifest loaded in the parent window.
	 * The game manifest is assumed to be loaded in the parent window, and can be looked up.
	 *
	 * @method startGame
	 * @param {String} gameId The id-based name of the game to start
	 * @param {String} baseUrl The relative path to the root of the project.
	 * @param {HTMLCanvasElement} canvas The canvas element that the game will use.
	 * @static
	 */
	public static function startGame (gameId:String, baseUrl:String, canvas:HTMLCanvasElement):Void;

	/**
	 * Bootstrap provides preload directions for sound.
	 * @method getPreloadHandlers
	 * @return {Object}
	 */
	public function getPreloadHandlers():Dynamic;

	/**
	 * The callback that PreloadJS will make when audio items are preloaded. We override
	 * this to inject OGG path alternatives, and prevent preloading if audio is disabled.
	 * @param params See SouundJS.initLoad for parameter overview.
	 * @return {Boolean} If audio is disabled, will return false. Otherwise, uses SoundJS override.
	 */
	public static function initLoad(src:String, type:String, id:Dynamic, data:Dynamic):Void;


	public static function handleGameProgress (event:Dynamic):Void;
	/**
	 * An asset has been loaded.
	 * <ul>
	 *     <li>CSS and JavaScript are injected into the HEAD of the document.</li>
	 *     <li>JSON objects are parsed, and stored by ID in the <b>gameAssets</b></li>
	 *     <li>All other elements are stored by ID in the <b>gameAssets</b></li>
	 * </ul>
	 * @method handleAssetLoaded
	 * @param {Object} event The file event from PreloadJS
	 * @static
	 * @protected
	 */
	public static function handleAssetLoaded (event:Dynamic):Void;

	/**
	 * All assets have completed loading.
	 * @method handleAssetsComplete
	 * @param {Object} event The complete event from PreloadJS
	 * @static
	 * @protected
	 */
	public static function handleAssetsComplete (event:Dynamic):Void;

	/**
	 * Create the game instance.
	 * @method createGameInstance
	 * @protected
	 */
	public static function createGameInstance():Void;

	/**
	 * An asset could not be found, or was otherwise unable to load.
	 * @method handleAssetError
	 * @param {Object} event The error event from PreloadJS
	 * @static
	 * @protected
	 */
	public static function handleAssetError (event:Dynamic):Void;


}