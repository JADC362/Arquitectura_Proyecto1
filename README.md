# Arquitectura_Proyecto1

CONTEXTO

Este proyecto se basa en la construcción de un procesador tipo ARC, y probar la funcionalidad de este a partir de la implementación de un algoritmo de Fibonnaci. 

El proyecto esta creado en Quartus Prime 18.1, en lenguaje HDL Verilog. Posee como entradas las señales de Clock y Reset del sistema. Dentro de la memoria interna del sistema se tienen la programación en lenguaje Asembler, escrita en hexadecimal, para la implementación del algoritmo de Fibonacci. Este algoritmo es implementado para un secuencia de 10 veces. Los registros donde se visualizan los pasos del fibonacci son los registros generales g1,g2 y g3, siendo g4 el contador del sistema.

COMPILACIÓN

    1) Lo primero a realizar es descargar el clonar el proyecto del repositorio actual https://github.com/JADC362/Arquitectura_Proyecto1 en un directorio local del computador. Se recomienda almacenar el proyecto en una posición de memoría de ruta corta, debido a errores de compilación (Ej: C:/).
    2) Abrir el proyecto en Quartus Prime con nombre BB_System.
    3) Importar todos los archivos de la carpeta rtl al proyecto. Para esto, en el panel 'Project Navigator', dar click derecho en el nombre del archivo BB_System, y seleccionar 'Settings...'. Abierta la pestaña, seleccionar la sección 'Files'. Allí, en el boton de 3 puntos, importar todos los archivos de la carpeta RTL.
    4) Luego de esto se procede a compilar en el panel de herramientas.

SIMULACION

    1) Compilado el proyecto, se tienen que seleccionar los archivos simulación. Para esto, en el panel 'Project Navigator', dar click derecho en el nombre del archivo BB_System, y seleccionar 'Settings...'. Abierta la pestaña, seleccionar la subsección 'Simulation'. Seleccionar como herramienta 'ModelSim-Altera'.
    2) En este mismo panel, en la división 'NativeLink settings', seleccionar la opción 'Compile Test Bench'. Aquí se debe añadir, dando click en el boton 'Test Benches...', el archivo de simulación BB_SYSTEM.vt, alojado en la carpeta Simulation/modelsim, con el nombre 'BB_SYSTEM_vlg_tst'.
    3) En caso de querer tener visualizar de primera mano cierta señales, seleccionar la opción 'Use script to set up simulation' y seleccionar el archivo BB_SYSTEM.do, alojado en la carpeta simulation/modelsim.
    4) Por último se simula el sistema, dando click en la pestaña 'Tools/Run Simulation Tool/RTL Simulation'.

CREADORES

    - John Alejandro Duarte Carrasco
    - Diego Felipe Martinez Valencia
    - Alejandra Castellanos
    - Sergio Cardernas
