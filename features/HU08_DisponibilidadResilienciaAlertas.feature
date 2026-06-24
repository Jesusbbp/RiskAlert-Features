Característica: Disponibilidad 24/7 y resiliencia en red para el envío de alertas
  Como técnico de mantenimiento
  Quiero que el canal transaccional de alertas mantenga un nivel estricto de disponibilidad y tolerancia a caídas de red
  Para asegurar la recepción de emergencias críticas en mi celular bajo cualquier condición

  Escenario: Envío de alerta con cobertura de red disponible
    Dado que el backend central confirma e integra una anomalía crítica validada en la planta de producción
    Y el servicio de red móvil está operativo
    Cuando la infraestructura de la nube despacha la notificación
    Entonces debe garantizar un Uptime del 99.9% anual
    Y debe despachar la notificación push de forma inmediata al terminal móvil asignado
    Y debe mostrar el ID del equipo y el peligro detectado en la barra de notificaciones del celular

  Escenario: Generación de alerta sin cobertura de red en el terminal móvil
    Dado que el terminal móvil del técnico se encuentra dentro de un área blindada de la planta sin cobertura WiFi o celular
    Y se genera una alerta de emergencia en ese momento
    Cuando la infraestructura intenta realizar el envío del mensaje
    Entonces el backend debe retener de forma segura la alerta con estado "Pendiente" en una cola persistente de mensajería
    Y debe retransmitirla al celular en menos de 2 segundos una vez se recupere el enlace de red
