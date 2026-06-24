Característica: Procesamiento concurrente y de alto rendimiento de la telemetría
  Como motor de backend de RiskAlert
  Quiero procesar de manera asíncrona y concurrente las ráfagas de paquetes JSON de múltiples ESP32
  Para evitar retrasos o cuellos de botella en el flujo de monitoreo en tiempo real

  Escenario: Recepción masiva de telemetría de hasta 50 dispositivos
    Dado que un conjunto de hasta 50 microcontroladores ESP32 transmite tramas de telemetría en formato JSON cada 5 segundos en paralelo
    Cuando el endpoint recibe los datos simultáneamente
    Entonces el hilo de procesamiento asíncrono debe persistir cada trama en la base de datos en un tiempo inferior a 200 ms por paquete
    Y debe actualizar los valores reflejados en el panel de control sin caídas de servicio

  Escenario: Saturación transitoria del canal de escritura de la base de datos
    Dado que el flujo masivo de datos entrantes supera transitoriamente la capacidad de escritura por segundo de la base de datos principal debido a un pico de tráfico concurrente
    Cuando el backend intercepta la saturación del canal
    Entonces el sistema debe encolar temporalmente las tramas en un búfer en memoria distribuida (Redis)
    Y debe garantizar un 0% de pérdida de paquetes técnicos para su posterior procesamiento asíncrono ordenado
