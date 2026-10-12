**Política de Privacidad de Software (EsMeSolutions)**

**Última actualización:** 11 de octubre de 2026

**1. Introducción**
Esta Política de Privacidad rige el uso del software de escritorio, móvil y de servidor desarrollado y distribuido por EsMeSolutions / RichyKunBv (en adelante, "el Desarrollador"). Esto incluye proyectos pasados, actuales como *Ultraudio*, *AnimeNotepad* y *Nube-Zero*, así como futuras aplicaciones. Nuestro principio de diseño fundamental es el respeto absoluto por tu privacidad: desarrollamos software funcional y autónomo. No nos interesa recopilar, monetizar, ni tener acceso a tu información personal.

**2. Recopilación y Uso de Datos (Cero Telemetría)**
Nuestras aplicaciones están diseñadas bajo un paradigma de procesamiento local (offline-first o local-network-first).

* **No recopilamos**, almacenamos, ni compartimos información personal, identidades, hábitos de uso, ni metadatos.
* **No implementamos** telemetría oculta, rastreadores (trackers), ni herramientas de análisis en segundo plano.
* **No transmitimos** tus archivos, bibliotecas multimedia, notas de texto, contraseñas o historial a ningún servidor externo administrado por el Desarrollador ni por terceros.

**3. Procesamiento y Criptografía Local**
El acceso a los directorios de tu sistema y el procesamiento de tus archivos ocurre estrictamente de forma local en tu máquina o dentro de tu propia infraestructura de red.

* Las funciones que involucran seguridad (como las notas `.uwu` cifradas mediante AES-GCM o las transferencias por HTTPS mediante certificados fijados) son administradas localmente mediante claves generadas y resguardadas por el propio usuario.
* El Desarrollador no tiene acceso a tus credenciales, llaves de cifrado ni al contenido de tus archivos. En caso de pérdida de contraseñas, es técnicamente imposible para nosotros recuperar tu información.

**4. Registro de Actividad y Reporte de Errores (Logs)**
Para facilitar el diagnóstico y la corrección de fallos, algunas aplicaciones generan registros de actividad (logs) guardados localmente en tu disco.

* **Naturaleza de los datos:** Estos registros contienen exclusivamente eventos internos de la aplicación, trazas de errores de código (stack traces) y fallos de ejecución. No capturan información del sistema operativo ajena a la aplicación, ni el contenido de tus documentos personales.
* **Transmisión estrictamente manual:** Ningún reporte de error o log se envía de forma automática a través de Internet. El usuario tiene el control total para visualizar, filtrar, limpiar y decidir de forma consciente y **manual** si desea enviar esta información técnica al Desarrollador (ya sea abriendo un reporte en GitHub Issues o enviando un correo electrónico) para solicitar soporte.

**5. Uso Transparente de la Red**
Aunque las aplicaciones operan principalmente de forma aislada o en red local (LAN), pueden realizar conexiones de red limitadas, específicas y transparentes para:

* **Integración y Descubrimiento:** Utilizar protocolos locales (como MPRIS, D-Bus, o UDP Probe-Response) necesarios para interactuar con tu hardware multimedia o descubrir servidores en tu propia red, sin salir a Internet.
* **Actualizaciones de Software:** Consultar la API pública de GitHub de forma anónima exclusivamente para comparar versiones y notificarte si existe una actualización disponible.

**6. Licenciamiento de Código Abierto**
Apostamos por el software libre y auditable. Todos nuestros proyectos (pasados, actuales y futuros) se distribuyen bajo la **Licencia Apache 2.0** (a excepción de bibliotecas o dependencias específicas de terceros sujetas a sus propias licencias, como BASS Audio Library en Ultraudio). Esto garantiza a la comunidad transparencia total, libertad de uso y la capacidad de revisar el código fuente para verificar que nuestras promesas de privacidad se cumplen.

**7. Cambios y Modificaciones en esta Política**
Esta política de privacidad es variable y está sujeta a modificaciones constantes. A medida que el ecosistema de EsMeSolutions crezca, desarrollemos nuevas aplicaciones o implementemos funciones distintas, las políticas pueden cambiar de un día para otro para adaptarse a las nuevas necesidades técnicas o legales. Se recomienda revisar este documento periódicamente para estar al tanto de cualquier actualización.

**8. Contacto**
Si tienes preguntas relacionadas con esta Política de Privacidad, el manejo de la seguridad en nuestras aplicaciones o el uso de la Licencia Apache, puedes contactar al Desarrollador a través de:

* **GitHub:** [https://github.com/RichyKunBv](https://github.com/RichyKunBv)
* **Correo de soporte:** esmesolutions0@gmail.com