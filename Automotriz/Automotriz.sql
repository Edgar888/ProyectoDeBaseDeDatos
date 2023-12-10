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

-- Relaciones de las tablas.
ALTER TABLE "Mantenimientos" ADD FOREIGN KEY ("IDAuto") REFERENCES "Autos" ("IDAuto");
ALTER TABLE "Mantenimientos" ADD FOREIGN KEY ("IDCliente") REFERENCES "Clientes" ("IDCliente");
ALTER TABLE "Mantenimientos" ADD FOREIGN KEY ("IDEmpleado") REFERENCES "Empleados" ("IDEmpleado");
ALTER TABLE "Mantenimientos" ADD FOREIGN KEY ("IDServicio") REFERENCES "Servicios" ("IDServicio");
ALTER TABLE "HojalateriaPintura" ADD FOREIGN KEY ("IDAuto") REFERENCES "Autos" ("IDAuto");
ALTER TABLE "HojalateriaPintura" ADD FOREIGN KEY ("IDCliente") REFERENCES "Clientes" ("IDCliente");
ALTER TABLE "HojalateriaPintura" ADD FOREIGN KEY ("IDEmpleado") REFERENCES "Empleados" ("IDEmpleado");
ALTER TABLE "HojalateriaPintura" ADD FOREIGN KEY ("IDServicio") REFERENCES "Servicios" ("IDServicio");
ALTER TABLE "SegurosAuto" ADD FOREIGN KEY ("IDAuto") REFERENCES "Autos" ("IDAuto");
ALTER TABLE "SegurosAuto" ADD FOREIGN KEY ("IDCliente") REFERENCES "Clientes" ("IDCliente");
ALTER TABLE "Clientes" ADD FOREIGN KEY ("IDCliente") REFERENCES "Clientes" ("Nombre");

-- Script de Inserción de Datos para la tabla Autos

INSERT INTO Autos (Modelo, Marca, AnioFabricacion, Precio)
VALUES
  ('Sedan', 'Toyota', 2022, 25000.00),
  ('Civic', 'Honda', 2021, 23000.00),
  ('Camry', 'Toyota', 2023, 28000.00),
  ('Accord', 'Honda', 2022, 26000.00),
  ('Corolla', 'Toyota', 2021, 22000.00),
  ('Fusion', 'Ford', 2023, 27000.00),
  ('Altima', 'Nissan', 2022, 24000.00),
  ('Cruze', 'Chevrolet', 2021, 21000.00),
  ('Malibu', 'Chevrolet', 2023, 26000.00),
  ('Sentra', 'Nissan', 2022, 23000.00),
  ('Focus', 'Ford', 2021, 20000.00),
  ('Maxima', 'Nissan', 2023, 29000.00),
  ('Mustang', 'Ford', 2022, 35000.00),
  ('Corvette', 'Chevrolet', 2021, 70000.00),
  ('Rav4', 'Toyota', 2023, 32000.00),
  ('Camaro', 'Chevrolet', 2022, 40000.00),
  ('Escape', 'Ford', 2021, 27000.00),
  ('Pathfinder', 'Nissan', 2023, 31000.00),
  ('CR-V', 'Honda', 2022, 30000.00),
  ('Explorer', 'Ford', 2021, 34000.00),
  ('Armada', 'Nissan', 2023, 38000.00),
  ('Pilot', 'Honda', 2022, 33000.00),
  ('Tacoma', 'Toyota', 2021, 32000.00),
  ('Tundra', 'Toyota', 2023, 36000.00),
  ('Frontier', 'Nissan', 2022, 29000.00),
  ('Sedan', 'Toyota', 2022, 25000.00),
('SUV', 'Honda', 2021, 30000.00),
('Compacto', 'Ford', 2020, 20000.00),
('Pickup', 'Chevrolet', 2022, 35000.00),
('Coupe', 'BMW', 2021, 40000.00),
('Familiar', 'Volkswagen', 2020, 28000.00),
('Deportivo', 'Audi', 2022, 45000.00),
('Híbrido', 'Lexus', 2021, 32000.00),
('Crossover', 'Nissan', 2020, 27000.00),
('Camioneta', 'Jeep', 2022, 38000.00),
('Convertible', 'Mercedes-Benz', 2021, 50000.00),
('Subcompacto', 'Hyundai', 2020, 22000.00),
('Camión', 'Ram', 2022, 40000.00),
('SUV Compacto', 'Mazda', 2021, 28000.00),
('Minivan', 'Chrysler', 2020, 32000.00),
('Coupé Deportivo', 'Porsche', 2022, 55000.00),
('Auto Eléctrico', 'Tesla', 2021, 60000.00),
('SUV de Lujo', 'Jaguar', 2020, 70000.00),
('Roadster', 'Ferrari', 2022, 80000.00),
('Berlina', 'Volvo', 2021, 35000.00),
('Microcoche', 'Smart', 2020, 18000.00),
('Monovolumen', 'Kia', 2022, 30000.00),
('Hatchback', 'Subaru', 2021, 24000.00),
('Compacto Deportivo', 'Alfa Romeo', 2020, 38000.00),
('Coupé de Lujo', 'Lamborghini', 2022, 90000.00),
('Sedan', 'Toyota', 2022, 25000.00),
('Hatchback', 'Volkswagen', 2021, 20000.00),
('SUV', 'Honda', 2023, 30000.00),
('Pickup', 'Ford', 2020, 35000.00),
('Coupe', 'Chevrolet', 2022, 28000.00),
('Convertible', 'Mazda', 2021, 32000.00),
('Sedan', 'Hyundai', 2023, 26000.00),
('Hatchback', 'Kia', 2020, 23000.00),
('SUV', 'Nissan', 2022, 27000.00),
('Pickup', 'Ram', 2021, 33000.00),
('Coupe', 'BMW', 2020, 40000.00),
('Convertible', 'Audi', 2023, 38000.00),
('Sedan', 'Mercedes-Benz', 2021, 35000.00),
('Hatchback', 'Ford', 2022, 24000.00),
('SUV', 'Jeep', 2020, 32000.00),
('Pickup', 'Chevrolet', 2023, 37000.00),
('Coupe', 'Lexus', 2021, 29000.00),
('Convertible', 'Tesla', 2022, 45000.00),
('Sedan', 'Subaru', 2023, 26000.00),
('Hatchback', 'Volvo', 2020, 22000.00),
('SUV', 'Mitsubishi', 2021, 28000.00),
('Pickup', 'GMC', 2022, 36000.00),
('Coupe', 'Jaguar', 2020, 42000.00),
('Convertible', 'Porsche', 2023, 50000.00),
('Sedan', 'Acura', 2021, 31000.00);
('Sedán A1', 'Audi', 2022, 35000.00),
('Civic', 'Honda', 2021, 28000.00),
('Camry', 'Toyota', 2022, 32000.00),
('Accord', 'Honda', 2020, 30000.00),
('Mustang', 'Ford', 2021, 42000.00),
('Corolla', 'Toyota', 2023, 27000.00),
('C-Class', 'Mercedes-Benz', 2022, 50000.00),
('Rogue', 'Nissan', 2021, 32000.00),
('X5', 'BMW', 2023, 60000.00),
('Wrangler', 'Jeep', 2022, 35000.00),
('F-150', 'Ford', 2022, 38000.00),
('3 Series', 'BMW', 2021, 42000.00),
('Camaro', 'Chevrolet', 2023, 45000.00),
('Mazda3', 'Mazda', 2022, 26000.00),
('Pilot', 'Honda', 2020, 34000.00),
('Q5', 'Audi', 2023, 48000.00),
('Highlander', 'Toyota', 2021, 36000.00),
('Escalade', 'Cadillac', 2022, 75000.00),
('Grand Cherokee', 'Jeep', 2023, 42000.00),
('GLC', 'Mercedes-Benz', 2021, 52000.00),
('Civic Type R', 'Honda', 2022, 38000.00),
('Charger', 'Dodge', 2021, 41000.00),
('Malibu', 'Chevrolet', 2023, 29000.00),
('Mazda CX-5', 'Mazda', 2022, 31000.00),
('Atlas', 'Volkswagen', 2021, 36000.00);

