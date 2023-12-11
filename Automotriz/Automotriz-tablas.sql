--Creacion de Tablas
CREATE TABLE "Clientes" (
  "IDCliente" serial PRIMARY KEY,
  "Nombre" varchar(255),
  "Direccion" text,
  "Telefono" varchar(15)
);

CREATE TABLE "Autos" (
  "IDAuto" serial PRIMARY KEY,
  "Modelo" varchar(50),
  "Marca" varchar(50),
  "AnioFabricacion" int,
  "Precio" decimal(10,2)
);

CREATE TABLE "Empleados" (
  "IDEmpleado" serial PRIMARY KEY,
  "Nombre" varchar(255),
  "Direccion" text,
  "Telefono" varchar(15),
  "Rol" varchar(50)
);

CREATE TABLE "Servicios" (
  "IDServicio" serial PRIMARY KEY,
  "NombreServicio" varchar(100),
  "Descripcion" text,
  "Precio" decimal(10,2)
);

CREATE TABLE "Mantenimientos" (
  "IDMantenimiento" serial PRIMARY KEY,
  "IDAuto" int,
  "IDCliente" int,
  "IDEmpleado" int,
  "IDServicio" int,
  "FechaMantenimiento" date
);

CREATE TABLE "HojalateriaPintura" (
  "IDHojalateriaPintura" serial PRIMARY KEY,
  "IDAuto" int,
  "IDCliente" int,
  "IDEmpleado" int,
  "IDServicio" int,
  "FechaHojalateriaPintura" date
);

CREATE TABLE "SegurosAuto" (
  "IDSeguro" serial PRIMARY KEY,
  "IDAuto" int,
  "IDCliente" int,
  "TipoSeguro" varchar(50),
  "Cobertura" text,
  "Precio" decimal(10,2)
);

