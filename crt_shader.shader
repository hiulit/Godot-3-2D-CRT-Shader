/*
Godot 3 2D CRT Shader.
A 2D shader for Godot 3 simulating a CRT..

Author: hiulit
Repository: https://github.com/hiulit/Godot-3-2D-CRT-Shader
Issues: https://github.com/hiulit/Godot-3-2D-CRT-Shader/issues
License: MIT https://github.com/hiulit/Godot-3-2D-CRT-Shader/blob/master/LICENSE
*/

shader_type canvas_item;

const float PI = 3.14159265359;

uniform vec2 screen_size = vec2(320.0, 180.0);
uniform bool show_curvature = true;
uniform float curvature_x_amount : hint_range(3.0, 15.0, 0.01) = float(6.0); 
uniform float curvature_y_amount : hint_range(3.0, 15.0, 0.01) = float(4.0);
uniform vec4 corner_color : hint_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform bool show_vignette = true;
uniform float vignette_opacity : hint_range(0.0, 1.0, 0.01) = 0.2;
uniform bool show_horizontal_scan_lines = true;
uniform float horizontal_scan_lines_amount : hint_range(0.0, 180.0, 0.1) = 180.0;
uniform float horizontal_scan_lines_opacity : hint_range(0.0, 1.0, 0.01) = 1.0;
uniform bool show_vertical_scan_lines = false;
uniform float vertical_scan_lines_amount : hint_range(0.0, 320.0, 0.1) = 320.0;
uniform float vertical_scan_lines_opacity : hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float boost : hint_range(1.0, 2.0, 0.01) = 1.2;
uniform float aberration_amount : hint_range(0.0, 10.0, 0.01) = 0.0;

vec2 uv_curve(vec2 uv) {
	if (show_curvature) {
		uv = uv * 2.0 - 1.0;
		vec2 offset = abs(uv.yx) / vec2(curvature_x_amount, curvature_y_amount);
		uv = uv + uv * offset * offset;
		uv = uv * 0.5 + 0.5;
	}

	return uv;
}


void fragment() {
	vec2 uv = uv_curve(UV);
	vec2 screen_uv = uv_curve(SCREEN_UV);
	vec3 color = texture(SCREEN_TEXTURE, screen_uv).rgb;

	if (aberration_amount > 0.0) {
		float adjusted_amount = aberration_amount / screen_size.x;
		color.r = texture(SCREEN_TEXTURE, vec2(screen_uv.x + adjusted_amount, screen_uv.y)).r;
		color.g = texture(SCREEN_TEXTURE, screen_uv).g;
		color.b = texture(SCREEN_TEXTURE, vec2(screen_uv.x - adjusted_amount, screen_uv.y)).b;
	}

	if (show_vignette) {
		float vignette = uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y);
		vignette = clamp(pow((screen_size.x / 4.0) * vignette, vignette_opacity), 0.0, 1.0);
		color *= vignette;
	}

	if (show_horizontal_scan_lines) {
		float s = sin(screen_uv.y * horizontal_scan_lines_amount * PI * 2.0);
		s = (s * 0.5 + 0.5) * 0.9 + 0.1;
		vec4 scan_line = vec4(vec3(pow(s, horizontal_scan_lines_opacity)), 1.0);
		color *= scan_line.rgb;
	}

	if (show_vertical_scan_lines) {
		float s = sin(screen_uv.x * vertical_scan_lines_amount * PI * 2.0);
		s = (s * 0.5 + 0.5) * 0.9 + 0.1;
		vec4 scan_line = vec4(vec3(pow(s, vertical_scan_lines_opacity)), 1.0);
		color *= scan_line.rgb;
	}

	if (show_horizontal_scan_lines || show_vertical_scan_lines) {
		color *= boost;
	}

	// Fill the blank space of the corners, left by the curvature, with black.
	if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
		color = corner_color.rgb;
	}

	COLOR = vec4(color, 1.0);
}
