package gamelibs;

import easeljs.geom.Point;
import easeljs.display.Graphics;
import easeljs.display.Shape;
import easeljs.display.Container;
@:native ("ParticleEmitter")
extern class ParticleEmitter {
	/**
	 * The Particle Emitter creates a group of sprites that:
	 * <ol>
	 *     <li>have random x and y velocities</li>
	 *     <li>a velocity decays so they are affected by gravity</li>
	 *     <li>a lifespan and overall decay so they fade away over time and are removed.</li>
	 * </ol>
	 * The <b>emit()</b> method creates a specific number of particles on-demand,
	 * and adds them to the provided container. Using this function, the position,
	 * number of particles, particle properties, and particle graphics can be
	 * set for each emit call, creating different effects.
	 *
	 * @class ParticleEmitter
	 * @param {Container} container The EaselJS container that particles for this emitter will
	 * be drawn into.
	 * @constructor
	 */
	public function new (container:Container, defaultParticle:Shape):Void;

	public static var BRICKS:Dynamic;
	public static var SMALL_SPARKS:Dynamic;
	public static var DEFAULT_PROPS:Dynamic;
	public static var DEFAULT_PARTICLE:Shape;


	/**
	* The EaselJS Container that particles are drawn into.
	* @property container
	* @type Container
	*/
	public var container:Container;

	/**
	* A list of all the currently active particles for animating each tick.
	* @property particles
	* @type Array
	* @protected
	*/
	public var particles:Array <Dynamic>;

	/**
	* The default EaselJS Graphics object that is used by this emitter when an emit() call
	* is made with no Graphics instance.
	* @property defaultGraphics
	* @type Graphics
	* @protected
	*/
	public var defaultParticle:Graphics;

	/**
	* The default properties for particles.
	* @property defaultProps
	* @type Object
	* @protected
	*/
	public var defaultProps:Dynamic;

	/**
	* The factor to multiply speed values on in order to accommodate framerate changes.
	* @property tickFactor
	* @type Number
	* @default 1
	*/
	public var tickFactor:Float;


	/**
	* Create a particle. The particles are pulled from an object pool and reset for use.
	* @method createParticle
	* @param {Point} position The origin of the particle
	* @param {Object} props An object that contains the rules for emitted particles (see the emit() method)
	* @param {Graphics} graphics An EaselJS Graphics object that draws each particle.
	* @return {Object} A particle that will be animated until it dies.
	* @protected
	*/
	public function createParticle (position:Point, props:Dynamic, graphics:Graphics):Dynamic;


	/**
	* Emit a number of particles. The particles will last until their lifespan decays, or the leave
	* the stage bounds.
	* @method emit
	* @param {Point} position The point (object with x and y properties) where the emit
	*      originates. This enables a moving emitter.
	* @param {Number} numParticles The number of particles to be emitted at once.
	* @param {Object} props An object that contains the rules for emitted particles, including:
	* <ol>
	*     <li>speed: The maximum number of pixels to move in each direction. The default value is 10.</li>
	*     <li>decay: The overall lifespan decay of the particle. A high decay will cause the particle to last longer.
	*          This is a number between 0 and 1. The default value is 0.94.</li>
	*     <li>life: The lifespan of a particle. The decay is multiplied on the life each tick. Numbers above 1
	*          will ensure the particle lasts longer. The default value is 1.</li>
	*     <li>rotation: If the particle's rotation is affected by its x and y speed. The default is true.</li>
	*     <li>gravity: The gravity on the particle, which is the number of pixels added to the "y" position
	*          each tick. The default is 0.5.</li>
	*     <li>angle: (Optional) An angle in degrees that the emitter directs its particles. The default is 0.</li>
	*     <li>spread: The number of degrees to add to the angle in both directions. The default is 360 which
	*          means it emits in all directions.</li>
	*     <li>addOnBottom: If new particles are added on the bottom. The default is false.</li>
	*     <li>minScale: The minimum scale of the particle. The default is 1.</li>
	*     <li>maxScale: the maximum scale of the particle. The default is 1.</li>
	*     <li>scaleDecay: The amount to multiply the particle scale by each tick. The default is 1.</li>
	*     <li>variation: The amount of variation to scale the particle height. The variation is multiplied by Math.random()
	*          and then added to 1. The default is null (not applied).</li>
	*     <li>stretchFactor: The amount to scale the particle scaleX. This value is multiplied
	*          by the x any velocity which give is directional velocity. The default is null (not applied)</li>
	* @param {Shape | Bitmap | Image | BitmapAnimation} particle A display object that is used for the particle. The emitter is
	*      optimized so that it does not re-create the image object for each particle. Instead it will use the existing image,
	*      bitmap.image, shape.cacheCanvas (shapes must be cached), or bitmapAnimation.spriteSheet.
	*/
	public function emit (position:Point, numParticles:Float, props:Dynamic, particle:Shape | Bitmap | Image | BitmapAnimation):Void;

	/**
	* Emit multiple particles at once. This is the same as emit(), but takes an array of particles instead.
	* @method emitMultiple
	* @param {Point} position The point (object with x and y properties) where the emit originates.
	*      This enables a moving emitter.
	* @param {Number} numParticles The number of particles to be emitted at once.
	* @param {Object} props An object that contains the rules for emitted particles. Please see the emit()
	*      method for details.
	* @param {Array} particles A list of particles to emit. Particles are emitted in the order they are specified.
	*      Please see the emit() method for details on what constitutes a particle.
	*/
	public function emitMultiple (position:Point, numParticles:Float, props:Dynamic, particles:Array <Dynamic>):Void;


	/**
	* Initialize the ParticleEmitter
	* @method initialize
	* @param {Container} container The EaselJS Container that holds particles.
	* @protected
	*/
	public function initialize (container:Container, defaultParticle:Shape):Void;

	/**
	* Tick all the active particles. This moves them and applies decay, rotation, etc.
	* @method tick
	* @protected.
	*/
	public function tick ():Void;


	/**
	 * Will toggle visibility of particles outside the bounds of the viewPort
	 * @param x
	 * @param y
	 * @param width
	 * @param height
	 */
	public function cull (x:Dynamic, y:Dynamic, width:Dynamic, height:Dynamic):Void;


}