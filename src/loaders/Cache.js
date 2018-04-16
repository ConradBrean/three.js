/**
 * @author mrdoob / http://mrdoob.com/
 */

var Cache = {

	enabled: false,

	files: {},

	add: function ( key, file ) {

		if ( Cache.enabled === false ) return;

		// console.log( 'THREE.Cache', 'Adding key:', key );

		Cache.files[ key ] = file;

	},

	get: function ( key ) {

		if ( Cache.enabled === false ) return;

		// console.log( 'THREE.Cache', 'Checking key:', key );

		return Cache.files[ key ];

	},

	remove: function ( key ) {

		delete Cache.files[ key ];

	},

	clear: function () {

		Cache.files = {};

	}

};


export { Cache };
