Característica: Extensibilidad de la arquitectura para nuevos tipos de sensores
  Como operador de planta
  Quiero que el sistema procese telemetría con estructuras flexibles
  Para permitir la integración futura de nuevos tipos de sensores sin requerir modificaciones en el código fuente ni paradas del servidor

  Escenario: Conexión de un nuevo modelo de sensor IoT
    Dado que el sistema procesa telemetría estructurada
    Y el equipo técnico conecta un nuevo modelo de sensor IoT que mide una variable diferente, como presión hidráulica en Bar
    Cuando el dispositivo transmite el paquete hacia el servidor
    Entonces el motor de backend debe reconocer dinámicamente la nueva clave del JSON
    Y debe mapearla de forma flexible en la base de datos sin requerir paradas del servidor
    Y debe incluir la nueva variable dentro del listado de consulta del activo

  Escenario: Recepción de un paquete de telemetría corrupto
    Dado que un dispositivo IoT defectuoso transmite un paquete de telemetría corrupto que no se alinea con la sintaxis mínima requerida
    Cuando la API intenta deserializar e interpretar la trama JSON entrante
    Entonces el sistema debe descartar el paquete inválido
    Y debe responder un estado HTTP 400 Bad Request al emisor
    Y debe escribir un log descriptivo en el panel de administración
    Y debe continuar el flujo normal de los demás sensores operativos sin alterar la CPU principal
