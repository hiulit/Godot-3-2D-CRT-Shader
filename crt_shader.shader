shader_type canvas_item;

uniform float boost : hint_range(1.0, 1.5, 0.01) = float(1.2);
uniform float grille_opacity : hint_range(0.0, 1.0, 0.01) = float(0.85);
uniform float scanlines_opacity : hint_range(0.0, 1.0, 0.01) = float(0.95);
uniform float vignette_opacity : hint_range(0.1, 0.5, 0.01) = float(0.2);
uniform float scanlines_speed : hint_range(0.0, 1.0, 0.01) = float(1.0);
uniform bool show_grille = true; // Grille only works in Stretch Mode: 2D.
uniform bool show_scanlines = true;
uniform bool show_vignette = true;
uniform bool show_curvature = true;
uniform vec2 screen_size = vec2(320.0, 180.0);

vec2 CRTCurveUV(vec2 uv) {
	if(show_curvature) {
		uv = uv * 2.0 - 1.0;
		vec2 offset = abs(uv.yx) / vec2(6.0, 4.0);
		uv = uv + uv * offset * offset;
		uv = uv * 0.5 + 0.5;
	}
	return uv;
}

void DrawVignette(inout vec3 color, vec2 uv) {
	if(show_vignette) {
		float vignette = uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y);
		vignette = clamp(pow(16.0 * vignette, vignette_opacity), 0.0, 1.0);
		color *= vignette;
	} else {
		return;
	}
}

void DrawScanline(inout vec3 color, vec2 uv, float time) {
	float scanline = clamp((scanlines_opacity - 0.05) + 0.05 * sin(3.1415926535 * (uv.y + 0.008 * time) * screen_size.y), 0.0, 1.0);
	float grille = (grille_opacity - 0.15) + 0.15 * clamp(1.5 * sin(3.1415926535 * uv.x * screen_size.x), 0.0, 1.0);

	if (show_scanlines) {
		color *= scanline;
	}

	if (show_grille) {
		color *= grille;
	}

	color *= boost;
}

void fragment() {
	vec2 screen_crtUV = CRTCurveUV(SCREEN_UV);
	vec3 color = texture(SCREEN_TEXTURE, screen_crtUV).rgb;
	
	vec2 crtUV = CRTCurveUV(UV);
	if (crtUV.x < 0.0 || crtUV.x > 1.0 || crtUV.y < 0.0 || crtUV.y > 1.0) {
		color = vec3(0.0, 0.0, 0.0);
	}
	
	DrawVignette(color, crtUV);
	DrawScanline(color, crtUV, TIME * scanlines_speed);
	
	COLOR = vec4(color, 1.0);
}