# Analizador de Números Complejos en Lex

Este programa es un analizador léxico diseñado en **Flex** para identificar y validar la estructura de números complejos. El sistema distingue entre partes reales, imaginarias (i, j) y notación científica, clasificando cada entrada como **ACEPTA** o **NO ACEPTA**.

## Autor:

* **Juan Camilo Lozano Cortes**

## Instrucciones de Ejecución (Bash)

Para compilar y correr el programa en una sola línea desde la terminal, utiliza el siguiente comando:

```bash
flex complejos.l && gcc lex.yy.c -o analizador && ./analizador datos.txt

```

> **Nota:** Asegúrate de que el archivo `datos.txt` esté en la misma carpeta que tu código fuente.

## Lógica de Implementación:

El programa utiliza una estructura de definiciones jerárquicas para garantizar la precisión:

1. **`DIG` e `INT**`: Forman la base numérica.
2. **`NUM`**: Soporta números enteros, decimales y la **notación científica** (ej. `3.5e-10`), lo cual permite que expresiones exponenciales sean aceptadas correctamente.
3. **`COMPLEX`**: La expresión maestra que combina:
* `Parte Real + Parte Imaginaria` (con espacios opcionales).
* `Solo Parte Imaginaria` (ej. `i`, `-2j`).
* `Solo Parte Real` (ej. `100`, `-5.2`).



## Ejemplos de Salida Esperada

| Entrada | Resultado | Explicación |
| --- | --- | --- |
| `3.5+2i` | **ACEPTA** | Formato complejo estándar. |
| `3.5e-10` | **ACEPTA** | Notación científica (Real puro). |
| `4 + I` | **ACEPTA** | Ignora espacios y acepta I mayúscula. |
| `-1` | **ACEPTA** | Número entero (Real puro). |
| `x` | **NO ACEPTA** | Carácter no identificado. |
| `4.5+2z` | **NO ACEPTA** | 'z' no es una unidad imaginaria. |

## Estructura del Proyecto

* `complejos.l`: Archivo de código fuente en Lex.
* `datos.txt`: Archivo de entrada con los casos de prueba.
* `analizador`: Binario ejecutable generado tras la compilación.
