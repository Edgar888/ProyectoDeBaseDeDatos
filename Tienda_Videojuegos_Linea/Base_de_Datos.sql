CREATE TABLE Cliente
(
  Id_cliente INT NOT NULL,
  NombreC VARCHAR(30) NOT NULL,
  Direccion VARCHAR(30),
  EmailC VARCHAR(255) NOT NULL,
  Num_celularC VARCHAR(15) NOT NULL,
  Saldo DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (Id_cliente)
);

CREATE TABLE Empleado
(
  Id_empleado INT NOT NULL,
  NombreE VARCHAR(30) NOT NULL,
  Cargo VARCHAR(30) NOT NULL,
  EmailE VARCHAR(255) NOT NULL,
  Num_celularE VARCHAR(15) NOT NULL,
  Horas_trabajadas INT NOT NULL,
  Supervisa_Id_empleado INT,
  PRIMARY KEY (Id_empleado)
);

ALTER TABLE Empleado
ADD CONSTRAINT fk_supervisa_empleado
FOREIGN KEY (Supervisa_Id_empleado) REFERENCES Empleado(Id_empleado);


CREATE TABLE Juego
(
  Id_juego INT NOT NULL,
  Titulo VARCHAR(100) NOT NULL,
  Genero VARCHAR(50) NOT NULL,
  Plataforma VARCHAR(50) NOT NULL,
  Precio DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (Id_juego)
);

CREATE TABLE Inventario
(
  Id_inventario INT NOT NULL,
  Stock INT NOT NULL,
  PRIMARY KEY (Id_inventario)
);

CREATE TABLE Pedido
(
  Id_pedido INT NOT NULL,
  Fecha_pedido DATE NOT NULL,
  PRIMARY KEY (Id_pedido)
);

CREATE TABLE Ventas
(
  Id_venta INT NOT NULL,
  Fecha_venta DATE NOT NULL,
  Precio_total DECIMAL(10, 2) NOT NULL,
  Id_pedido INT NOT NULL,
  PRIMARY KEY (Id_venta),
  FOREIGN KEY (Id_pedido) REFERENCES Pedido(Id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE VentaJuegoCliente
(
  Id_venta_cliente INT NOT NULL,
  Precio_venta DECIMAL(10, 2) NOT NULL,
  Fecha_venta DATE NOT NULL,
  PRIMARY KEY (Id_venta_cliente)
);


CREATE TABLE HistorialCompras
(
  Compras_realizadas INT NOT NULL,
  Id_historial INT NOT NULL,
  Id_cliente INT NOT NULL,
  Id_pedido INT NOT NULL,
  PRIMARY KEY (Id_historial, Id_cliente, Id_pedido),
  FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_pedido) REFERENCES Pedido(Id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Realiza_pedido
(
  Id_cliente INT NOT NULL,
  Id_pedido INT NOT NULL,
  PRIMARY KEY (Id_cliente, Id_pedido),
  FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_pedido) REFERENCES Pedido(Id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pedido_Contiene
(
  Id_pedido INT NOT NULL,
  Id_juego INT NOT NULL,
  PRIMARY KEY (Id_pedido, Id_juego),
  FOREIGN KEY (Id_pedido) REFERENCES Pedido(Id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_juego) REFERENCES Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Hay_stock
(
  Id_inventario INT NOT NULL,
  Id_juego INT NOT NULL,
  PRIMARY KEY (Id_inventario, Id_juego),
  FOREIGN KEY (Id_inventario) REFERENCES Inventario(Id_inventario) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_juego) REFERENCES Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cliente_Vende_juego
(
  Cantidad_Juegos_vendidos INT NOT NULL,
  Id_cliente INT NOT NULL,
  Id_venta_cliente INT NOT NULL,
  PRIMARY KEY (Id_cliente, Id_venta_cliente),
  FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_venta_cliente) REFERENCES VentaJuegoCliente(Id_venta_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE VentaContiene_juego
(
  Id_venta_cliente INT NOT NULL,
  Id_juego INT NOT NULL,
  PRIMARY KEY (Id_venta_cliente, Id_juego),
  FOREIGN KEY (Id_venta_cliente) REFERENCES VentaJuegoCliente(Id_venta_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_juego) REFERENCES Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Detalles_Pedido
(
  Id_detalles INT NOT NULL,
  Cantidad INT NOT NULL,
  Precio_unitario DECIMAL(10, 2) NOT NULL,
  Id_pedido INT NOT NULL,
  Id_juego INT NOT NULL,
  PRIMARY KEY (Id_detalles, Id_pedido, Id_juego),
  FOREIGN KEY (Id_pedido) REFERENCES Pedido(Id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_juego) REFERENCES Juego(Id_juego) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Compra_Juegos
(
  Id_cliente INT NOT NULL,
  Id_venta INT NOT NULL,
  PRIMARY KEY (Id_cliente, Id_venta),
  FOREIGN KEY (Id_cliente) REFERENCES Cliente(Id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_venta) REFERENCES Ventas(Id_venta) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Realiza_venta
(
  Id_empleado INT NOT NULL,
  Id_venta INT NOT NULL,
  PRIMARY KEY (Id_empleado, Id_venta),
  FOREIGN KEY (Id_empleado) REFERENCES Empleado(Id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Id_venta) REFERENCES Ventas(Id_venta) ON DELETE CASCADE ON UPDATE CASCADE
);

--Registros para poblar la base de datos

--Clientes
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (101, 'María García', 'Av. Principal, Ciudad B', 'maria@email.com', '9876543210', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (102, 'Carlos López', 'Calle Central, Ciudad C', 'carlos@email.com', '5551112233', 100.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (103, 'Ana Martínez', 'Carrera 45, Ciudad D', 'ana@email.com', '7778889990', 120.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (104, 'Sofía Ramírez', 'Av. Libertador, Ciudad E', 'sofia@email.com', '5552223334', 180.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (105, 'Diego Hernández', 'Calle 67, Ciudad F', 'diego@email.com', '3339998887', 90.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (106, 'Laura Castillo', 'Av. Bolívar, Ciudad G', 'laura@email.com', '4445556665', 210.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (107, 'Pedro Díaz', 'Carrera 12, Ciudad H', 'pedro@email.com', '2227778880', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (108, 'Gabriela Vargas', 'Calle 78, Ciudad I', 'gabriela@email.com', '9993334442', 130.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (109, 'Jorge Ruiz', 'Av. Central, Ciudad J', 'jorge@email.com', '8884445551', 190.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (110, 'Fernanda Gómez', 'Calle 34, Ciudad K', 'fernanda@email.com', '6661112223', 160.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (111, 'Andrés Castro', 'Av. Norte, Ciudad L', 'andres@email.com', '3337778884', 140.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (112, 'Valentina Navarro', 'Carrera 56, Ciudad M', 'valentina@email.com', '2223334445', 220.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (113, 'Ricardo Mendoza', 'Calle 89, Ciudad N', 'ricardo@email.com', '7771112226', 115.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (114, 'Daniela Torres', 'Av. Sur, Ciudad O', 'daniela@email.com', '8889990007', 205.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (115, 'Luis Rodríguez', 'Carrera 78, Ciudad Z', 'luis@email.com', '1112223334', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (116, 'Isabel Silva', 'Calle 56, Ciudad AA', 'isabel@email.com', '9998887776', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (117, 'Martín Gutiérrez', 'Av. 10, Ciudad BB', 'martin@email.com', '3337779998', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (118, 'Carmen Reyes', 'Carrera 23, Ciudad CC', 'carmen@email.com', '7773332221', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (119, 'Hugo Sánchez', 'Calle 90, Ciudad DD', 'hugo@email.com', '8884445557', 165.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (120, 'Silvia Pérez', 'Av. 5, Ciudad EE', 'silvia@email.com', '1115557779', 225.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (121, 'Raúl Hernández', 'Carrera 67, Ciudad FF', 'raul@email.com', '2224446662', 140.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (122, 'Carolina Martínez', 'Calle 12, Ciudad GG', 'carolina@email.com', '9990001113', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (123, 'Roberto Gómez', 'Av. 20, Ciudad HH', 'roberto@email.com', '3336669994', 155.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (124, 'Lucía Díaz', 'Carrera 78, Ciudad II', 'lucia@email.com', '4447770005', 210.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (125, 'Eduardo Vargas', 'Calle 45, Ciudad JJ', 'eduardo@email.com', '6663330008', 180.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (126, 'Adriana Ruiz', 'Av. 30, Ciudad KK', 'adriana@email.com', '8885552221', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (127, 'Óscar Castro', 'Carrera 10, Ciudad LL', 'oscar@email.com', '2229998880', 190.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (128, 'Marisol Navarro', 'Calle 67, Ciudad MM', 'marisol@email.com', '5553331112', 205.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (129, 'Gonzalo Mendoza', 'Av. 40, Ciudad NN', 'gonzalo@email.com', '7771113334', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (130, 'Valeria Torres', 'Carrera 56, Ciudad OO', 'valeria@email.com', '8887776665', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (131, 'Mateo López', 'Calle 78, Ciudad PP', 'mateo@email.com', '1119998883', 160.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (132, 'Renata González', 'Av. 15, Ciudad QQ', 'renata@email.com', '4440006664', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (133, 'Arturo Sánchez', 'Carrera 90, Ciudad RR', 'arturo@email.com', '5554443337', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (134, 'Camila Rivera', 'Calle 20, Ciudad SS', 'camila@email.com', '6667778880', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (135, 'Bruno Fernández', 'Av. 25, Ciudad TT', 'bruno@email.com', '9998887772', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (136, 'Gabriel Silva', 'Calle 89, Ciudad UU', 'gabriel@email.com', '1112223334', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (137, 'Mariana Gutiérrez', 'Av. 30, Ciudad VV', 'mariana@email.com', '3334445556', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (138, 'Ricardo Reyes', 'Carrera 56, Ciudad WW', 'ricardo@email.com', '7778889990', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (139, 'Fernanda Sánchez', 'Calle 45, Ciudad XX', 'fernanda@email.com', '8889990001', 165.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (140, 'Santiago Pérez', 'Av. 10, Ciudad YY', 'santiago@email.com', '1112223335', 225.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (141, 'Luciana Hernández', 'Carrera 67, Ciudad ZZ', 'luciana@email.com', '2223334447', 140.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (142, 'Diego Martínez', 'Calle 78, Ciudad AAA', 'diego@email.com', '9990001118', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (143, 'Valentina Gómez', 'Av. 5, Ciudad BBB', 'valentina@email.com', '3334445559', 155.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (144, 'Matías Díaz', 'Carrera 12, Ciudad CCC', 'matias@email.com', '4445556660', 210.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (145, 'Isabella Vargas', 'Calle 67, Ciudad DDD', 'isabella@email.com', '6667778881', 180.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (146, 'Julián Ruiz', 'Av. 20, Ciudad EEE', 'julian@email.com', '8889990002', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (147, 'Ana Castro', 'Carrera 10, Ciudad FFF', 'ana@email.com', '2223334443', 190.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (148, 'Manuel Navarro', 'Calle 78, Ciudad GGG', 'manuel@email.com', '5556667774', 205.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (149, 'Carla Mendoza', 'Av. 15, Ciudad HHH', 'carla@email.com', '7778889995', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (150, 'Maximiliano Torres', 'Carrera 56, Ciudad III', 'maximiliano@email.com', '8889990006', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (151, 'Luna López', 'Calle 20, Ciudad JJJ', 'luna@email.com', '1112223337', 160.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (152, 'Simón González', 'Av. 25, Ciudad KKK', 'simon@email.com', '4445556668', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (153, 'Alicia Sánchez', 'Carrera 90, Ciudad LLL', 'alicia@email.com', '5556667779', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (154, 'Lucas Rivera', 'Calle 34, Ciudad MMM', 'lucas@email.com', '6667778880', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (155, 'Valentino Fernández', 'Av. 40, Ciudad NNN', 'valentino@email.com', '9990001112', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (156, 'Martina Silva', 'Av. 10, Ciudad OOO', 'martina@email.com', '1112223334', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (157, 'Luciano Gutiérrez', 'Calle 56, Ciudad PPP', 'luciano@email.com', '3334445556', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (158, 'Gabriela Reyes', 'Carrera 78, Ciudad QQQ', 'gabriela@email.com', '7778889990', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (159, 'Javier Sánchez', 'Av. 30, Ciudad RRR', 'javier@email.com', '8889990001', 165.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (160, 'Selena Pérez', 'Calle 45, Ciudad SSS', 'selena@email.com', '1112223335', 225.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (161, 'Matías Hernández', 'Carrera 10, Ciudad TTT', 'matias@email.com', '2223334447', 140.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (162, 'Ariana Martínez', 'Av. 20, Ciudad UUU', 'ariana@email.com', '9990001118', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (163, 'Facundo Gómez', 'Calle 78, Ciudad VVV', 'facundo@email.com', '3334445559', 155.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (164, 'Abril Díaz', 'Carrera 56, Ciudad WWW', 'abril@email.com', '4445556660', 210.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (165, 'Tomás Vargas', 'Av. 5, Ciudad XXX', 'tomas@email.com', '6667778881', 180.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (166, 'Isadora Ruiz', 'Calle 67, Ciudad YYY', 'isadora@email.com', '8889990002', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (167, 'Santiago Castro', 'Carrera 12, Ciudad ZZZ', 'santiago_castro@email.com', '2223334443', 190.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (168, 'Catalina Navarro', 'Av. 30, Ciudad AAAA', 'catalina@email.com', '5556667774', 205.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (169, 'Gael Mendoza', 'Calle 45, Ciudad BBBB', 'gael@email.com', '7778889995', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (170, 'Martina Torres', 'Av. 10, Ciudad CCCC', 'martina_torres@email.com', '8889990006', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (171, 'Benjamín López', 'Carrera 56, Ciudad DDDD', 'benjamin@email.com', '1112223337', 160.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (172, 'Aitana González', 'Av. 20, Ciudad EEEE', 'aitana@email.com', '4445556668', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (173, 'Facundo Sánchez', 'Calle 10, Ciudad FFFF', 'facundo_sanchez@email.com', '5556667779', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (174, 'Martina Rivera', 'Carrera 78, Ciudad GGGG', 'martina_rivera@email.com', '6667778880', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (175, 'Valentina Fernández', 'Av. 5, Ciudad HHHH', 'valentina_fernandez@email.com', '9990001112', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (176, 'Mateo Silva', 'Av. 10, Ciudad IIII', 'mateo@email.com', '1112223334', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (177, 'Valeria Gutiérrez', 'Calle 56, Ciudad JJJJ', 'valeria@email.com', '3334445556', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (178, 'Joaquín Reyes', 'Carrera 78, Ciudad KKKK', 'joaquin@email.com', '7778889990', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (179, 'Daniela Sánchez', 'Av. 30, Ciudad LLLL', 'daniela@email.com', '8889990001', 165.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (180, 'Leonardo Pérez', 'Calle 45, Ciudad MMMM', 'leonardo@email.com', '1112223335', 225.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (181, 'Isabella Hernández', 'Carrera 10, Ciudad NNNN', 'isabella@email.com', '2223334447', 140.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (182, 'Juan Martínez', 'Av. 20, Ciudad OOOO', 'juan@email.com', '9990001118', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (183, 'Abril Gómez', 'Calle 78, Ciudad PPPP', 'abril@email.com', '3334445559', 155.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (184, 'Hugo Díaz', 'Carrera 56, Ciudad QQQQ', 'hugo@email.com', '4445556660', 210.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (185, 'Camila Vargas', 'Av. 5, Ciudad RRRR', 'camila@email.com', '6667778881', 180.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (186, 'Lautaro Ruiz', 'Calle 67, Ciudad SSSS', 'lautaro@email.com', '8889990002', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (187, 'Emilia Castro', 'Carrera 12, Ciudad TTTT', 'emilia@email.com', '2223334443', 190.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (188, 'Benicio Navarro', 'Av. 30, Ciudad UUUU', 'benicio@email.com', '5556667774', 205.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (189, 'Renata Mendoza', 'Calle 45, Ciudad VVVV', 'renata@email.com', '7778889995', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (190, 'Diego Torres', 'Av. 10, Ciudad WWWW', 'diego_torres@email.com', '8889990006', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (191, 'Mía López', 'Carrera 56, Ciudad XXXX', 'mia@email.com', '1112223337', 160.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (192, 'Santino González', 'Av. 20, Ciudad YYYY', 'santino@email.com', '4445556668', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (193, 'Abril Sánchez', 'Calle 10, Ciudad ZZZZ', 'abril_sanchez@email.com', '5556667779', 170.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (194, 'Amelia Rivera', 'Carrera 78, Ciudad AAAAA', 'amelia@email.com', '6667778880', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (195, 'Dante Fernández', 'Av. 5, Ciudad BBBBB', 'dante@email.com', '9990001112', 200.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (196, 'Lucas Silva', 'Av. 10, Ciudad CCCCC', 'lucas@email.com', '1112223334', 185.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (197, 'Isabel Gutiérrez', 'Calle 56, Ciudad DDDDD', 'isabel@email.com', '3334445556', 195.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (198, 'Agustín Reyes', 'Carrera 78, Ciudad EEEEE', 'agustin@email.com', '7778889990', 175.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (199, 'Marina Sánchez', 'Av. 30, Ciudad FFFFF', 'marina@email.com', '8889990001', 165.00);
INSERT INTO Cliente (Id_cliente, NombreC, Direccion, EmailC, Num_celularC, Saldo) VALUES (200, 'Natalia Fernández', 'Calle 123, Ciudad X', 'natalia@email.com', '9876543210', 175.00);

--Empleado
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (201, 'Gabriel García', 'Gerente', 'gabriel@email.com', '2345678901', 40, NULL);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (202, 'Julián Gómez', 'Supervisor de Ventas', 'julian@email.com', '3456789012', 38, 201);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (203, 'Victoria Martínez', 'Vendedor', 'victoria@email.com', '4567890123', 42, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (204, 'Emilio Pérez', 'Vendedor', 'emilio@email.com', '5678901234', 35, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (205, 'Isabella Gutiérrez', 'Vendedor', 'isabella@email.com', '6789012345', 30, 202); 
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (206, 'Martín Sánchez', 'Vendedor', 'martin_s@email.com', '7890123456', 38, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (207, 'Valeria González', 'Vendedor', 'valeria_g@email.com', '8901234567', 38, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (208, 'Lucas Pérez', 'Vendedor', 'lucas_p@email.com', '9012345678', 30, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (209, 'Sofía Rodríguez', 'Vendedor', 'sofia_r@email.com', '0123456789', 38, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (210, 'Javier Pérez', 'Vendedor', 'javier_p@email.com', '1234509876', 30, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (211, 'Renata Gómez', 'Vendedor', 'renata_g@email.com', '2345678901', 38, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (212, 'Marina Rodríguez', 'Vendedor', 'marina_r@email.com', '3456789012', 30, 202);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (213, 'Elena Ramírez', 'Supervisor de Ventas', 'elena_r@email.com', '4567890123', 42, 201);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (214, 'Giselle Martínez', 'Vendedor', 'giselle_m@email.com', '4567890123', 42, 213);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (215, 'Miguel Sánchez', 'Vendedor', 'miguel_s@email.com', '5678901234', 35, 213);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (216, 'Fernanda Gutiérrez', 'Vendedor', 'fernanda_g@email.com', '6789012345', 30, 213);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (217, 'Carlos Ruiz', 'Vendedor', 'carlos_r@email.com', '7890123456', 38, 213);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (218, 'María González', 'Vendedor', 'maria_g@email.com', '8901234567', 38, 213);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (219, 'Diego Herrera', 'Supervisor de Ventas', 'diego_h@email.com', '5678901234', 38, 201);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (220, 'Giselle Martínez', 'Vendedor', 'giselle_m@email.com', '4567890123', 42, 219);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (221, 'Miguel Sánchez', 'Vendedor', 'miguel_s@email.com', '5678901234', 35, 219);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (222, 'Fernanda Gutiérrez', 'Vendedor', 'fernanda_g@email.com', '6789012345', 30, 219);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (223, 'Carlos Ruiz', 'Vendedor', 'carlos_r@email.com', '7890123456', 38, 219);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (224, 'Natalia Vargas', 'Supervisor de Ventas', 'natalia_v@email.com', '6789012345', 42, 201);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (225, 'María González', 'Vendedor', 'maria_g@email.com', '8901234567', 38, 224);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (226, 'Andrés Pérez', 'Vendedor', 'andres_p@email.com', '9012345678', 30, 224);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (227, 'Valeria Rodríguez', 'Vendedor', 'valeria_r@email.com', '0123456789', 38, 224);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (228, 'Jorge Pérez', 'Vendedor', 'jorge_p@email.com', '1234509876', 30, 224);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (229, 'Romina Gómez', 'Vendedor', 'romina_g@email.com', '2345678901', 38, 224);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (230, 'Mateo Rodríguez', 'Vendedor', 'mateo_r@email.com', '3456789012', 30, 224);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (231, 'Alejandra Martínez', 'Vendedor', 'alejandra_m@email.com', '4567890123', 42, 224);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (232, 'Hugo Rojas', 'Supervisor de Ventas', 'hugo_r@email.com', '7890123456', 35, 201);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (233, 'Felipe Gómez', 'Vendedor', 'felipe_g@email.com', '5678901234', 35, 232);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (234, 'Laura Gutiérrez', 'Vendedor', 'laura_g@email.com', '6789012345', 30, 232);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (235, 'Carolina Díaz', 'Supervisor de Ventas', 'carolina_d@email.com', '8901234567', 42, 201);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (236, 'Felipe Gómez', 'Vendedor', 'felipe_g@email.com', '5678901234', 35, 234);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (237, 'Laura Gutiérrez', 'Vendedor', 'laura_g@email.com', '6789012345', 30, 234);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (238, 'Roberto Sánchez', 'Vendedor', 'roberto_s@email.com', '7890123456', 38, 234);
INSERT INTO Empleado (Id_empleado, NombreE, Cargo, EmailE, Num_celularE, Horas_trabajadas, Supervisa_Id_empleado) VALUES (239, 'Tomás Méndez', 'Supervisor de Ventas', 'tomas_m@email.com', '9012345678', 42, 201);

--Juego
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (301, 'The Witcher 3: Wild Hunt', 'RPG', 'PC', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (302, 'Red Dead Redemption 2', 'Acción-Aventura', 'PlayStation', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (303, 'The Legend of Zelda: Breath of the Wild', 'Aventura', 'Nintendo Switch', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (304, 'FIFA 22', 'Deportes', 'Xbox', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (305, 'Cyberpunk 2077', 'RPG', 'PC', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (306, 'Super Mario Odyssey', 'Plataformas', 'Nintendo Switch', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (307, 'Call of Duty: Warzone', 'Shooter', 'PlayStation', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (308, 'Assassins Creed Valhalla', 'Acción-Aventura', 'Xbox', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (309, 'Minecraft', 'Sandbox', 'PC', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (310, 'Animal Crossing: New Horizons', 'Simulación', 'Nintendo Switch', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (311, 'GTA V', 'Acción-Aventura', 'PlayStation', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (312, 'Halo Infinite', 'Shooter', 'Xbox', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (313, 'Among Us', 'Estrategia', 'PC', 4.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (314, 'The Last of Us Part II', 'Acción-Aventura', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (315, 'Mario Kart 8 Deluxe', 'Carreras', 'Nintendo Switch', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (316, 'Overwatch', 'Shooter', 'PC', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (317, 'Super Smash Bros. Ultimate', 'Lucha', 'Nintendo Switch', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (318, 'Far Cry 6', 'Acción-Aventura', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (319, 'Forza Horizon 5', 'Carreras', 'Xbox', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (320, 'Death Stranding', 'Aventura', 'PC', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (321, 'Ghost of Tsushima', 'Acción-Aventura', 'PlayStation', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (322, 'The Elder Scrolls V: Skyrim', 'RPG', 'PC', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (323, 'Pokémon Sword/Shield', 'RPG', 'Nintendo Switch', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (324, 'Resident Evil Village', 'Survival Horror', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (325, 'Final Fantasy VII Remake', 'RPG', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (326, 'Battlefield 2042', 'Shooter', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (327, 'Ratchet & Clank: Rift Apart', 'Acción-Aventura', 'PlayStation', 69.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (328, 'Doom Eternal', 'Shooter', 'Xbox', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (329, 'Horizon Zero Dawn', 'Acción-Aventura', 'PlayStation', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (330, 'League of Legends', 'MOBA', 'PC', 9.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (331, 'Persona 5 Strikers', 'RPG', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (332, 'The Sims 4', 'Simulación', 'PC', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (333, 'Demon Souls', 'Acción-Aventura', 'PlayStation', 69.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (334, 'Hades', 'Roguelike', 'Nintendo Switch', 24.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (335, 'Bioshock Infinite', 'Shooter', 'PC', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (336, 'Yakuza: Like a Dragon', 'RPG', 'Xbox', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (337, 'Watch Dogs: Legion', 'Acción-Aventura', 'PlayStation', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (338, 'Stardew Valley', 'Simulación', 'Nintendo Switch', 14.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (339, 'Tom Clancy’s Rainbow Six Siege', 'Shooter', 'Xbox', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (340, 'Marvel’s Spider-Man: Miles Morales', 'Acción-Aventura', 'PlayStation', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (341, 'Genshin Impact', 'RPG', 'PlayStation', 4.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (342, 'Civilization VI', 'Estrategia', 'PC', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (343, 'Sackboy: A Big Adventure', 'Plataformas', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (344, 'Dead by Daylight', 'Survival Horror', 'Xbox', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (345, 'Fornite', 'Battle Royale', 'PlayStation', 24.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (346, 'Outer Wilds', 'Aventura', 'Xbox', 24.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (347, 'Star Wars Jedi: Fallen Order', 'Acción-Aventura', 'PlayStation', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (348, 'No Man’s Sky', 'Aventura', 'PC', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (349, 'Nier Replicant ver.1.22474487139...', 'RPG', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (350, 'Subnautica', 'Aventura', 'Xbox', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (351, 'The Outer Worlds', 'RPG', 'Xbox', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (352, 'Assassins Creed Odyssey', 'Acción-Aventura', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (353, 'The Sims 3', 'Simulación', 'PC', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (354, 'Mortal Kombat 11', 'Lucha', 'Xbox', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (355, 'FIFA 23', 'Deportes', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (356, 'Forza Motorsport 7', 'Carreras', 'Xbox', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (357, 'Minecraft Dungeons', 'Acción-Aventura', 'Nintendo Switch', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (358, 'Street Fighter V', 'Lucha', 'PlayStation', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (359, 'Need for Speed: Heat', 'Carreras', 'Xbox', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (360, 'Super Mario 3D World + Bowser''s Fury', 'Plataformas', 'Nintendo Switch', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (361, 'Diablo III', 'RPG', 'PlayStation', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (362, 'Resident Evil 7: Biohazard', 'Survival Horror', 'Xbox', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (363, 'Stardew Valley', 'Simulación', 'PlayStation', 14.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (364, 'Monster Hunter: World', 'Acción-Aventura', 'Xbox', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (365, 'God of War', 'Acción-Aventura', 'PlayStation', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (366, 'Rocket League', 'Deportes', 'Nintendo Switch', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (367, 'The Elder Scrolls Online', 'RPG', 'PC', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (368, 'DOOM', 'Shooter', 'PlayStation', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (369, 'Celeste', 'Plataformas', 'Xbox', 9.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (370, 'NBA 2K22', 'Deportes', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (371, 'StarCraft II', 'Estrategia', 'PC', 5.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (372, 'Kingdom Hearts III', 'RPG', 'PlayStation', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (373, 'Rogue Company', 'Shooter', 'Xbox', 5.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (374, 'Cities: Skylines', 'Simulación', 'PC', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (375, 'Little Nightmares II', 'Aventura', 'PlayStation', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (376, 'Fallout 4', 'RPG', 'PlayStation', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (377, 'Cuphead', 'Plataformas', 'Xbox', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (378, 'Apex Legends', 'Shooter', 'PlayStation', 9.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (379, 'Civilization V', 'Estrategia', 'PC', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (380, 'The Binding of Isaac: Rebirth', 'Roguelike', 'Nintendo Switch', 14.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (381, 'Sekiro: Shadows Die Twice', 'Acción-Aventura', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (382, 'Terraria', 'Aventura', 'PC', 9.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (383, 'A Plague Tale: Innocence', 'Aventura', 'PlayStation', 49.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (384, 'Slay the Spire', 'Roguelike', 'Nintendo Switch', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (385, 'Rainbow Six: Extraction', 'Shooter', 'PlayStation', 59.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (386, 'Disco Elysium', 'RPG', 'PC', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (387, 'Subnautica: Below Zero', 'Aventura', 'Nintendo Switch', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (388, 'Hollow Knight', 'Plataformas', 'Xbox', 14.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (389, 'Control', 'Acción-Aventura', 'PlayStation', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (390, 'Dead Cells', 'Roguelike', 'PC', 24.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (391, 'Hades', 'Roguelike', 'PlayStation', 24.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (392, 'Ori and the Will of the Wisps', 'Plataformas', 'Xbox', 29.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (393, 'Halo: The Master Chief Collection', 'Shooter', 'PC', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (394, 'The Witness', 'Aventura', 'PlayStation', 39.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (395, 'Undertale', 'RPG', 'Nintendo Switch', 14.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (396, 'Ori and the Blind Forest', 'Plataformas', 'Nintendo Switch', 19.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (397, 'Stardew Valley', 'Simulación', 'Nintendo Switch', 14.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (398, 'Divinity: Original Sin 2', 'RPG', 'PC', 44.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (399, 'Celeste', 'Plataformas', 'Nintendo Switch', 9.99);
INSERT INTO Juego (Id_juego, Titulo, Genero, Plataforma, Precio) VALUES (400, 'Firewatch', 'Aventura', 'PC', 19.99);

--Inventario
INSERT INTO Inventario (Id_inventario, Stock) VALUES (401, 50);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (402, 30);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (403, 75);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (404, 20);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (405, 60);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (406, 45);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (407, 55);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (408, 25);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (409, 40);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (410, 70);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (411, 90);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (412, 15);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (413, 80);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (414, 35);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (415, 65);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (416, 85);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (417, 10);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (418, 50);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (419, 30);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (420, 75);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (421, 20);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (422, 60);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (423, 45);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (424, 55);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (425, 25);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (426, 40);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (427, 70);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (428, 90);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (429, 15);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (430, 80);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (431, 35);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (432, 65);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (433, 85);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (434, 10);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (435, 50);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (436, 30);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (437, 75);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (438, 20);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (439, 60);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (440, 45);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (441, 55);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (442, 25);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (443, 40);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (444, 70);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (445, 90);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (446, 15);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (447, 80);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (448, 35);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (449, 65);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (450, 85);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (451, 10);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (452, 50);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (453, 30);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (454, 75);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (455, 20);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (456, 60);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (457, 45);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (458, 55);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (459, 25);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (460, 40);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (461, 70);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (462, 90);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (463, 15);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (464, 80);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (465, 35);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (466, 65);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (467, 85);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (468, 10);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (469, 50);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (470, 30);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (471, 75);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (472, 20);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (473, 60);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (474, 45);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (475, 55);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (476, 25);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (477, 40);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (478, 70);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (479, 90);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (480, 15);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (481, 80);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (482, 35);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (483, 65);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (484, 85);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (485, 10);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (486, 50);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (487, 30);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (488, 75);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (489, 20);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (490, 60);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (491, 45);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (492, 55);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (493, 25);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (494, 40);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (495, 70);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (496, 90);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (497, 15);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (498, 80);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (499, 35);
INSERT INTO Inventario (Id_inventario, Stock) VALUES (500, 65);

--Pedido
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (501, '2023-01-01');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (502, '2023-01-02');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (503, '2023-01-03');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (504, '2023-01-04');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (505, '2023-01-05');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (506, '2023-01-06');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (507, '2023-01-07');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (508, '2023-01-08');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (509, '2023-01-09');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (510, '2023-01-10');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (511, '2023-01-11');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (512, '2023-01-12');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (513, '2023-01-13');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (514, '2023-01-14');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (515, '2023-01-15');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (516, '2023-01-16');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (517, '2023-01-17');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (518, '2023-01-18');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (519, '2023-01-19');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (520, '2023-01-20');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (521, '2023-01-21');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (522, '2023-01-22');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (523, '2023-01-23');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (524, '2023-01-24');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (525, '2023-01-25');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (526, '2023-01-26');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (527, '2023-01-27');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (528, '2023-01-28');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (529, '2023-01-29');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (530, '2023-01-30');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (531, '2023-02-01');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (532, '2023-02-02');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (533, '2023-02-03');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (534, '2023-02-04');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (535, '2023-02-05');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (536, '2023-02-06');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (537, '2023-02-07');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (538, '2023-02-08');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (539, '2023-02-09');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (540, '2023-02-10');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (541, '2023-02-11');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (542, '2023-02-12');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (543, '2023-02-13');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (544, '2023-02-14');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (545, '2023-02-15');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (546, '2023-02-16');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (547, '2023-02-17');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (548, '2023-02-18');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (549, '2023-02-19');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (550, '2023-02-20');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (551, '2023-02-21');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (552, '2023-02-22');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (553, '2023-02-23');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (554, '2023-02-24');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (555, '2023-02-25');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (556, '2023-02-26');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (557, '2023-02-27');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (558, '2023-02-28');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (559, '2023-03-01');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (560, '2023-03-02');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (561, '2023-03-03');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (562, '2023-03-04');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (563, '2023-03-05');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (564, '2023-03-06');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (565, '2023-03-07');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (566, '2023-03-08');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (567, '2023-03-09');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (568, '2023-03-10');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (569, '2023-03-11');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (570, '2023-03-12');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (571, '2023-03-13');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (572, '2023-03-14');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (573, '2023-03-15');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (574, '2023-03-16');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (575, '2023-03-17');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (576, '2023-03-18');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (577, '2023-03-19');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (578, '2023-03-20');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (579, '2023-03-21');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (580, '2023-03-22');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (581, '2023-03-23');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (582, '2023-03-24');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (583, '2023-03-25');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (584, '2023-03-26');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (585, '2023-03-27');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (586, '2023-03-28');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (587, '2023-03-29');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (588, '2023-03-30');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (589, '2023-03-31');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (590, '2023-04-01');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (591, '2023-04-02');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (592, '2023-04-03');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (593, '2023-04-04');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (594, '2023-04-05');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (595, '2023-04-06');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (596, '2023-04-07');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (597, '2023-04-08');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (598, '2023-04-09');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (599, '2023-04-10');
INSERT INTO Pedido (Id_pedido, Fecha_pedido) VALUES (600, '2023-04-11');

--Ventas
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (601, '2023-01-01', 50, 501);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (602, '2023-01-02', 75, 502);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (603, '2023-01-03', 60, 503);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (604, '2023-01-04', 40, 504);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (605, '2023-01-05', 90, 505);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (606, '2023-01-06', 55, 506);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (607, '2023-01-07', 70, 507);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (608, '2023-01-08', 65, 508);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (609, '2023-01-09', 80, 509);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (610, '2023-01-10', 100, 510);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (611, '2023-01-11', 45, 511);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (612, '2023-01-12', 85, 512);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (613, '2023-01-13', 55, 513);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (614, '2023-01-14', 70, 514);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (615, '2023-01-15', 60, 515);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (616, '2023-01-16', 75, 516);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (617, '2023-01-17', 90, 517);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (618, '2023-01-18', 80, 518);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (619, '2023-01-19', 95, 519);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (620, '2023-01-20', 110,520);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (621, '2023-01-21', 50, 521);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (622, '2023-01-22', 65, 522);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (623, '2023-01-23', 75, 523);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (624, '2023-01-24', 85, 524);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (625, '2023-01-25', 100, 525);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (626, '2023-01-26', 45, 526);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (627, '2023-01-27', 70, 527);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (628, '2023-01-28', 80, 528);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (629, '2023-01-29', 60, 529);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (630, '2023-01-30', 75, 530);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (631, '2023-02-01', 90, 531);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (632, '2023-02-02', 55, 532);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (633, '2023-02-03', 70, 533);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (634, '2023-02-04', 80, 534);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (635, '2023-02-05', 95, 535);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (636, '2023-02-06', 110, 536);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (637, '2023-02-07', 50, 537);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (638, '2023-02-08', 65, 538);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (639, '2023-02-09', 75, 539);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (640, '2023-02-10', 85, 540);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (641, '2023-02-11', 100, 541);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (642, '2023-02-12', 45, 542);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (643, '2023-02-13', 70, 543);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (644, '2023-02-14', 80, 544);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (645, '2023-02-15', 60, 545);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (646, '2023-02-16', 75, 546);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (647, '2023-02-17', 90, 547);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (648, '2023-02-18', 80, 548);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (649, '2023-02-19', 95, 549);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (650, '2023-02-20', 110, 550);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (651, '2023-02-21', 50, 551);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (652, '2023-02-22', 65, 552);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (653, '2023-02-23', 75, 553);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (654, '2023-02-24', 85, 554);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (655, '2023-02-25', 100, 555);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (656, '2023-02-26', 45, 556);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (657, '2023-02-27', 70, 557);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (658, '2023-02-28', 80, 558);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (659, '2023-03-01', 60, 559);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (660, '2023-03-02', 75, 560);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (661, '2023-03-03', 90, 561);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (662, '2023-03-04', 55, 562);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (663, '2023-03-05', 70, 563);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (664, '2023-03-06', 80, 564);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (665, '2023-03-07', 95, 565);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (666, '2023-03-08', 110, 566);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (667, '2023-03-09', 50, 567);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (668, '2023-03-10', 65, 568);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (669, '2023-03-11', 75, 569);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (670, '2023-03-12', 85, 570);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (671, '2023-03-13', 100, 571);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (672, '2023-03-14', 45, 572);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (673, '2023-03-15', 70, 573);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (674, '2023-03-16', 80, 574);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (675, '2023-03-17', 60, 575);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (676, '2023-03-18', 75, 576);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (677, '2023-03-19', 90, 577);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (678, '2023-03-20', 80, 578);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (679, '2023-03-21', 95, 579);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (680, '2023-03-22', 110, 580);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (681, '2023-03-23', 50, 581);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (682, '2023-03-24', 65, 582);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (683, '2023-03-25', 75, 583);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (684, '2023-03-26', 85, 584);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (685, '2023-03-27', 100, 585);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (686, '2023-03-28', 45, 586);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (687, '2023-03-29', 70, 587);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (688, '2023-03-30', 80, 588);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (689, '2023-03-31', 60, 589);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (690, '2023-04-01', 75, 590);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (691, '2023-04-02', 90, 591);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (692, '2023-04-03', 55, 592);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (693, '2023-04-04', 70, 593);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (694, '2023-04-05', 80, 594);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (695, '2023-04-06', 60, 595);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (696, '2023-04-07', 75, 596);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (697, '2023-04-08', 90, 597);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (698, '2023-04-09', 50, 598);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (699, '2023-04-10', 65, 599);
INSERT INTO Ventas (Id_venta, Fecha_venta, Precio_total, Id_pedido) VALUES (700, '2023-04-11', 75, 600);

--VentaJuegoCliente
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (701, 50.00, '2023-01-01');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (702, 75.00, '2023-01-02');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (703, 60.00, '2023-01-03');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (704, 40.00, '2023-01-04');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (705, 90.00, '2023-01-05');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (706, 55.00, '2023-01-06');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (707, 70.00, '2023-01-07');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (708, 65.00, '2023-01-08');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (709, 80.00, '2023-01-09');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (710, 100.00, '2023-01-10');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (711, 45.00, '2023-01-11');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (712, 85.00, '2023-01-12');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (713, 55.00, '2023-01-13');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (714, 70.00, '2023-01-14');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (715, 60.00, '2023-01-15');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (716, 75.00, '2023-01-16');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (717, 90.00, '2023-01-17');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (718, 80.00, '2023-01-18');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (719, 95.00, '2023-01-19');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (720, 110.00, '2023-01-20');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (721, 50.00, '2023-01-21');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (722, 65.00, '2023-01-22');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (723, 75.00, '2023-01-23');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (724, 85.00, '2023-01-24');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (725, 100.00, '2023-01-25');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (726, 45.00, '2023-01-26');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (727, 70.00, '2023-01-27');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (728, 80.00, '2023-01-28');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (729, 60.00, '2023-01-29');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (730, 75.00, '2023-01-30');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (731, 90.00, '2023-02-01');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (732, 55.00, '2023-02-02');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (733, 70.00, '2023-02-03');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (734, 80.00, '2023-02-04');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (735, 95.00, '2023-02-05');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (736, 110.00, '2023-02-06');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (737, 50.00, '2023-02-07');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (738, 65.00, '2023-02-08');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (739, 75.00, '2023-02-09');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (740, 85.00, '2023-02-10');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (741, 100.00, '2023-02-11');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (742, 45.00, '2023-02-12');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (743, 70.00, '2023-02-13');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (744, 80.00, '2023-02-14');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (745, 60.00, '2023-02-15');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (746, 75.00, '2023-02-16');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (747, 90.00, '2023-02-17');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (748, 80.00, '2023-02-18');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (749, 95.00, '2023-02-19');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (750, 110.00, '2023-02-20');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (751, 50.00, '2023-02-21');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (752, 65.00, '2023-02-22');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (753, 75.00, '2023-02-23');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (754, 85.00, '2023-02-24');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (755, 100.00, '2023-02-25');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (756, 45.00, '2023-02-26');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (757, 70.00, '2023-02-27');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (758, 80.00, '2023-02-28');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (759, 60.00, '2023-03-01');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (760, 75.00, '2023-03-02');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (761, 90.00, '2023-03-03');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (762, 55.00, '2023-03-04');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (763, 70.00, '2023-03-05');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (764, 80.00, '2023-03-06');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (765, 95.00, '2023-03-07');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (766, 110.00, '2023-03-08');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (767, 50.00, '2023-03-09');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (768, 65.00, '2023-03-10');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (769, 75.00, '2023-03-11');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (770, 85.00, '2023-03-12');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (771, 100.00, '2023-03-13');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (772, 45.00, '2023-03-14');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (773, 70.00, '2023-03-15');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (774, 80.00, '2023-03-16');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (775, 60.00, '2023-03-17');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (776, 75.00, '2023-03-18');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (777, 90.00, '2023-03-19');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (778, 80.00, '2023-03-20');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (779, 95.00, '2023-03-21');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (780, 110.00, '2023-03-22');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (781, 50.00, '2023-03-23');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (782, 65.00, '2023-03-24');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (783, 75.00, '2023-03-25');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (784, 85.00, '2023-03-26');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (785, 100.00, '2023-03-27');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (786, 45.00, '2023-03-28');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (787, 70.00, '2023-03-29');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (788, 80.00, '2023-03-30');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (789, 60.00, '2023-03-31');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (790, 75.00, '2023-04-01');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (791, 90.00, '2023-04-02');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (792, 55.00, '2023-04-03');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (793, 70.00, '2023-04-04');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (794, 80.00, '2023-04-05');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (795, 60.00, '2023-04-06');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (796, 75.00, '2023-04-07');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (797, 90.00, '2023-04-08');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (798, 50.00, '2023-04-09');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (799, 65.00, '2023-04-10');
INSERT INTO VentaJuegoCliente (Id_venta_cliente, Precio_venta, Fecha_venta) VALUES (800, 75.00, '2023-04-11');

--HistorialCompras
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 801, 101, 501);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 802, 102, 502);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 803, 103, 503);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 804, 104, 504);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 805, 105, 505);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 806, 106, 506);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 807, 107, 507);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 808, 108, 508);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 809, 109, 509);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (3, 810, 110, 510);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 811, 111, 511);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 812, 112, 512);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (4, 813, 113, 513);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 814, 114, 514);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 815, 115, 515);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 816, 116, 516);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 817, 117, 517);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 818, 118, 518);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 819, 119, 519);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 820, 120, 520);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 821, 121, 521);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 822, 122, 522);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 823, 123, 523);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 824, 124, 524);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 825, 125, 525);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 826, 126, 526);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 827, 127, 527);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 828, 128, 528);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 829, 129, 529);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 830, 130, 530);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 831, 131, 531);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 832, 132, 532);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 833, 133, 533);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 834, 134, 534);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 835, 135, 535);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 836, 136, 536);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 837, 137, 537);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 838, 138, 538);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 839, 139, 539);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 840, 140, 540);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 841, 141, 541);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 842, 142, 542);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 843, 143, 543);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 844, 144, 544);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 845, 145, 545);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 846, 146, 546);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 847, 147, 547);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 848, 148, 548);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 849, 149, 549);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 850, 150, 550);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 851, 151, 551);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 852, 152, 552);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 853, 153, 553);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 854, 154, 554);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 855, 155, 555);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 856, 156, 556);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 857, 157, 557);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 858, 158, 558);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 859, 159, 559);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 860, 160, 560);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 861, 161, 561);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 862, 162, 562);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 863, 163, 563);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 864, 164, 564);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 865, 165, 565);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 866, 166, 566);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 867, 167, 567);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 868, 168, 568);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 869, 169, 569);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 870, 170, 570);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 871, 171, 571);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 872, 172, 572);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 873, 173, 573);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 874, 174, 574);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 875, 175, 575);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 876, 176, 576);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 877, 177, 577);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 878, 178, 578);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 879, 179, 579);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 880, 180, 580);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 881, 181, 581);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 882, 182, 582);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 883, 183, 583);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 884, 184, 584);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 885, 185, 585);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 886, 186, 586);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 887, 187, 587);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 888, 188, 588);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (5, 889, 189, 589);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 890, 190, 590);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 891, 191, 591);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (8, 892, 192, 592);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (14, 893, 193, 593);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (9, 894, 194, 594);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (13, 895, 195, 595);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (10, 896, 196, 596);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (11, 897, 197, 597);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (6, 898, 198, 598);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (12, 899, 199, 599);
INSERT INTO HistorialCompras (Compras_realizadas, Id_historial, Id_cliente, Id_pedido) VALUES (7, 900, 200, 600);

--Realiza_pedido
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (101, 501);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (102, 502);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (103, 503);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (104, 504);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (105, 505);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (106, 506);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (107, 507);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (108, 508);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (109, 509);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (110, 510);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (111, 511);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (112, 512);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (113, 513);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (114, 514);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (115, 515);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (116, 516);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (117, 517);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (118, 518);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (119, 519);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (120, 520);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (121, 521);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (122, 522);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (123, 523);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (124, 524);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (125, 525);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (126, 526);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (127, 527);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (128, 528);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (129, 529);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (130, 530);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (131, 531);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (132, 532);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (133, 533);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (134, 534);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (135, 535);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (136, 536);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (137, 537);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (138, 538);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (139, 539);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (140, 540);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (141, 541);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (142, 542);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (143, 543);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (144, 544);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (145, 545);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (146, 546);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (147, 547);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (148, 548);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (149, 549);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (150, 550);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (151, 551);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (152, 552);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (153, 553);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (154, 554);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (155, 555);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (156, 556);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (157, 557);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (158, 558);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (159, 559);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (160, 560);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (161, 561);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (162, 562);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (163, 563);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (164, 564);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (165, 565);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (166, 566);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (167, 567);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (168, 568);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (169, 569);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (170, 570);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (171, 571);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (172, 572);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (173, 573);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (174, 574);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (175, 575);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (176, 576);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (177, 577);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (178, 578);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (179, 579);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (180, 580);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (181, 581);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (182, 582);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (183, 583);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (184, 584);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (185, 585);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (186, 586);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (187, 587);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (188, 588);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (189, 589);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (190, 590);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (191, 591);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (192, 592);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (193, 593);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (194, 594);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (195, 595);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (196, 596);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (197, 597);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (198, 598);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (199, 599);
INSERT INTO Realiza_pedido (Id_cliente, Id_pedido) VALUES (200, 600);


--Pedido_Contiene
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (501, 301);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (502, 302);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (503, 303);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (504, 304);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (505, 305);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (506, 306);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (507, 307);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (508, 308);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (509, 309);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (510, 310);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (511, 311);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (512, 312);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (513, 313);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (514, 314);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (515, 315);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (516, 316);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (517, 317);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (518, 318);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (519, 319);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (520, 320);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (521, 321);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (522, 322);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (523, 323);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (524, 324);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (525, 325);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (526, 326);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (527, 327);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (528, 328);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (529, 329);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (530, 330);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (531, 331);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (532, 332);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (533, 333);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (534, 334);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (535, 335);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (536, 336);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (537, 337);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (538, 338);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (539, 339);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (540, 340);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (541, 341);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (542, 342);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (543, 343);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (544, 344);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (545, 345);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (546, 346);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (547, 347);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (548, 348);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (549, 349);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (550, 350);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (551, 351);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (552, 352);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (553, 353);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (554, 354);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (555, 355);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (556, 356);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (557, 357);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (558, 358);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (559, 359);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (560, 360);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (561, 361);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (562, 362);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (563, 363);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (564, 364);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (565, 365);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (566, 366);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (567, 367);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (568, 368);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (569, 369);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (570, 370);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (571, 371);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (572, 372);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (573, 373);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (574, 374);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (575, 375);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (576, 376);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (577, 377);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (578, 378);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (579, 379);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (580, 380);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (581, 381);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (582, 382);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (583, 383);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (584, 384);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (585, 385);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (586, 386);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (587, 387);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (588, 388);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (589, 389);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (590, 390);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (591, 391);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (592, 392);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (593, 393);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (594, 394);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (595, 395);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (596, 396);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (597, 397);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (598, 398);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (599, 399);
INSERT INTO Pedido_Contiene (Id_pedido, Id_juego) VALUES (600, 400);

--Hay_stock
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (401, 301);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (402, 302);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (403, 303);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (404, 304);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (405, 305);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (406, 306);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (407, 307);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (408, 308);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (409, 309);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (410, 310);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (411, 311);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (412, 312);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (413, 313);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (414, 314);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (415, 315);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (416, 316);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (417, 317);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (418, 318);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (419, 319);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (420, 320);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (421, 321);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (422, 322);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (423, 323);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (424, 324);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (425, 325);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (426, 326);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (427, 327);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (428, 328);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (429, 329);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (430, 330);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (431, 331);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (432, 332);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (433, 333);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (434, 334);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (435, 335);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (436, 336);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (437, 337);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (438, 338);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (439, 339);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (440, 340);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (441, 341);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (442, 342);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (443, 343);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (444, 344);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (445, 345);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (446, 346);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (447, 347);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (448, 348);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (449, 349);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (450, 350);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (451, 351);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (452, 352);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (453, 353);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (454, 354);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (455, 355);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (456, 356);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (457, 357);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (458, 358);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (459, 359);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (460, 360);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (461, 361);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (462, 362);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (463, 363);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (464, 364);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (465, 365);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (466, 366);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (467, 367);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (468, 368);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (469, 369);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (470, 370);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (471, 371);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (472, 372);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (473, 373);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (474, 374);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (475, 375);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (476, 376);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (477, 377);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (478, 378);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (479, 379);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (480, 380);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (481, 381);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (482, 382);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (483, 383);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (484, 384);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (485, 385);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (486, 386);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (487, 387);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (488, 388);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (489, 389);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (490, 390);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (491, 391);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (492, 392);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (493, 393);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (494, 394);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (495, 395);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (496, 396);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (497, 397);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (498, 398);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (499, 399);
INSERT INTO Hay_stock (Id_inventario, Id_juego) VALUES (500, 400);

--Cliente_Vende_juego
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 101, 701);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 102, 702);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 103, 703);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (8, 104, 704);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 105, 705);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 106, 706);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 107, 707);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 108, 708);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 109, 709);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (10, 110, 710);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 111, 711);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 112, 712);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 113, 713);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 114, 714);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 115, 715);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 116, 716);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 117, 717);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (8, 118, 718);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 119, 719);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (10, 120, 720);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 121, 721);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 122, 722);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 123, 723);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (8, 124, 724);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 125, 725);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 126, 726);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (10, 127, 727);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 128, 728);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 129, 729);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 130, 730);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 131, 731);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 132, 732);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 133, 733);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 134, 734);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 135, 735);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 136, 736);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 137, 737);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 138, 738);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 139, 739);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 140, 740);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 141, 741);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 142, 742);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 143, 743);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 144, 744);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 145, 745);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 146, 746);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 147, 747);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 148, 748);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 149, 749);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 150, 750);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 151, 751);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 152, 752);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 153, 753);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 154, 754);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 155, 755);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (8, 156, 756);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 157, 757);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (8, 158, 758);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 159, 759);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 160, 760);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 161, 761);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 162, 762);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 163, 763);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 164, 764);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 165, 765);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 166, 766);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 167, 767);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 168, 768);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 169, 769);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 170, 770);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 171, 771);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 172, 772);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 173, 773);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 174, 774);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 175, 775);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 176, 776);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 177, 777);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 178, 778);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 179, 779);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (10, 180, 780);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (10, 181, 781);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 182, 782);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 183, 783);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 184, 784);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 185, 785);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 186, 786);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 187, 787);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (5, 188, 788);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 189, 789);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 190, 790);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (1, 191, 791);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 192, 792);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 193, 793);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (4, 194, 794);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (9, 195, 795);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (6, 196, 796);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (7, 197, 797);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (3, 198, 798);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (2, 199, 799);
INSERT INTO Cliente_Vende_juego (Cantidad_Juegos_vendidos, Id_cliente, Id_venta_cliente) VALUES (10, 200, 800);

--VentaContiene_juego
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (701, 301);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (702, 302);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (703, 303);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (704, 304);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (705, 305);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (706, 306);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (707, 307);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (708, 308);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (709, 309);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (710, 310);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (711, 311);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (712, 312);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (713, 313);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (714, 314);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (715, 315);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (716, 316);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (717, 317);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (718, 318);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (719, 319);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (720, 320);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (721, 321);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (722, 322);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (723, 323);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (724, 324);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (725, 325);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (726, 326);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (727, 327);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (728, 328);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (729, 329);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (730, 330);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (731, 331);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (732, 332);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (733, 333);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (734, 334);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (735, 335);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (736, 336);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (737, 337);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (738, 338);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (739, 339);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (740, 340);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (741, 341);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (742, 342);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (743, 343);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (744, 344);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (745, 345);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (746, 346);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (747, 347);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (748, 348);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (749, 349);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (750, 350);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (751, 351);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (752, 352);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (753, 353);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (754, 354);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (755, 355);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (756, 356);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (757, 357);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (758, 358);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (759, 359);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (760, 360);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (761, 361);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (762, 362);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (763, 363);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (764, 364);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (765, 365);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (766, 366);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (767, 367);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (768, 368);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (769, 369);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (770, 370);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (771, 371);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (772, 372);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (773, 373);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (774, 374);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (775, 375);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (776, 376);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (777, 377);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (778, 378);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (779, 379);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (780, 380);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (781, 381);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (782, 382);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (783, 383);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (784, 384);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (785, 385);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (786, 386);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (787, 387);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (788, 388);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (789, 389);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (790, 390);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (791, 391);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (792, 392);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (793, 393);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (794, 394);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (795, 395);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (796, 396);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (797, 397);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (798, 398);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (799, 399);
INSERT INTO VentaContiene_juego (Id_venta_cliente, Id_juego) VALUES (800, 400);

--Detalles_Pedido
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (901, 1, 20.00, 501, 301);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (902, 2, 25.00, 502, 302);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (903, 3, 30.00, 503, 303);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (904, 4, 35.00, 504, 304);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (905, 5, 40.00, 505, 305);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (906, 6, 45.00, 506, 306);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (907, 7, 50.00, 507, 307);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (908, 8, 55.00, 508, 308);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (909, 9, 60.00, 509, 309);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (910, 10, 65.00, 510, 310);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (911, 11, 70.00, 511, 311);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (912, 12, 75.00, 512, 312);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (913, 13, 80.00, 513, 313);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (914, 14, 85.00, 514, 314);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (915, 15, 90.00, 515, 315);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (916, 16, 95.00, 516, 316);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (917, 17, 100.00, 517, 317);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (918, 18, 105.00, 518, 318);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (919, 19, 110.00, 519, 319);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (920, 20, 115.00, 520, 320);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (921, 21, 120.00, 521, 321);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (922, 22, 125.00, 522, 322);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (923, 23, 130.00, 523, 323);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (924, 24, 135.00, 524, 324);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (925, 25, 140.00, 525, 325);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (926, 26, 145.00, 526, 326);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (927, 27, 150.00, 527, 327);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (928, 28, 155.00, 528, 328);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (929, 29, 160.00, 529, 329);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (930, 30, 165.00, 530, 330);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (931, 31, 170.00, 531, 331);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (932, 32, 175.00, 532, 332);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (933, 33, 180.00, 533, 333);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (934, 34, 185.00, 534, 334);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (935, 35, 190.00, 535, 335);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (936, 36, 195.00, 536, 336);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (937, 37, 200.00, 537, 337);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (938, 38, 205.00, 538, 338);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (939, 39, 210.00, 539, 339);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (940, 40, 215.00, 540, 340);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (941, 41, 220.00, 541, 341);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (942, 42, 225.00, 542, 342);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (943, 43, 230.00, 543, 343);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (944, 44, 235.00, 544, 344);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (945, 45, 240.00, 545, 345);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (946, 46, 245.00, 546, 346);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (947, 47, 250.00, 547, 347);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (948, 48, 255.00, 548, 348);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (949, 49, 260.00, 549, 349);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (950, 50, 265.00, 550, 350);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (951, 51, 270.00, 551, 351);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (952, 52, 275.00, 552, 352);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (953, 53, 280.00, 553, 353);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (954, 54, 285.00, 554, 354);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (955, 55, 290.00, 555, 355);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (956, 56, 295.00, 556, 356);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (957, 57, 300.00, 557, 357);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (958, 58, 305.00, 558, 358);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (959, 59, 310.00, 559, 359);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (960, 60, 315.00, 560, 360);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (961, 61, 320.00, 561, 361);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (962, 62, 325.00, 562, 362);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (963, 63, 330.00, 563, 363);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (964, 64, 335.00, 564, 364);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (965, 65, 340.00, 565, 365);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (966, 66, 345.00, 566, 366);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (967, 67, 350.00, 567, 367);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (968, 68, 355.00, 568, 368);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (969, 69, 360.00, 569, 369);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (970, 70, 365.00, 570, 370);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (971, 71, 370.00, 571, 371);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (972, 72, 375.00, 572, 372);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (973, 73, 380.00, 573, 373);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (974, 74, 385.00, 574, 374);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (975, 75, 390.00, 575, 375);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (976, 76, 395.00, 576, 376);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (977, 77, 400.00, 577, 377);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (978, 78, 405.00, 578, 378);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (979, 79, 410.00, 579, 379);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (980, 80, 415.00, 580, 380);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (981, 81, 420.00, 581, 381);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (982, 82, 425.00, 582, 382);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (983, 83, 430.00, 583, 383);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (984, 84, 435.00, 584, 384);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (985, 85, 440.00, 585, 385);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (986, 86, 445.00, 586, 386);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (987, 87, 450.00, 587, 387);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (988, 88, 455.00, 588, 388);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (989, 89, 460.00, 589, 389);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (990, 90, 465.00, 590, 390);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (991, 91, 470.00, 591, 391);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (992, 92, 475.00, 592, 392);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (993, 93, 480.00, 593, 393);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (994, 94, 485.00, 594, 394);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (995, 95, 490.00, 595, 395);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (996, 96, 495.00, 596, 396);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (997, 97, 500.00, 597, 397);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (998, 98, 505.00, 598, 398);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (999, 99, 510.00, 599, 399);
INSERT INTO Detalles_Pedido (Id_detalles, Cantidad, Precio_unitario, Id_pedido, Id_juego) VALUES (1000, 100, 515.00, 600, 400);

--Compra_Juegos
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (101, 601);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (102, 602);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (103, 603);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (104, 604);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (105, 605);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (106, 606);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (107, 607);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (108, 608);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (109, 609);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (110, 610);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (111, 611);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (112, 612);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (113, 613);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (114, 614);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (115, 615);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (116, 616);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (117, 617);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (118, 618);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (119, 619);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (120, 620);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (121, 621);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (122, 622);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (123, 623);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (124, 624);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (125, 625);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (126, 626);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (127, 627);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (128, 628);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (129, 629);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (130, 630);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (131, 631);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (132, 632);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (133, 633);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (134, 634);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (135, 635);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (136, 636);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (137, 637);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (138, 638);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (139, 639);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (140, 640);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (141, 641);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (142, 642);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (143, 643);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (144, 644);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (145, 645);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (146, 646);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (147, 647);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (148, 648);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (149, 649);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (150, 650);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (151, 651);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (152, 652);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (153, 653);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (154, 654);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (155, 655);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (156, 656);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (157, 657);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (158, 658);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (159, 659);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (160, 660);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (161, 661);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (162, 662);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (163, 663);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (164, 664);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (165, 665);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (166, 666);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (167, 667);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (168, 668);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (169, 669);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (170, 670);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (171, 671);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (172, 672);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (173, 673);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (174, 674);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (175, 675);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (176, 676);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (177, 677);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (178, 678);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (179, 679);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (180, 680);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (181, 681);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (182, 682);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (183, 683);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (184, 684);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (185, 685);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (186, 686);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (187, 687);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (188, 688);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (189, 689);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (190, 690);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (191, 691);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (192, 692);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (193, 693);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (194, 694);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (195, 695);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (196, 696);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (197, 697);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (198, 698);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (199, 699);
INSERT INTO Compra_Juegos (Id_cliente, Id_venta) VALUES (200, 700);

--Realiza_venta
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (203, 601);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (203, 602);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (203, 603);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (230, 604);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 605);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (206, 606);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (230, 607);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (237, 608);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (238, 609);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (238, 610);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (223, 611);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (238, 612);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (206, 613);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (236, 614);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (237, 615);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (237, 616);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 617);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (238, 618);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (238, 619);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (230, 620);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (233, 621);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (233, 622);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (234, 623);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 624);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (231, 625);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (234, 626);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (233, 627);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (206, 628);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (231, 629);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 630);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (216, 631);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 632);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (216, 633);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (206, 634);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (229, 635);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 636);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (228, 637);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (228, 638);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (218, 639);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (227, 640);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (218, 641);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (226, 642);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 643);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (226, 644);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (228, 645);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 646);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (222, 647);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (209, 648);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (218, 649);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (222, 650);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 651);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (221, 652);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (209, 653);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 654);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (220, 655);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (220, 656);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (227, 657);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 658);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 659);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 660);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (220, 661);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 662);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 663);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (215, 664);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (215, 665);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (221, 666);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (216, 667);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (217, 668);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (226, 669);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 670);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (211, 671);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (225, 672);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (211, 673);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (203, 674);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (216, 675);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 676);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (214, 677);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (203, 678);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (214, 679);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 680);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (209, 681);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (203, 682);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (208, 683);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (210, 684);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 685);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 686);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (208, 687);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 688);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 689);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 690);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (210, 691);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (204, 692);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (208, 693);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 694);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 695);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (209, 696);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (205, 697);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (209, 698);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (207, 699);
INSERT INTO Realiza_venta (Id_empleado, Id_venta) VALUES (209, 700);
