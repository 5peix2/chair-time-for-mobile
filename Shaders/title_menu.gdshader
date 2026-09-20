shader_type canvas_item;

uniform vec2 velocity = vec2(0.1,0.1);
uniform vec2 scale = vec2(3.0,3.0);
uniform vec4 color : source_color = vec4(1.0,1.0,1.0,1.0);

void fragment() {
	vec2 uv_moved = UV * scale + (TIME * velocity);
	vec4 color_texture = texture(TEXTURE,uv_moved);
	COLOR = color_texture * color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
