#version 330
in vec2 fragTexCoord;
in vec4 fragColor;
uniform sampler2D texture0;
uniform sampler2D font;
uniform float time;
uniform float crt_thing;
out vec4 finalColor;

vec3 extract_rgb555(vec2 rg) {
    int rgb555 = (int(rg.g * 255.0) << 8) | int(rg.r * 255.0); 
    int red   = (rgb555 >> 10) & 0x1F;
    int green = (rgb555 >> 5)  & 0x1F;
    int blue  = rgb555 & 0x1F;

    return vec3(red, green, blue) / 31.0;
}

vec4 extract_char(vec2 ba, ivec2 char_pos) {
    int char2 = int(ba.r * 255.0);
    int col = int(ba.g * 255.0);
    if (col == 0) {
        col = 0xff;
    } else if (col == 0xff) {
        col = 0;
    }

    float char_in_the_way = texelFetch(
        font,
        ivec2(
            (char2 << 6) |
            ((char_pos.y & 0x7) << 3) |
            (char_pos.x & 0x7),
            0
        ),
        0
    ).r;

    return vec4(
        (((col >> 5) & 0x7) * 36 + 0x3) / 255.0,
        (((col >> 2) & 0x7) * 36 + 0x3) / 255.0,
         ((col       & 0x3) * 85      ) / 255.0,
        char_in_the_way
    );
}

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453 * sin(time));
}

vec2 crt_distortion(vec2 uv, float distortion) {
    uv = uv * 2.0 - 1.0;
    float r2 = dot(uv, uv);
    uv *= 1.0 + distortion * r2;
    uv = (uv + 1.0) * 0.5;
    return uv;
}

float mod(float a, float b) {
    return a - (b * floor(a/b));
}

void main() {
    vec2 coords = crt_distortion(
        fragTexCoord,
        crt_thing
    );
    // Get rid of mirror images outside the distortion
    if (coords.x < 0.0 || coords.x > 1.0 || coords.y < 0.0 || coords.y > 1.0) {
        discard;
    }

    bool isinthething = false;
    float sinthing = mod(time / 10.0, 1.0);
    //if (coords.y > sinthing && coords.y < (sinthing + 0.05)) {
    //    isinthething = true;
    //    coords.y += 0.005;
    //}
    vec4 data = texture(texture0, coords);
    vec3 pixel = extract_rgb555(data.rg);
    vec4 char2 = extract_char(data.ba, ivec2(coords * 108.0) % 6);
    if (char2.a > 0.5) {
        finalColor = vec4(char2.rgb, 1.0);
    } else {
        finalColor = vec4(pixel, 1.0);
    }

    if (isinthething) {
        finalColor *= 1.0 + (rand(coords) * 0.5);
        finalColor = finalColor + 0.01;
    }
}
