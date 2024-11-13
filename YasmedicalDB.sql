DROP DATABASE IF EXISTS YassMedical;
CREATE DATABASE YassMedical;
USE YassMedical;

CREATE TABLE Proveedor (
  rut varchar(12) unique,
  razon_social varchar(60) NOT NULL,
  direccion varchar(100) NOT NULL,
  telefono varchar(14) NOT NULL,
  email varchar(60) NOT NULL,
  PRIMARY KEY (rut)
);

CREATE TABLE suministra (
   id_suministra INT AUTO_INCREMENT,
   rut_proveedor varchar(12) NOT NULL,
   fecha_suministro date NOT NULL,
   codigo varchar(15) NOT NULL,
   PRIMARY KEY (id_suministra)
);

CREATE TABLE Productos (
  codigo varchar(15) unique,
  descripcion varchar(100) NOT NULL,
  stock INT NOT NULL,
  valor decimal(10,2) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE Vendedores (
  rut varchar(12) unique,
  nombre varchar(20) NOT NULL,
  apellido varchar(20) NOT NULL,  
  PRIMARY KEY (rut)
);
DROP TABLE IF EXISTS Facturas;
CREATE TABLE Facturas (
  numero_factura int NOT NULL auto_increment,
  rut_cliente varchar(12) NOT NULL,
  cod_producto varchar(15) NOT NULL ,
  valor_producto decimal(10, 2) NOT NULL,
  rut varchar(12) NOT NULL,
  cantidad INT NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (numero_factura)
);

CREATE TABLE Clientes (
  rut varchar(12) unique,
  nombre varchar(20) NOT NULL,
  apellido varchar(20) NOT NULL,
  telefono varchar(14) NOT NULL,
  email varchar(60) NOT NULL,
  PRIMARY KEY (rut)
);

ALTER TABLE suministra ADD CONSTRAINT rut_prov FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut);
ALTER TABLE suministra ADD CONSTRAINT cod_prod FOREIGN KEY (codigo) REFERENCES Productos(codigo);
ALTER TABLE Facturas ADD CONSTRAINT rut_vendedor FOREIGN KEY (rut) REFERENCES Vendedores(rut);
ALTER TABLE Facturas ADD CONSTRAINT client_rut FOREIGN KEY (rut_cliente) REFERENCES Clientes(rut);
ALTER TABLE Facturas ADD CONSTRAINT product_ID FOREIGN KEY (cod_producto) REFERENCES Productos(codigo);

-- ###################################################### INSERSIONES ###################################################

INSERT INTO Proveedor (rut, razon_social, direccion, telefono, email) VALUES
('12345611-9', 'MedInsumos S.A.', 'Av. Salud 123, Santiago', '987654321', 'contacto@medinsumos.cl'),
('23456722-0', 'Farmacia Saludable', 'Calle Bienestar 456, Valparaíso', '912345678', 'info@farmaciasaludable.cl'),
('34567833-1', 'Insumos Médicos Ltda.', 'Ruta Médica 789, Concepción', '934567890', 'ventas@insumosmedicos.cl'),
('45678944-2', 'Salud y Vida', 'Paseo Salud 321, La Serena', '945678901', 'contacto@saludyvida.cl'),
('56789055-3', 'Medicina Pro', 'Calle Sanitaria 654, Temuco', '956789012', 'info@medicinapro.cl'),
('67890166-4', 'Proveedores Médicos', 'Av. Clínica 987, Antofagasta', '967890123', 'ventas@proveedoresmedicos.cl'),
('78901277-5', 'Salud Integral', 'Calle Bienestar 135, Iquique', '978901234', 'contacto@saludintegral.cl'),
('89012388-6', 'Insumos Vitales', 'Av. Vital 246, Rancagua', '989012345', 'info@insumosvitales.cl'),
('90123499-7', 'Medicamentos y Más', 'Calle Medicinal 357, Puerto Montt', '990123456', 'ventas@medicamentosymas.cl'),
('01234500-8', 'Salud y Bienestar', 'Paseo Médico 468, Osorno', '991234567', 'contacto@saludybienestar.cl');

-- INSERT INTO Productos (codigo, descripcion, stock, valor) VALUES ('541LK', 'jeringa 1ml 100u.', 20, 2590.00);
INSERT INTO Productos (codigo, descripcion, stock, valor) VALUES
('INSUMO001', 'Analgesico', 100, 15.50),
('INSUMO002', 'Antibiótico', 50, 25.00),
('INSUMO003', 'Desinfectante', 200, 10.75),
('INSUMO004', 'Termómetro Digital', 75, 30.00),
('INSUMO005', 'Guantes de Látex', 500, 5.00),
('INSUMO006', 'Mascarillas Quirúrgicas', 300, 1.50),
('INSUMO007', 'Jeringas Desechables', 150, 0.75),
('INSUMO008', 'Tiras Reactivas', 80, 20.00),
('INSUMO009', 'Sueros Hidratantes', 60, 12.00),
('INSUMO010', 'Vendas Adhesivas', 250, 2.50);

INSERT INTO Vendedores (rut, nombre, apellido) VALUES
('12345678-1', 'Pedro', 'González'),
('23456789-2', 'Ana', 'Martínez'),
('34567890-3', 'Luis', 'Pérez'),
('45678901-4', 'Sofía', 'López'),
('56789012-5', 'Javier', 'Ramírez'),
('67890123-6', 'Claudia', 'Torres');

INSERT INTO Clientes (rut, nombre, apellido, telefono, email) VALUES
('12345678-9', 'Juan', 'Pérez', '987654321', 'juan.perez@example.com'),
('23456789-0', 'María', 'González', '912345678', 'maria.gonzalez@example.com'),
('34567890-1', 'Carlos', 'López', '934567890', 'carlos.lopez@example.com'),
('45678901-2', 'Ana', 'Martínez', '945678901', 'ana.martinez@example.com'),
('56789012-3', 'Luis', 'Fernández', '956789012', 'luis.fernandez@example.com'),
('67890123-4', 'Sofía', 'Ramírez', '967890123', 'sofia.ramirez@example.com'),
('78901234-5', 'Diego', 'Torres', '978901234', 'diego.torres@example.com'),
('89012345-6', 'Laura', 'Hernández', '989012345', 'laura.hernandez@example.com'),
('90123456-7', 'Javier', 'Gutiérrez', '990123456', 'javier.gutierrez@example.com'),
('01234567-8', 'Claudia', 'Vásquez', '991234567', 'claudia.vasquez@example.com');

INSERT INTO suministra (rut_proveedor, fecha_suministro, codigo) VALUES
('89012388-6', '2023-08-30', 'INSUMO007'),
('89012388-6', '2022-05-13', 'INSUMO008'),
('12345611-9', '2023-01-15', 'INSUMO001'),
('23456722-0', '2023-02-20', 'INSUMO002'),
('34567833-1', '2023-03-10', 'INSUMO003'),
('45678944-2', '2023-04-05', 'INSUMO004'),
('56789055-3', '2023-05-12', 'INSUMO005'),
('67890166-4', '2023-06-18', 'INSUMO006'),
('78901277-5', '2023-07-25', 'INSUMO007'),
('89012388-6', '2023-08-30', 'INSUMO008'),
('90123499-7', '2023-09-15', 'INSUMO009'),
('01234500-8', '2023-10-22', 'INSUMO010'),
('78901277-5', '2023-10-21', 'INSUMO007'),
('23456722-0', '2024-11-01', 'INSUMO002'),
('23456722-0', '2024-11-01', 'INSUMO002');

INSERT INTO Facturas (rut_cliente, cod_producto, valor_producto, rut, cantidad, fecha) VALUES
('12345678-9', 'INSUMO001', 150.00, '12345678-1', 2, '2024-03-22'),
('23456789-0', 'INSUMO002', 250.50, '12345678-1', 1, '2024-02-17'),
('34567890-1', 'INSUMO003', 300.75, '23456789-2', 3, '2024-02-14'),
('45678901-2', 'INSUMO004', 120.00, '23456789-2', 5, '2023-11-01'),
('56789012-3', 'INSUMO002', 25.00, '34567890-3', 1, '2023-09-26'),
('56789012-3', 'INSUMO005', 5.00, '34567890-3', 1, '2023-07-15'),
('56789012-3', 'INSUMO005', 5.00, '34567890-3', 1, '2023-04-09'),
('67890123-4', 'INSUMO006', 1.50, '34567890-3', 4, '2023-04-03'),
('78901234-5', 'INSUMO007', 350.00, '45678901-4', 2, '2023-03-30'),
('89012345-6', 'INSUMO008', 175.50, '45678901-4', 3, '2022-08-12'),
('90123456-7', 'INSUMO009', 90.00, '56789012-5', 6, '2022-06-14'),
('01234567-8', 'INSUMO010', 600.00, '67890123-6', 1, '2022-06-10');

-- ######################################################## VISTAS #######################################################

-- 1.Vista para ver todos los insumos recibidos en el año 2023
CREATE VIEW insumos_recibidos_2023 AS
SELECT rut_proveedor, fecha_suministro, codigo
FROM suministra
WHERE YEAR(fecha_suministro) = 2023;

SELECT * FROM  insumos_recibidos_2023;


-- 2.Vista de productos por rango de precio
CREATE VIEW vista_productos_rango_precio AS
SELECT codigo, descripcion, valor
FROM Productos
WHERE valor BETWEEN 0 AND 1000000.00;

SELECT * FROM  vista_productos_rango_precio;


-- 3.Vista para ver cantidad de ventas por vendedores en orden descendente;
CREATE VIEW total_ventas_vendedores AS
SELECT 
    Vendedores.rut AS rut_vendedor,
    Vendedores.nombre,
    Vendedores.apellido,
    Facturas.numero_factura,
    Facturas.rut_cliente,
    Facturas.cod_producto,
    Facturas.valor_producto,
    Facturas.cantidad
FROM 
    Facturas
JOIN 
    Vendedores ON Facturas.rut = Vendedores.rut
ORDER BY 
    Vendedores.rut, Facturas.numero_factura;

SELECT * FROM  total_ventas_vendedores;

-- ################################################# FUNCIONES ALMACENADAS ################################################

-- 1- FUNCION PARA CALCULAR EL IVA DE UNA FACTURA

DELIMITER //
CREATE FUNCTION CalcularIVA(
    monto_bruto DECIMAL(10, 2)
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN monto_bruto * 1.19; 
END //
DELIMITER ;


SELECT numero_factura AS factura, fecha, valor_producto AS subtotal, CalcularIVA(valor_producto) AS total
FROM Facturas;


-- 2. FUNCION PARA MOSTRAR EL NOMBRE DE UN CLIENTE INGRESANDO SU NUMERO DE RUT

DELIMITER //
CREATE FUNCTION ObtenerNombreCliente(
    p_rut_cliente VARCHAR(12)
) RETURNS VARCHAR(50)
NO SQL 
BEGIN
    DECLARE v_nombre VARCHAR(20);
    DECLARE v_apellido VARCHAR(20);
    SELECT apellido, nombre INTO v_apellido, v_nombre FROM Clientes WHERE p_rut_cliente = rut;
    RETURN CONCAT(v_nombre, ' ', v_apellido) ;
END //
DELIMITER ;

SELECT ObtenerNombreCliente('12345678-9') AS nombre_cliente


-- ################################################# STORED PROCEDURE ################################################

