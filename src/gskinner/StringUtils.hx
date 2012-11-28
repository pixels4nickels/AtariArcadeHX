package gskinner;

@:native ("StringUtils")
extern class StringUtils {

	/**
	*	Capitallizes the first word in a string or all words.
	*
	*	@param p_all (optional) Boolean value indicating if we should
	*	capitalize all words or only the first.
	*
	*	@returns String
	*/
	public static function  capitalize (str, p_all):String;


	/**
	*	Levenshtein distance (editDistance) is a measure of the similarity between two strings,
	*	The distance is the number of deletions, insertions, or substitutions required to
	*	transform p_source into p_target.
	*
	*	@param p_source The source string.
	*
	*	@param p_target The target string.
	*
	*	@returns uint
	*/
	public static function  editDistance(p_source, p_target):Uint;


	/**
	*	Removes whitespace from the front (left-side) of the specified string.
	*
	*	@returns String
	*/
	public static function  trimLeft(str):String;

	/**
	*	Removes whitespace from the end (right-side) of the specified string.
	*
	*	@returns String
	*/
	public static function  trimRight(str):String;


	/* **************************************************************** */
	/*	These are helper methods used by some of the above methods.		*/
	/* **************************************************************** */
	public static function  escapePattern(p_pattern) :String;

	public static function  _quote():String;

	public static function  _upperCase(p_char):String;

	public static function  _swapCase(p_char):String;


}