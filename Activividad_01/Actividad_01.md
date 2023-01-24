*<h1 align="center">Actividad #01</h1>*

# *Tipos de Kernel y sus tipos ⚙* 

En sistemas operativos, un kernel es el núcleo central del sistema, encargado de gestionar los recursos del sistema y proporcionar una interfaz para los programas. Existen varios tipos de kernels diferentes utilizados en sistemas operativos, cada uno con sus propias características y usos específicos. Algunos de los más comunes incluyen:

- ***Kernel monolítico:*** es el tipo de kernel más común, todo el código del kernel se ejecuta en el espacio de usuario con los mismos privilegios.

- ***Microkernel:*** solo contiene las funciones básicas necesarias para la gestión de recursos y la comunicación entre los programas. El resto de las funciones se implementan en módulos separados con menos privilegios.

- ***Hybrid kernel:*** es una combinación de los dos anteriores, tiene características de un monolítico y un microkernel.

## *Diferencias Entre los tipos de Kernel:*

| Tipo de Kernel| Ventajas | Desventajas |
| :---         |     ---      |          --- |
| Monolítico   | Fácil de desarrollar y mantener debido a la estructura simple del código.| Puede ser propenso a fallos debido a la complejidad del código.   |
| | Proporciona un rendimiento rápido y eficiente debido a la integración de todas las funciones en un solo espacio de memoria.      | Puede ser menos seguro debido a la integración de todas las funciones en un solo espacio de memoria.      |
||||
| Microkernel   | Es más seguro debido a la separación de las funciones en módulos con menos privilegios.| Puede ser más difícil de desarrollar y mantener debido a la complejidad de la comunicación entre los módulos.   |
| | Es más escalable debido a la separación de las funciones en módulos independientes.  |Puede tener un rendimiento más lento debido a la comunicación entre los módulos.     |
||||
| Hybrid   | Combina las ventajas de los kernels monolíticos y microkernels.| Puede ser más complejo de desarrollar y mantener que un kernel monolítico, debido a la integración de algunas funciones en módulos separados.   |
| | Puede ser más fácil de desarrollar y mantener que un microkernel, debido a la integración de algunas funciones en un solo espacio de memoria.  |Puede no ofrecer las mismas ventajas de seguridad y escalabilidad que un microkernel.  |

Cada tipo de kernel tiene sus propias ventajas y desventajas. Los kernels monolíticos son fáciles de desarrollar y mantener, pero pueden ser más propensos a fallos debido a la complejidad del código. Los microkernels son más seguros y escalables, pero pueden ser más difíciles de desarrollar y mantener. Los híbridos buscan combinar las ventajas de ambos.


# *User vs Kernel Mode 🔐* 

En un sistema operativo, el modo de usuario y el modo de kernel son dos modos diferentes en los que puede ejecutarse el código.

- ***Modo de usuario:*** en este modo, el código ejecutado tiene limitaciones en el acceso a los recursos del sistema y solo puede realizar operaciones permitidas para los usuarios. Los programas corriendo en el modo de usuario no tienen acceso directo a los recursos del sistema como la memoria, los dispositivos de entrada/salida, etc.
- ***Modo de kernel:*** en este modo, el código ejecutado tiene acceso completo a todos los recursos del sistema, incluyendo la memoria, los dispositivos de entrada/salida, etc. El kernel es el código que se ejecuta en este modo y es responsable de gestionar los recursos del sistema y proporcionar una interfaz para los programas.
La transición entre el modo de usuario y el modo de kernel se realiza mediante una interrupción o una llamada del sistema. Los programas en el modo de usuario pueden solicitar servicios del kernel mediante llamadas del sistema, que causan una interrupción y una transición temporal al modo de kernel para que el kernel pueda proporcionar el servicio solicitado. Después de proporcionar el servicio, el kernel regresa al modo de usuario.

La existencia de estos dos modos ayuda a proteger el sistema operativo y los recursos del sistema de errores y fallos en los programas de usuario, ya que estos no tienen acceso directo a los recursos del sistema.
