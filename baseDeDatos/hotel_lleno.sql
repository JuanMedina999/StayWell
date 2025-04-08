-- Crear base de datos
CREATE DATABASE  hotel_lleno;
USE Hotel_lleno;

-- Tabla de huéspedes
CREATE TABLE Huesped (
    id_huesped INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    documento_identidad VARCHAR(50) UNIQUE
);

-- Tabla de trabajadores
CREATE TABLE Trabajador (
    id_trabajador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    rol ENUM('Recepcionista', 'Organizador', 'Ama de llaves') NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla de habitaciones
CREATE TABLE Habitacion (
    id_habitacion INT PRIMARY KEY AUTO_INCREMENT,
    numero_habitacion VARCHAR(10) NOT NULL UNIQUE,
    tipo ENUM('Simple', 'Doble', 'Suite') NOT NULL,
    precio_por_noche DECIMAL(10,2) NOT NULL,
    estado ENUM('Disponible', 'Ocupada', 'Mantenimiento') DEFAULT 'Disponible'
);

-- Tabla de reserva de habitaciones
CREATE TABLE Reserva_Habitacion (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_huesped INT,
    id_habitacion INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Confirmada', 'Cancelada', 'Finalizada') DEFAULT 'Confirmada',
    FOREIGN KEY (id_huesped) REFERENCES Huesped(id_huesped),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

-- Tabla de espacios (salones, áreas comunes, etc.)
CREATE TABLE Espacio (
    id_espacio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    capacidad INT
);

-- Tabla de reserva de espacios
CREATE TABLE Reserva_Espacio (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_huesped INT,
    id_espacio INT,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado ENUM('Confirmada', 'Cancelada') DEFAULT 'Confirmada',
    FOREIGN KEY (id_huesped) REFERENCES Huesped(id_huesped),
    FOREIGN KEY (id_espacio) REFERENCES Espacio(id_espacio)
);

-- Tabla de eventos organizados en el hotel
CREATE TABLE Evento (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    id_organizador INT,
    FOREIGN KEY (id_organizador) REFERENCES Trabajador(id_trabajador)
);

-- Tabla de reserva de eventos por parte de huéspedes
CREATE TABLE Reserva_Evento (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT,
    id_huesped INT,
    cantidad_personas INT NOT NULL,
    estado ENUM('Confirmada', 'Cancelada') DEFAULT 'Confirmada',
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_huesped) REFERENCES Huesped(id_huesped)
);
-- Insertar huéspedes
INSERT INTO Huesped (nombre, apellido, email, telefono, documento_identidad) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '3001234567', 'CC123456'),
('Ana', 'Gómez', 'ana.gomez@email.com', '3002345678', 'CC123457'),
('Luis', 'Ramírez', 'luis.ramirez@email.com', '3003456789', 'CC123458'),
('Marta', 'López', 'marta.lopez@email.com', '3004567890', 'CC123459'),
('Pedro', 'Torres', 'pedro.torres@email.com', '3005678901', 'CC123460'),
('Lucía', 'Martínez', 'lucia.martinez@email.com', '3006789012', 'CC123461'),
('Carlos', 'Suárez', 'carlos.suarez@email.com', '3007890123', 'CC123462'),
('Sofía', 'Rojas', 'sofia.rojas@email.com', '3008901234', 'CC123463'),
('Andrés', 'Herrera', 'andres.herrera@email.com', '3009012345', 'CC123464'),
('Clara', 'Moreno', 'clara.moreno@email.com', '3000123456', 'CC123465'),
('David', 'Cano', 'david.cano@email.com', '3101234567', 'CC123466'),
('Paula', 'Ortiz', 'paula.ortiz@email.com', '3102345678', 'CC123467'),
('Mateo', 'Jiménez', 'mateo.jimenez@email.com', '3103456789', 'CC123468'),
('Laura', 'Navarro', 'laura.navarro@email.com', '3104567890', 'CC123469'),
('Jorge', 'Vega', 'jorge.vega@email.com', '3105678901', 'CC123470'),
('Valentina', 'Soto', 'valentina.soto@email.com', '3106789012', 'CC123471'),
('Fernando', 'Luna', 'fernando.luna@email.com', '3107890123', 'CC123472'),
('Camila', 'Castro', 'camila.castro@email.com', '3108901234', 'CC123473'),
('Santiago', 'Medina', 'santiago.medina@email.com', '3109012345', 'CC123474'),
('Isabela', 'Reyes', 'isabela.reyes@email.com', '3100123456', 'CC123475');

-- Insertar trabajadores
INSERT INTO Trabajador (nombre, apellido, rol, telefono, email) VALUES
('María', 'Fernández', 'Recepcionista', '3001111111', 'maria.fernandez@email.com'),
('José', 'García', 'Ama de llaves', '3002222222', 'jose.garcia@email.com'),
('Elena', 'Martín', 'Organizador', '3003333333', 'elena.martin@email.com'),
('Ricardo', 'Alonso', 'Recepcionista', '3004444444', 'ricardo.alonso@email.com'),
('Teresa', 'Ruiz', 'Ama de llaves', '3005555555', 'teresa.ruiz@email.com'),
('Iván', 'Morales', 'Organizador', '3006666666', 'ivan.morales@email.com'),
('Julia', 'Delgado', 'Recepcionista', '3007777777', 'julia.delgado@email.com'),
('Miguel', 'Campos', 'Ama de llaves', '3008888888', 'miguel.campos@email.com'),
('Silvia', 'Núñez', 'Organizador', '3009999999', 'silvia.nunez@email.com'),
('Alberto', 'Serrano', 'Recepcionista', '3010000000', 'alberto.serrano@email.com');

-- Insertar habitaciones
INSERT INTO Habitacion (numero_habitacion, tipo, precio_por_noche, estado) VALUES
('101', 'Simple', 50.00, 'Disponible'),
('102', 'Doble', 80.00, 'Ocupada'),
('103', 'Suite', 120.00, 'Mantenimiento'),
('104', 'Simple', 55.00, 'Disponible'),
('105', 'Doble', 85.00, 'Ocupada'),
('106', 'Suite', 130.00, 'Disponible'),
('107', 'Simple', 60.00, 'Disponible'),
('108', 'Doble', 90.00, 'Ocupada'),
('109', 'Suite', 140.00, 'Disponible'),
('110', 'Simple', 65.00, 'Disponible'),
('201', 'Doble', 95.00, 'Mantenimiento'),
('202', 'Suite', 150.00, 'Disponible'),
('203', 'Simple', 70.00, 'Ocupada'),
('204', 'Doble', 100.00, 'Disponible'),
('205', 'Suite', 160.00, 'Disponible');

-- Insertar reservas de habitaciones
INSERT INTO Reserva_Habitacion (id_huesped, id_habitacion, fecha_inicio, fecha_fin, estado) VALUES
(1, 2, '2025-04-01', '2025-04-05', 'Confirmada'),
(2, 5, '2025-04-02', '2025-04-06', 'Finalizada'),
(3, 8, '2025-04-03', '2025-04-07', 'Confirmada'),
(4, 10, '2025-04-01', '2025-04-04', 'Cancelada'),
(5, 13, '2025-04-05', '2025-04-08', 'Confirmada'),
(6, 1, '2025-04-06', '2025-04-10', 'Confirmada'),
(7, 4, '2025-04-04', '2025-04-09', 'Finalizada'),
(8, 6, '2025-04-03', '2025-04-05', 'Confirmada'),
(9, 9, '2025-04-02', '2025-04-04', 'Confirmada'),
(10, 11, '2025-04-01', '2025-04-03', 'Cancelada'),
(11, 12, '2025-04-01', '2025-04-06', 'Finalizada'),
(12, 14, '2025-04-02', '2025-04-07', 'Confirmada'),
(13, 3, '2025-04-03', '2025-04-05', 'Cancelada'),
(14, 7, '2025-04-05', '2025-04-09', 'Confirmada'),
(15, 15, '2025-04-06', '2025-04-10', 'Confirmada'),
(16, 2, '2025-04-07', '2025-04-11', 'Finalizada'),
(17, 5, '2025-04-08', '2025-04-12', 'Confirmada'),
(18, 8, '2025-04-09', '2025-04-13', 'Confirmada'),
(19, 10, '2025-04-10', '2025-04-14', 'Confirmada'),
(20, 13, '2025-04-11', '2025-04-15', 'Confirmada');

-- Insertar espacios
INSERT INTO Espacio (nombre, descripcion, capacidad) VALUES
('Salón Principal', 'Salón para eventos grandes', 100),
('Sala de Reuniones', 'Sala equipada con proyector', 30),
('Zona BBQ', 'Espacio al aire libre con parrilla', 20),
('Piscina', 'Piscina al aire libre', 50),
('Gimnasio', 'Equipado con pesas y máquinas', 25),
('Terraza', 'Terraza panorámica', 40),
('Lobby', 'Área de espera y recepción', 60),
('Sala VIP', 'Espacio exclusivo para ejecutivos', 10),
('Jardín', 'Área verde para relajación', 30),
('Bar', 'Espacio con barra y mesas', 35);

-- Insertar reservas de espacios
INSERT INTO Reserva_Espacio (id_huesped, id_espacio, fecha, hora_inicio, hora_fin, estado) VALUES
(1, 1, '2025-04-10', '10:00:00', '14:00:00', 'Confirmada'),
(2, 3, '2025-04-11', '12:00:00', '16:00:00', 'Confirmada'),
(3, 5, '2025-04-12', '09:00:00', '11:00:00', 'Cancelada'),
(4, 6, '2025-04-13', '15:00:00', '17:00:00', 'Confirmada'),
(5, 7, '2025-04-14', '10:00:00', '12:00:00', 'Confirmada'),
(6, 8, '2025-04-15', '13:00:00', '15:00:00', 'Cancelada'),
(7, 9, '2025-04-16', '16:00:00', '18:00:00', 'Confirmada'),
(8, 10, '2025-04-17', '14:00:00', '16:00:00', 'Confirmada'),
(9, 2, '2025-04-18', '11:00:00', '13:00:00', 'Confirmada'),
(10, 4, '2025-04-19', '17:00:00', '19:00:00', 'Confirmada');

-- Insertar eventos
INSERT INTO Evento (nombre, descripcion, fecha, hora_inicio, hora_fin, id_organizador) VALUES
('Conferencia de Tecnología', 'Evento sobre innovación digital', '2025-04-20', '09:00:00', '13:00:00', 3),
('Boda Civil', 'Celebración en salón principal', '2025-04-21', '17:00:00', '22:00:00', 6),
('Taller de Cocina', 'Clases con chef invitado', '2025-04-22', '15:00:00', '18:00:00', 9),
('Yoga al Amanecer', 'Clase al aire libre en el jardín', '2025-04-23', '06:00:00', '08:00:00', 3),
('Concierto Acústico', 'Presentación en la terraza', '2025-04-24', '20:00:00', '22:00:00', 6),
('Reunión Corporativa', 'Evento empresarial', '2025-04-25', '08:00:00', '12:00:00', 9),
('Feria de Emprendedores', 'Muestra de negocios locales', '2025-04-26', '10:00:00', '16:00:00', 3),
('Noche de Karaoke', 'Actividad en el bar', '2025-04-27', '19:00:00', '23:00:00', 6),
('Charla Motivacional', 'Invitado especial', '2025-04-28', '14:00:00', '16:00:00', 9),
('Torneo de Ajedrez', 'Competencia abierta', '2025-04-29', '09:00:00', '13:00:00', 3),
('Cata de Vinos', 'Degustación guiada', '2025-04-30', '18:00:00', '20:00:00', 6),
('Exposición de Arte', 'Obras de artistas locales', '2025-05-01', '11:00:00', '15:00:00', 9),
('Noche de Jazz', 'Concierto en vivo', '2025-05-02', '21:00:00', '23:00:00', 3),
('Clase de Zumba', 'Sesión grupal en la terraza', '2025-05-03', '07:00:00', '08:00:00', 6),
('Foro Ambiental', 'Debate y discusión', '2025-05-04', '10:00:00', '12:00:00', 9);

-- Insertar reservas de eventos
INSERT INTO Reserva_Evento (id_evento, id_huesped, cantidad_personas, estado) VALUES
(1, 1, 2, 'Confirmada'),
(2, 2, 4, 'Confirmada'),
(3, 3, 1, 'Cancelada'),
(4, 4, 2, 'Confirmada'),
(5, 5, 3, 'Confirmada'),
(6, 6, 2, 'Cancelada'),
(7, 7, 5, 'Confirmada'),
(8, 8, 2, 'Confirmada'),
(9, 9, 1, 'Confirmada'),
(10, 10, 3, 'Confirmada');

SELECT 
    rh.id_reserva,
    h.nombre AS nombre_huesped,
    h.apellido AS apellido_huesped,
    hab.numero_habitacion,
    hab.tipo,
    hab.precio_por_noche,
    rh.fecha_inicio,
    rh.fecha_fin,
    rh.estado
FROM 
    Reserva_Habitacion rh
JOIN 
    Huesped h ON rh.id_huesped = h.id_huesped
JOIN 
    Habitacion hab ON rh.id_habitacion = hab.id_habitacion;

