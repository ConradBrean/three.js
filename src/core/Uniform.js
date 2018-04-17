/**
 * @author mrdoob / http://mrdoob.com/
 */
/** @constructor 
 * @param {*} x
*/
function Uniform( value ) {

	this.value = value;

}

Uniform.prototype.clone = function () {

	return new Uniform( this.value.clone === undefined ? this.value : this.value.clone() );

};

export { Uniform };
