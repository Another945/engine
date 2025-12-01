//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 in0;
uniform vec3 in1;
uniform vec3 in2;
uniform vec3 in3;
uniform vec3 in4;
uniform vec3 in5;
uniform vec3 in6;
uniform vec3 in7;
uniform vec3 in8;
uniform vec3 in9;
uniform vec3 in10;

uniform vec3 out0;
uniform vec3 out1;
uniform vec3 out2;
uniform vec3 out3;
uniform vec3 out4;
uniform vec3 out5;
uniform vec3 out6;
uniform vec3 out7;
uniform vec3 out8;
uniform vec3 out9;
uniform vec3 out10;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    vec3 test = vec3(
        gl_FragColor.r * 255.0,
        gl_FragColor.g * 255.0,
        gl_FragColor.b * 255.0
    );
    
    if (test == in0) { test = out0; }
    if (test == in1) { test = out1; }
    if (test == in2) { test = out2; }
    if (test == in3) { test = out3; }
    if (test == in4) { test = out4; }
    if (test == in5) { test = out5; }
    if (test == in6) { test = out6; }
    if (test == in7) { test = out7; }
    if (test == in8) { test = out8; }
    if (test == in9) { test = out9; }
    if (test == in10) { test = out10; }
    
    gl_FragColor = vec4(
        test.r / 255.0,
        test.g / 255.0,
        test.b / 255.0,
        gl_FragColor.a
    );
}

