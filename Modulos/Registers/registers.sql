
/*****************MODULO DE INVENTARIO*****************************/


-- Insertar registros en INV_Categorias
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES ('CAT1', 'Electrónica');
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES ('CAT2', 'Ropa');
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES ('CAT3', 'Hogar');


-- Insertar registros en INV_Marcas
INSERT INTO INV_Marcas (marcaID, nombre) VALUES ('MAR1', 'Samsung');
INSERT INTO INV_Marcas (marcaID, nombre) VALUES ('MAR2', 'Nike');
INSERT INTO INV_Marcas (marcaID, nombre) VALUES ('MAR3', 'IKEA');


-- Insertar registros en INV_Garantias
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES ('GAR1', 'Garantía estándar de 1 año');
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES ('GAR2', 'Garantía extendida de 2 años');
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES ('GAR3', 'Garantía limitada de por vida');


-- Insertar registros en INV_Productos
INSERT INTO INV_Productos (productoID, nombre, descripcion, costo, categoriaID, marcaID, garantiaID) 
VALUES ('PROD1', 'Teléfono', 'Teléfono inteligente de última generación', 599.99, 'CAT1', 'MAR1', 'GAR1');

INSERT INTO INV_Productos (productoID, nombre, descripcion, costo, categoriaID, marcaID, garantiaID) 
VALUES ('PROD2', 'Zapatos deportivos', 'Zapatos para correr cómodos y duraderos', 79.99, 'CAT2', 'MAR2', 'GAR2');

INSERT INTO INV_Productos (productoID, nombre, descripcion, costo, categoriaID, marcaID, garantiaID) 
VALUES ('PROD3', 'Mesa de centro', 'Mesa elegante para la sala de estar', 149.50, 'CAT3', 'MAR3', 'GAR3');


-- Insertar registros en INV_ProductosProveedores
INSERT INTO INV_ProductosProveedores (productoID, proveedorID, precio, fechaInicio) 
VALUES ('PROD1', 'PROV1', 549.99, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO INV_ProductosProveedores (productoID, proveedorID, precio, fechaInicio) 
VALUES ('PROD2', 'PROV2', 69.99, TO_DATE('2023-02-20', 'YYYY-MM-DD'));

INSERT INTO INV_ProductosProveedores (productoID, proveedorID, precio, fechaInicio) 
VALUES ('PROD3', 'PROV3', 129.50, TO_DATE('2023-03-10', 'YYYY-MM-DD'));


-- Insertar registros en INV_Devoluciones
INSERT INTO INV_Devoluciones (devolucionID, productoID, cantidad, motivo, fechaDevolucion) 
VALUES ('DEV1', 'PROD1', 2, 'Defecto en la pantalla', TO_DATE('2023-04-05', 'YYYY-MM-DD'));

INSERT INTO INV_Devoluciones (devolucionID, productoID, cantidad, motivo, fechaDevolucion) 
VALUES ('DEV2', 'PROD2', 1, 'Talla incorrecta', TO_DATE('2023-05-10', 'YYYY-MM-DD'));

INSERT INTO INV_Devoluciones (devolucionID, productoID, cantidad, motivo, fechaDevolucion) 
VALUES ('DEV3', 'PROD3', 3, 'Daño durante el transporte', TO_DATE('2023-06-15', 'YYYY-MM-DD'));


-- Insertar registros en INV_Almacenes
INSERT INTO INV_Almacenes (almacenID, nombre, direccion) 
VALUES ('ALM1', 'Almacén Principal', 'Calle Principal, 123');

INSERT INTO INV_Almacenes (almacenID, nombre, direccion) 
VALUES ('ALM2', 'Almacén Secundario', 'Avenida Secundaria, 456');

INSERT INTO INV_Almacenes (almacenID, nombre, direccion) 
VALUES ('ALM3', 'Almacén de Reserva', 'Calle Reserva, 789');


-- Insertar registros en INV_Ubicaciones
INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) 
VALUES ('UBIC1', 'Sección A', 'ALM1');

INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) 
VALUES ('UBIC2', 'Pasillo B', 'ALM2');

INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) 
VALUES ('UBIC3', 'Estante C', 'ALM3');


-- Insertar registros en INV_Stock
INSERT INTO INV_Stock (productoID, almacenID, cantidad) 
VALUES ('PROD1', 'ALM1', 100);

INSERT INTO INV_Stock (productoID, almacenID, cantidad) 
VALUES ('PROD2', 'ALM2', 75);

INSERT INTO INV_Stock (productoID, almacenID, cantidad) 
VALUES ('PROD3', 'ALM3', 50);


