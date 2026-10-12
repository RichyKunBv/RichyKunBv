**Política de Actualizaciones y Ciclo de Vida del Software (EsMeSolutions)**

**Última actualización:** 11 de octubre de 2026

**1. Alcance e Introducción**
Esta política define la frecuencia de publicación, el ciclo de vida y los criterios de soporte de hardware y sistema operativo. **Este documento aplica única y exclusivamente a los proyectos que mencionen o enlacen explícitamente esta política en su documentación o repositorio** (como *Ultraudio*, *AnimeNotepad* y *Nube-Zero*). Otros desarrollos de EsMeSolutions (por ejemplo, scripts o herramientas menores basadas en Bash, Batch u otros entornos) mantienen ciclos de vida independientes, se actualizan según su propia naturaleza y no están sujetos a estos lineamientos.

**2. Frecuencia de Actualizaciones**
Para los proyectos cubiertos por esta política y que se encuentran en fase de soporte principal, garantizamos como mínimo **una actualización mensual**. Estas actualizaciones pueden incluir corrección de errores (bugfixes), mejoras de rendimiento, parches de seguridad o la introducción de nuevas características.

**3. Desarrollo basado en .NET LTS**
La arquitectura de los proyectos sujetos a esta política está construida sobre el framework **.NET**. Por políticas de estabilidad y seguridad, nuestro desarrollo migra y se asienta exclusivamente en las versiones de **Soporte a Largo Plazo (LTS)** de dicho lenguaje. Esto asegura que el núcleo de las aplicaciones reciba parches de seguridad oficiales a nivel de compilador y entorno de ejecución.

**4. Requisitos Mínimos y Hardware Obsoleto**
Dado que nuestro software principal hereda directamente la infraestructura de .NET, **los requisitos mínimos de sistema operativo y hardware están dictados por el soporte oficial de .NET y los fabricantes de los sistemas operativos (Microsoft, Apple, distribuciones Linux), no por decisiones arbitrarias del Desarrollador.**

En consecuencia:

* **Sistemas Obsoletos:** Cuando un sistema operativo o arquitectura de hardware (por ejemplo, procesadores ARM de 32 bits antiguos o la transición de macOS Intel a Apple Silicon) es marcado como obsoleto o pierde el soporte oficial del compilador de .NET, nos vemos obligados a actualizar nuestros requisitos mínimos.
* **Seguridad ante todo:** No podemos ofrecer soporte activo, forzar compatibilidad, ni mantener expuestos en red sistemas operativos que ya no reciben parches de seguridad. Hacerlo pondría en riesgo la integridad de los datos y la privacidad de los usuarios.
* El Desarrollador no tiene capacidad técnica para revertir la obsolescencia de hardware de terceros. La única acción posible es la actualización continua de nuestros requisitos mínimos para mantener los estándares de seguridad modernos.

**5. Disponibilidad de Versiones Heredadas (Legacy)**
Entendemos que no todos los usuarios pueden actualizar su hardware o sistema operativo de inmediato. Cuando una arquitectura deja de ser compatible en nuestros proyectos:

* Las versiones anteriores (compiladas con versiones previas) **permanecerán disponibles de forma indefinida** en el historial de *Releases* de GitHub para su uso local y aislado.
* Estas versiones quedan congeladas en el tiempo: **no recibirán nuevas funciones, optimizaciones ni parches de seguridad.** Su uso continuo queda bajo la estricta responsabilidad del usuario.

**6. Modificaciones de la Política**
Esta Política de Actualizaciones es un documento vivo. Las fechas de fin de soporte para arquitecturas específicas y los requisitos mínimos pueden variar en función de los anuncios de Microsoft (.NET) y las necesidades técnicas del ecosistema de EsMeSolutions.