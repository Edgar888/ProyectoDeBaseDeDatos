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
