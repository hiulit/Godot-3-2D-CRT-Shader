shader_type canvas_item;
render_mode blend_mul;

uniform vec4 blend_color : hint_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float boost : hint_range(1.0, 1.5, 0.05) = float(1.2);
uniform float vignette_opacity : hint_range(0.1, 0.5, 0.05) = float(0.3);
uniform bool show_grille = true; // Grille only works in Stretch Mode: 2D.
uniform bool show_scanlines = true;
uniform bool show_vignette = true;
uniform bool show_curvature = true;

vec2 CRTCurveUV(vec2 uv) {
	if(show_curvature) {
		uv = uv * 2.0 - 1.0;
		vec2 offset = abs(uv.yx) / vec2(6.0, 4.0);
		uv = uv + uv * offset * offset;
		uv = uv * 0.5 + 0.5;
	}
	return uv;
}

void DrawVignette(inout vec4 color, vec2 uv) {
	if(show_vignette) {
		float vignette = uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y);
		vignette = clamp(pow(16.0 * vignette, vignette_opacity), 0.0, 1.0);
		color *= vignette;
	} else {
		return;
	}
}

void DrawScanline(inout vec4 color, vec2 uv, float time) {
	float scanline = clamp(0.95 + 0.05 * cos(3.14 * (uv.y + 0.008 * time) * 240.0 * 1.0), 0.0, 1.0);
	float grille = 0.85 + 0.15 * clamp(1.5 * cos(3.14 * uv.x * 640.0 * 1.0), 0.0, 1.0);

	if(show_scanlines && !show_grille) {
		color *= scanline * boost;
	} else if(!show_scanlines && show_grille) {
		color *= grille * boost;
	} else if(show_scanlines && show_grille) {
		color *= scanline * grille * boost;
	} else {
		color *= boost;
	}
}

void fragment() {
	vec4 color = blend_color;

	vec2 crtUV = CRTCurveUV(UV);
	if (crtUV.x < 0.0 || crtUV.x > 1.0 || crtUV.y < 0.0 || crtUV.y > 1.0) {
		color = vec4(0.0, 0.0, 0.0, 1.0);
	}

	DrawVignette(color, crtUV);
	DrawScanline(color, UV, TIME);

	COLOR = vec4(color);
}