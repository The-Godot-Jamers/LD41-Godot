shader_type canvas_item;
uniform bool hippy;
uniform vec4 col1: hint_color;
uniform vec4 col2: hint_color;
uniform vec4 col3: hint_color;
uniform vec4 col4: hint_color;
uniform vec4 col5: hint_color;
uniform vec4 col6: hint_color;
uniform vec4 col7: hint_color;
uniform vec4 col8: hint_color;
uniform vec4 col9: hint_color;
uniform vec4 col0: hint_color;

void fragment() 
{
vec4 col = texture(TEXTURE,UV);
vec4 drawcol = col;


if (col.r <= 0.1) 
	{ //belt and shoes
		drawcol = col1;
	} 
	if (col.r > 0.1 && col.r <= 0.28) 
	{ //shades and highlights
		drawcol = col2;
	}
	if (col.r > 0.28 && col.r <= 0.3) 
	{//suit
		drawcol = col3;
		if (hippy) 
		{
			drawcol = vec4(UV,UV.x,1.0);
		}
		
		
	}
	if (col.r > 0.3 && col.r <= 0.7) 
	{//pants 
		drawcol = col4;
	}
	if (col.r > 0.7) 
	{//body
		drawcol = col5;
	}
	if (col.r == 1.0 && col.b < 0.9) 
	{//body
		drawcol = col6;
	}
if (col.a == 0.0) 
{
	COLOR = vec4(col);
}
else 
{
	COLOR = drawcol;
}
	
}