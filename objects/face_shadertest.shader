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
if (col.r >= 0.8 && col.g <= 0.01) 
{//
	drawcol = col1;
}
if (col.r <= 0.8 && col.g <= 0.1 && col.b >= 0.05) 
{//
	drawcol = col2;
}
if (col.r <= 0.4 && col.g <= 0.5 && col.g >= 0.1 && col.b <= 0.2) 
{//
	drawcol = col3;
}
if (col.r <= 0.35 && col.r >= 0.3 && col.g <= 0.35 && col.g >= 0.3 && col.b <= 0.35 && col.b >= 0.3) 
{//
	drawcol = col4;
}
if (col.r <= 0.35 && col.r >= 0.1 && col.g <= 0.50 && col.g >= 0.1 && col.b <= 0.50 && col.b >= 0.1) 
{//
	drawcol = col5;
}
if (col.r <= 0.8 && col.r >= 0.35 && col.g <= 0.9 && col.g >= 0.5 && col.b <= 0.9 && col.b >= 0.5) 
{//
	drawcol = col6;
}
if (col.r <= 0.5 && col.r >= 0.4 && col.g <= 0.5 && col.g >= 0.3 && col.b <= 0.3 && col.b >= 0.1) 
{//
	drawcol = col7;
}
if (col.r <= 1.0 && col.r >= 0.95 && col.g <= 0.9 && col.g >= 0.7 && col.b <= 0.5 && col.b >= 0.4) 
{//
	drawcol = col8;
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