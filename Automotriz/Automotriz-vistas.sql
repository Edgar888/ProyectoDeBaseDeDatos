-- Vista 1: Información Detallada de Mantenimientos con Detalles de Clientes y Autos.
CREATE VIEW VistaMantenimientosDetallados AS
SELECT
  m."IDMantenimiento",
  c."IDCliente",
  c."Nombre" AS "NombreCliente",
  c."Direccion" AS "DireccionCliente",
  c."Telefono" AS "TelefonoCliente",
  a."IDAuto",
  a."Marca",
  a."Modelo",
  m."FechaMantenimiento"
FROM
  "Mantenimientos" m
JOIN
  "Clientes" c ON m."IDCliente" = c."IDCliente"
JOIN
  "Autos" a ON m."IDAuto" = a."IDAuto";

-- Vista 2: Total de Mantenimientos Realizados por Cada Empleado.
CREATE VIEW VistaTotalMantenimientosPorEmpleado AS
SELECT
  e."IDEmpleado",
  e."Nombre" AS "NombreEmpleado",
  COUNT(m."IDMantenimiento") AS "TotalMantenimientos"
FROM
  "Empleados" e
LEFT JOIN
  "Mantenimientos" m ON e."IDEmpleado" = m."IDEmpleado"
GROUP BY
  e."IDEmpleado", e."Nombre";

-- Vista 3: Resumen de Precios de Servicios Agrupados por Tipo de Servicio.
CREATE VIEW VistaResumenPreciosServicios AS
SELECT
  "NombreServicio",
  AVG("Precio") AS "PrecioPromedio",
  MAX("Precio") AS "PrecioMaximo",
  MIN("Precio") AS "PrecioMinimo"
FROM
  "Servicios"
GROUP BY
  "NombreServicio";
