#version 450 core

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 texCoord;


out vec3 fragPos;
out vec3 fragNormal;
out vec2 fragTexCoord;

uniform mat4 proj_calc;
uniform mat4 model;

void main(void)
{

    gl_Position = proj_calc * vec4(position, 1.0);
	fragPos = vec3(model * vec4(position, 1.0f));
    fragNormal = mat3(transpose(inverse(model))) * normal;
    fragTexCoord = texCoord;
}