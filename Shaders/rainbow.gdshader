shader_type canvas_item;

uniform float velocidad = 1.0;
uniform float frecuencia = 2.0; // Cuántas repeticiones del arcoíris caben en el objeto
uniform float inclinacion = 0.0; // Ángulo en radianes para inclinar las rayas

// Función matemática para generar un espectro de color suave
vec3 generar_arcoiris(float t) {
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.0, 0.333, 0.667); // Desfase para rojo, verde y azul
    return a + b * cos(6.28318 * (c * t + d));
}

void fragment() {
    // Rotar las coordenadas UV para inclinar el patrón
    float cos_a = cos(inclinacion);
    float sin_a = sin(inclinacion);
    mat2 rotacion = mat2(vec2(cos_a, -sin_a), vec2(sin_a, cos_a));
    vec2 uv_rotado = rotacion * (UV - 0.5) + 0.5;

    // Calcular la posición de las rayas basándose en el espacio (UV) y el tiempo (TIME)
    float tiempo_desplazado = uv_rotado.x * frecuencia - TIME * velocidad;

    // Obtener el color del espectro
    vec3 color_arcoiris = generar_arcoiris(tiempo_desplazado);

    // Leer la textura original para conservar la silueta original (canal Alpha)
    vec4 color_original = texture(TEXTURE, UV);
    COLOR = vec4(color_arcoiris, color_original.a);
}