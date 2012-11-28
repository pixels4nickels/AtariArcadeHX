package gskinner;

@:native ("Rnd")
extern class Rnd {
/**
 * A seeded randomization class which returns a predictive set of random numbers for randomization which
 * can be re-created consistently.
 * @class Rnd
 * @static
 */

/**
 * Weighted random function. Pass initial range as to/from, and then weightedRange and weightedStrengh as required.
 * @method weighted
 * @param normalRange - Array of 2 values representing the normal range
 * @param decimalPlaces - Precision
 * @param weightedRange - Array of 2 values representing the weighted range
 * @param weightStrength - Percentage of likelihood of returning something within the weighted range
 */
	public static function  weighted(normalRange:Dynamic, decimalPlaces:Dynamic, weightedRange:Dynamic,
	weightStrength:Dynamic):Void;

/**
 * Return a random 1 or 0 value.
 * <pre>
 *     // bit(); // returns 1 or 0 (50% chance of 1)
 *     // bit(0.8); // returns 1 or 0 (80% chance of 1)
 * </pre>
 * @method randBit
 * @param {Number} chance The likelihood between 0 and 1 that the number will be 1
 * @return {Number} 1 or 0.
 */
	public static function randBit (chance:Float):Float;


/**
 * Get a random boolean (true or false) value.
 * <pre>
 *     // boolean(); // returns true or false (50% chance of true)
 *     // boolean(0.8); // returns true or false (80% chance of true)
 * </pre>
 * @method randBoolean
 * @param {Number} chance The likelihood between 0 and 1 that the number will be true.
 * @return {Boolean} true or false
 */
	public static function randBoolean (chance:Float):Bool;

/**
 * Get a random floating-point value between a range of 2 values.
 * @method randFloat
 * @param {Number} min The lower range
 * @param {Number} max The upper range
 * @return {Number} A floating point number.
 */
	public static function randFloat (min:Float, max:Float):Float;

/**
 * Return a random integer between 2 values.
 * <pre>
 *     // integer(50); // returns an integer between 0-49 inclusive
 *     // integer(20,50); // returns an integer between 20-49 inclusive
 * </pre>
 * @method randInteger
 * @param {Number} min The lower range.
 * @param {Number} max The upper range.
 * @return {Number} An integer
 */
	public static function randInteger (min:Float, max:Float):Float;

/**
 * Return a random number using a seed.
 * @return {Number}
 */
	public static function random ():Float;


/**
 * Get a random -1 or +1 value.
 * <pre>
 *     // sign(); // returns 1 or -1 (50% chance of 1)
 *     // sign(0.8); // returns 1 or -1 (80% chance of 1)
 * </pre>
 * @method randSign
 * @param {Number} chance The likelihood between 0 and 1 that the number will be 1.
 * @return {Number} 1 or -1
 */
	public static function randSign (chance:Float):Float;

/**
 * Set the seed value to get a different result set.
 * @method setSeed
 * @param {Number} value The seed value.
 */
	public static function setSeed (value:Float):Void;

}