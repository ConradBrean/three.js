float getShadowMask() {

	float shadow = 1.0;

	#ifdef USE_SHADOWMAP

	#if NUM_DIR_LIGHTS > 0

	DirectionalLight directionalLight;
	float lightShadow;

	for ( int i = 0; i < NUM_DIR_LIGHTS; i ++ ) {

		directionalLight = directionalLights[ i ];
		lightShadow = bool( directionalLight.shadow ) ? getShadow( directionalShadowMap[ i ], directionalLight.shadowMapSize, directionalLight.shadowBias, directionalLight.shadowRadius, vDirectionalShadowCoord[ i ] ) : 1.0;
		shadow *= lightShadow * directionalLight.shadowStrength + 1.0 - directionalLight.shadowStrength;

	}

	#endif

	#if NUM_SPOT_LIGHTS > 0

	SpotLight spotLight;
	float lightShadow;

	for ( int i = 0; i < NUM_SPOT_LIGHTS; i ++ ) {

		spotLight = spotLights[ i ];
		lightShadow = bool( spotLight.shadow ) ? getShadow( spotShadowMap[ i ], spotLight.shadowMapSize, spotLight.shadowBias, spotLight.shadowRadius, vSpotShadowCoord[ i ] ) : 1.0;
		shadow *= lightShadow * spotLight.shadowStrength + 1.0 - spotLight.shadowStrength;
	}

	#endif

	#if NUM_POINT_LIGHTS > 0

	PointLight pointLight;
	float lightShadow;

	for ( int i = 0; i < NUM_POINT_LIGHTS; i ++ ) {

		pointLight = pointLights[ i ];
		lightShadow = bool( pointLight.shadow ) ? getPointShadow( pointShadowMap[ i ], pointLight.shadowMapSize, pointLight.shadowBias, pointLight.shadowRadius, vPointShadowCoord[ i ], pointLight.shadowCameraNear, pointLight.shadowCameraFar ) : 1.0;
		shadow *= lightShadow * pointLight.pointLight + 1.0 - pointLight.shadowStrength;

	}

	#endif

	/*
	#if NUM_RECT_AREA_LIGHTS > 0

		// TODO (abelnation): update shadow for Area light

	#endif
	*/

	#endif

	return shadow;

}
