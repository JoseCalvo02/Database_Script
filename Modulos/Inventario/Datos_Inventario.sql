-- Inserts para la tabla de Categorias
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES (1, 'Telefonos moviles');
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES (2, 'Computadoras');
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES (3, 'Accesorios electronicos');

-- Inserts para la tabla de Proveedores
INSERT INTO INV_Proveedores (proveedorID, nombre, direccion, telefono) VALUES (1, 'ElectroTech', 'Calle Principal 123', '1235-6789');
INSERT INTO INV_Proveedores (proveedorID, nombre, direccion, telefono) VALUES (2, 'Gadget World', 'Avenida Central 456', '2567-8901');
INSERT INTO INV_Proveedores (proveedorID, nombre, direccion, telefono) VALUES (3, 'Tech Innovators', 'Calle Secundaria 789', '3678-9012');

-- Inserts para la tabla de Marcas
INSERT INTO INV_Marcas (marcaID, nombre) VALUES (1, 'TechStar');
INSERT INTO INV_Marcas (marcaID, nombre) VALUES (2, 'InnovaTech');
INSERT INTO INV_Marcas (marcaID, nombre) VALUES (3, 'EcoGadgets');

-- Inserts para la tabla de Garantias
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES (1, 'Garantia estandar');
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES (2, 'Garantia extendida');
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES (3, 'Sin garantia');

-- Inserts para la tabla de Productos
INSERT INTO INV_Productos (productoID, nombre, descripcion, categoriaID, proveedorID, marcaID, garantiaID) VALUES (1, 'Telefono movil Modelo X', 'Telefono movil de Ultima generacion', 1, 1, 1, 1);
INSERT INTO INV_Productos (productoID, nombre, descripcion, categoriaID, proveedorID, marcaID, garantiaID) VALUES (2, 'Laptop UltraSlim', 'Laptop ultradelgada y potente', 2, 2, 2, 2);
INSERT INTO INV_Productos (productoID, nombre, descripcion, categoriaID, proveedorID, marcaID, garantiaID) VALUES (3, 'Auriculares Bluetooth Premium', 'Auriculares inalambricos con cancelacion de ruido', 3, 3, 3, 3);

-- Inserts para la tabla de Almacenes
INSERT INTO INV_Almacenes (almacenID, nombre, direccion, capacidad) VALUES (1, 'Almacen Principal', 'Calle Alfa 123', 1000);
INSERT INTO INV_Almacenes (almacenID, nombre, direccion, capacidad) VALUES (2, 'Almacen Secundario', 'Avenida Beta 456', 1500);
INSERT INTO INV_Almacenes (almacenID, nombre, direccion, capacidad) VALUES (3, 'Almacen de Reserva', 'Calle Gamma 789', 2000);

-- Inserts para la tabla de Ubicaciones
INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) VALUES (1, 'Pasillo 1', 1);
INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) VALUES (2, 'Estanteria 2A', 1);
INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) VALUES (3, 'Pasillo 3', 2);

-- Inserts para la tabla de Stock
INSERT INTO INV_Stock (productoID, cantidad, empleadoID) VALUES (1, 100, 'EMP01');
INSERT INTO INV_Stock (productoID, cantidad, empleadoID) VALUES (2, 50, 'EMP02');
INSERT INTO INV_Stock (productoID, cantidad, empleadoID) VALUES (3, 75, 'EMP03');

-- Inserts para la tabla de Precios
INSERT INTO INV_Precios (precioID, productoID, precio, fechaInicio, fechaFin) VALUES (1, 1, 599.99, '01-01-2023', '31-12-2023');
INSERT INTO INV_Precios (precioID, productoID, precio, fechaInicio, fechaFin) VALUES (2, 2, 899.99, '01-01-2023', '31-12-2023');
INSERT INTO INV_Precios (precioID, productoID, precio, fechaInicio, fechaFin) VALUES (3, 3, 149.99, '01-01-2023', '31-12-2023');

-- Inserts para la tabla de Historial de Movimientos de Inventario
INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) VALUES (1, 1, 'Entrada', 50, '15-05-2023');
INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) VALUES (2, 2, 'Salida', 20, '16-05-2023');
INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) VALUES (3, 3, 'Entrada', 30, '17-05-2023');

-- Inserts para la tabla de Alertas de Stock
INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) VALUES (1, 1, 20);
INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) VALUES (2, 2, 10);
INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) VALUES (3, 3, 15);