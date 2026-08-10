# Unidad 1: Análisis de Binarios

En esta unidad se aborda el análisis estático y dinámico de archivos binarios utilizando herramientas como **strings**, **objdump**, **editores hexadecimales** (recomendación personal del autor: usar **Ghex** en lugar de Bliss) y **Evan's Debugger (EDB)**. A través de su uso, se busca que aprendan a inspeccionar el código desensamblado, alterar el funcionamiento manipulando la información y comprender la distribución de las secciones de memoria en tiempo de ejecución. Para la realización de este trabajo práctico se van a utilizar las herramientas antes mencionadas, en uno de los entornos seteados del Trabajo Práctico 0.

El otro recurso a utilizar son los ejecutables presentes en el comprimido binarios.zip, así que hay que descargárselo y descomprimirlos. Si bien hay archivos en 32 bits y 64 bits, uno al usar un sistema con arquitectura de 64 bits puede ejecutar ambos. Para la resolución de los ejercicios se va a usar principalmente la versión de 32 bits.

## 📝 Resolución y Desarrollo Teórico

Toda la explicación teórica, el desarrollo paso a paso de los ejercicios y el espacio para dudas se encuentra centralizado en el siguiente documento:

🔗 **[ITBA - Arquitectura de Computadoras - TP1 - Solucionario](https://docs.google.com/document/d/1WYSaNJeL5G4ijiSO8Faml-l1L0HAIaySIrr4o4d3CWs/edit?usp=sharing)**

---
*Nota: Los archivos de código fuente correspondientes a las implementaciones prácticas de esta unidad, junto con los binarios provistos, se encuentran en la carpeta "**Código**" en este mismo directorio.*
*Nota 2: La resolución de los ejercicios fue realizada en un entorno Linux Mint 22.1 x86_64 Cinnamon. Si bien visualmente va a haber diferencias con los entornos seteados por la cátedra, no debería haber diferencia en el comportamiento esperado.*