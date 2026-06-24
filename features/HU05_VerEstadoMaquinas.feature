Característica: Visualización del estado de las máquinas en tiempo real
  Como técnico de mantenimiento
  Quiero ver en una pantalla el estado en tiempo real de todas las máquinas conectadas
  Para saber si alguna está fallando sin tener que ir a revisarlas una por una

  Antecedentes:
    Dado que el técnico ha iniciado sesión en la plataforma RiskAlert
    Y se encuentra en el dashboard principal con un layout de cuadrícula interactiva de tarjetas por máquina

  Escenario: Las máquinas transmiten datos con normalidad
    Dado que las máquinas conectadas transmiten datos de telemetría con normalidad
    Cuando el dashboard recibe la información de los sensores
    Entonces el panel debe pintar las tarjetas en color verde indicando estado "Operativo"
    Y debe exhibir los valores numéricos actualizados de Temperatura (°C), Vibración (Hz) y Corriente (A)
    Y debe refrescar las variables automáticamente cada 5 segundos

  Escenario: Pérdida de telemetría por desconexión del microcontrolador
    Dado que un microcontrolador ESP32 deja de transmitir datos por pérdida total de señal de red o corte de energía en la planta
    Cuando el software detecta la ausencia de telemetría por más de 30 segundos
    Entonces la tarjeta de la máquina debe cambiar automáticamente a color gris con estado "Fuera de línea"
    Y debe deshabilitar sus variables numéricas
    Y debe superponer un texto de advertencia de desconexión
