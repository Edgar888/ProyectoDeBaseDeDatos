-- Consulta 1: Obtener la información de los clientes que han realizado mantenimientos
-- en sus autos junto con los detalles de los mantenimientos.
SELECT
  c."IDCliente",
  c."Nombre" AS "NombreCliente",
  c."Direccion" AS "DireccionCliente",
  c."Telefono" AS "TelefonoCliente",
  m."IDMantenimiento",
  m."IDAuto",
  a."Marca",
  a."Modelo",
  m."FechaMantenimiento",
  s."NombreServicio",
  s."Descripcion",
  s."Precio" AS "PrecioServicio"
FROM
  "Clientes" c
JOIN
  "Mantenimientos" m ON c."IDCliente" = m."IDCliente"
JOIN
  "Autos" a ON m."IDAuto" = a."IDAuto"
JOIN
  "Servicios" s ON m."IDServicio" = s."IDServicio";

-- Consulta 2: Obtener la cantidad total de autos que han sido sometidos a hojalatería 
-- y pintura, agrupados por marca.
SELECT
  a."Marca",
  COUNT(hp."IDHojalateriaPintura") AS "CantidadAutosHojalateriaPintura"
FROM
  "Autos" a
LEFT JOIN
  "HojalateriaPintura" hp ON a."IDAuto" = hp."IDAuto"
GROUP BY
  a."Marca";

-- Consulta 3: Obtener la lista de empleados y la cantidad de mantenimientos que han
-- realizado cada uno, ordenados de mayor a menor cantidad.
SELECT
  e."IDEmpleado",
  e."Nombre" AS "NombreEmpleado",
  COUNT(m."IDMantenimiento") AS "CantidadMantenimientos"
FROM
  "Empleados" e
LEFT JOIN
  "Mantenimientos" m ON e."IDEmpleado" = m."IDEmpleado"
GROUP BY
  e."IDEmpleado", e."Nombre"
ORDER BY
  "CantidadMantenimientos" DESC;