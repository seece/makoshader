<%namespace name="common" file="/common.glsl"/>
<%inherit file="/base.glsl"/>

<%block name="vertexshader">
layout (location=0) in vec3 ipos;
smooth out vec3 ex_Pos;
smooth out vec2 ex_uv;

${common.uniforms()}
${common.transform_uniforms()}

uniform float speed;

void main() {
	float ratio = screenSize.y/screenSize.x;
	ex_uv.y *= ratio;

	vec3 outpos = ipos;
	gl_Position = (projection*camera)*vec4(outpos, 1.0);
}

</%block>

<%block name="fragmentshader">
layout (location=0) out vec4 outcol;

smooth in vec3 ex_Pos;	
smooth in vec2 ex_uv;

uniform sampler2D tex;

void main() {
	vec4 teks = texture2D(tex, ex_uv + plus );
	vec4 col = vec4(teks.rgb, 1.0);

	outcol = col;
}

</%block>
