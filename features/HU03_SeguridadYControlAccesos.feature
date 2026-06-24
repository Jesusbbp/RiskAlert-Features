Característica: Cifrado de datos y control de accesos en configuraciones críticas
  Como administrador del sistema
  Quiero que la actualización de límites técnicos y umbrales operativos requiera autenticación robusta y viaje encriptada
  Para evitar manipulaciones maliciosas que provoquen falsas alertas o accidentes en el taller

  Escenario: Usuario autorizado modifica los umbrales de un motor
    Dado que un usuario con rol de "Jefe de Mantenimiento" ha ingresado al panel técnico y modificado los valores límite de un motor
    Cuando presiona el botón "Guardar"
    Entonces el sistema debe validar su token JWT activo
    Y debe transmitir la petición cifrada mediante HTTPS/TLS de extremo a extremo
    Y debe registrar los cambios en la base de datos
    Y debe mostrar una notificación de confirmación de seguridad en pantalla

  Escenario: Usuario sin privilegios intenta forzar una petición a la API de configuración
    Dado que un usuario con rol operativo básico (Técnico sin privilegios) intenta forzar una petición POST o PUT directa hacia la API de configuración global
    Cuando el backend intercepta y procesa la solicitud de red
    Entonces el sistema debe rechazar la transacción por completo
    Y debe emitir una respuesta con estado HTTP 403 Forbidden en formato JSON
    Y debe registrar un log persistente de auditoría con la IP de origen
