shader_type canvas_item;

vec2 CRTCurveUV( vec2 uv )
{
    uv = uv * 2.0 - 1.0;
    vec2 offset = abs( uv.yx ) / vec2( 6.0, 4.0 );
    uv = uv + uv * offset * offset;
    uv = uv * 0.5 + 0.5;
    return uv;
}

void DrawVignette( inout vec4 color, vec2 uv )
{    
    float vignette = uv.x * uv.y * ( 1.0 - uv.x ) * ( 1.0 - uv.y );
    vignette = clamp( pow( 16.0 * vignette, 0.3 ), 0.0, 1.0 );
    color *= vignette;
}

void DrawScanline(inout vec4 color, vec2 uv, float iTime)
{
	float scanline = clamp( 0.95 + 0.05 * cos( 3.14 * ( uv.y + 0.008 * iTime ) * 240.0 * 1.0 ), 0.0, 1.0 );
	float grille = 0.85 + 0.15 * clamp( 1.5 * cos( 3.14 * uv.x * 640.0 * 1.0 ), 0.0, 1.0 );    
	color *= scanline * grille * 1.2;
}

void fragment() {
//	vec3 color = vec3( 0.36, 0.58, 0.98 );
	vec4 color = vec4(1.0, 1.0, 1.0, 1.0);
	float iTime = TIME;
	vec4 fragCoord = FRAGCOORD;
	vec2 iResolution = 1.0 / SCREEN_PIXEL_SIZE;
	
	// CRT effects (curvature, vignette, scanlines and CRT grille)
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec2 crtUV = CRTCurveUV( uv );
	if ( crtUV.x < 0.0 || crtUV.x > 1.0 || crtUV.y < 0.0 || crtUV.y > 1.0 )
	{
		color = vec4( 0.0, 0.0, 0.0, 1.0 );
	}
	DrawVignette( color, crtUV );
	DrawScanline( color, uv, iTime );
	
	COLOR.xyzw = color;
	COLOR.w = 1.0;
}