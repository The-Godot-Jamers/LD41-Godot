shader_type spatial;

void fragment() 
{
	ALBEDO = vec3(SCREEN_UV,distance(UV,vec2(0.5,0.5)));
}