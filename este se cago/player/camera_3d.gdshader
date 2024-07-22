shader_type spatial;

//render_mode unsha9ded;
uniform sampler2D screen_texture : source_color, hint_screen_texture, repeat_disable;
uniform int color_levels : hint_range(2, 256) = 32;

vec3 quantize_color(vec3 color, int levels) {
    float quantizer = float(levels - 1);
    return floor(color * quantizer + 0.5) / quantizer;
}

void vertex() {
  POSITION = vec4(VERTEX.xy, 1.0, 1.0);
}

void fragment(){
	vec3 screen_color = texture(screen_texture, SCREEN_UV).rgb;
	vec3 final_color = screen_color;
	final_color = quantize_color(final_color, color_levels);
	ALBEDO = final_color;
}