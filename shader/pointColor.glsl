#version 150

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

in vec4 vertColor;
out vec4 fragColor;

void main() {
  fragColor = vertColor;
}