Característica: Recepción de alertas ante anomalías en la maquinaria
  Como técnico de mantenimiento
  Quiero que el sistema me muestre una alerta visual inmediata cuando una máquina supere sus umbrales seguros
  Para actuar de forma proactiva antes de que ocurra una falla crítica

  Escenario: Lectura del sensor sobrepasa el umbral configurado
    Dado que las lecturas capturadas por el sensor IoT sobrepasan el límite máximo configurado en el sistema
    Cuando el backend procesa la anomalía en tiempo real
    Entonces el panel web debe desplegar un aviso flotante parpadeante en color rojo carmesí en la parte superior
    Y debe identificar explícitamente el ID de la máquina, la variable afectada, el valor de exceso alcanzado y la hora exacta del evento

  Escenario: Pico de lectura aislado por falso contacto eléctrico
    Dado que un sensor genera un pico de lectura alterado y aislado por milisegundos debido a un falso contacto eléctrico
    Cuando la regla lógica del software verifica que el evento no es una tendencia sostenida por más de 3 lecturas consecutivas
    Entonces el sistema debe ignorar la falsa alarma
    Y debe descartar la notificación en el panel del taller
    Y debe registrar el evento únicamente en el log técnico de auditoría
