Característica: Visualización de la evolución histórica del estado de una máquina
  Como jefe de mantenimiento
  Quiero visualizar gráficas de tendencias basadas en los datos históricos de los sensores
  Para analizar el desgaste progresivo de los activos y programar mantenimientos con anticipación

  Antecedentes:
    Dado que el jefe de mantenimiento ha ingresado al panel de analítica histórica

  Escenario: Consulta de un rango de fechas válido
    Dado que el jefe de mantenimiento selecciona una máquina del menú desplegable
    Y selecciona un rango de fechas de consulta válido
    Cuando presiona el botón "Cargar datos"
    Entonces la pantalla debe renderizar un gráfico de líneas continuo con ejes independientes (X: tiempo, Y: unidad del sensor)
    Y debe incluir marcadores de puntos para inspección detallada al pasar el cursor (hover)

  Escenario: Consulta histórica masiva de datos
    Dado que el usuario ingresa una solicitud de consulta histórica que abarca millones de filas de datos en crudo con un rango mayor a 6 meses
    Cuando presiona el botón "Cargar datos"
    Entonces el servidor debe agrupar los datos automáticamente por promedios diarios antes de enviarlos
    Y debe mostrar la información resumida en el gráfico
    Y la interfaz del navegador no debe congelarse
