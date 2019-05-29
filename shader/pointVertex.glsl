#version 150

uniform mat4 projection;
uniform mat4 modelview;

in vec4 position;
in vec4 color;
in vec2 offset;
in float pointIndex;

out vec4 vertColor;

// application variables
uniform float pointScale;

void main() {
	vec4 pt = position;

	// scale points
	pt /= pointScale;

	// change color
	vec4 c = vec4(pointIndex, color.g, color.b, 1.0);

	// apply view matrix
	vec4 pos = modelview * pt;
	vec4 clip = projection * pos;
	vec4 clipped = clip + projection * vec4(offset, 0, 0);

	gl_Position = clipped;
	vertColor = c;
}
