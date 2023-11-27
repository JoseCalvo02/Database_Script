/*************************ESTAN LOS REGISTROS DE TODAS LAS TABLAS MENOS LAS DE BITACORA, DEBIDO A LOS TRIGGERS***************************************/



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


-- Insertar registros en INV_HistorialMovimientos
INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) 
VALUES ('MOV1', 'PROD1', 'Entrada', 50, TO_DATE('2023-07-10', 'YYYY-MM-DD'));

INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) 
VALUES ('MOV2', 'PROD2', 'Salida', 25, TO_DATE('2023-08-15', 'YYYY-MM-DD'));

INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) 
VALUES ('MOV3', 'PROD3', 'Entrada', 40, TO_DATE('2023-09-20', 'YYYY-MM-DD'));


-- Insertar registros en INV_AlertasStock
INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) 
VALUES ('ALERT1', 'PROD1', 20);

INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) 
VALUES ('ALERT2', 'PROD2', 15);

INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) 
VALUES ('ALERT3', 'PROD3', 30);


-- Insertar registros en INV_TransferenciasAlmacenes
INSERT INTO INV_TransferenciasAlmacenes (transferenciaID, productoID, cantidad, almacenOrigenID, almacenDestinoID, fechaTransferencia) 
VALUES ('TRANSF1', 'PROD1', 10, 'ALM1', 'ALM2', TO_DATE('2023-10-05', 'YYYY-MM-DD'));

INSERT INTO INV_TransferenciasAlmacenes (transferenciaID, productoID, cantidad, almacenOrigenID, almacenDestinoID, fechaTransferencia) 
VALUES ('TRANSF2', 'PROD2', 20, 'ALM2', 'ALM3', TO_DATE('2023-11-10', 'YYYY-MM-DD'));

INSERT INTO INV_TransferenciasAlmacenes (transferenciaID, productoID, cantidad, almacenOrigenID, almacenDestinoID, fechaTransferencia) 
VALUES ('TRANSF3', 'PROD3', 15, 'ALM3', 'ALM1', TO_DATE('2023-12-15', 'YYYY-MM-DD'));


--***************** FIN DEL MODULO INVENTARIO *****************---


--***************** INICIO DEL MODULO COMPRAS *****************---

-- Insertar registros en COM_Proveedor
INSERT INTO COM_Proveedor (proveedorID, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) 
VALUES ('PROV1', 'Proveedor A', 'Calle Principal 123', '123-456-7890', 'proveedora@example.com', 'País A', TO_DATE('2023-01-10', 'YYYY-MM-DD'));

INSERT INTO COM_Proveedor (proveedorID, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) 
VALUES ('PROV2', 'Proveedor B', 'Avenida Secundaria 456', '987-654-3210', 'proveedorb@example.com', 'País B', TO_DATE('2023-02-15', 'YYYY-MM-DD'));

INSERT INTO COM_Proveedor (proveedorID, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) 
VALUES ('PROV3', 'Proveedor C', 'Calle Reserva 789', '111-222-3333', 'proveedorc@example.com', 'País C', TO_DATE('2023-03-20', 'YYYY-MM-DD'));



-- Insertar registros en COM_Tipo_Moneda
INSERT INTO COM_Tipo_Moneda (tipoMonedaID, nombreMoneda, tasaCambio) 
VALUES ('TM1', 'Dólar estadounidense', '1.00');

INSERT INTO COM_Tipo_Moneda (tipoMonedaID, nombreMoneda, tasaCambio) 
VALUES ('TM2', 'Euro', '0.85');

INSERT INTO COM_Tipo_Moneda (tipoMonedaID, nombreMoneda, tasaCambio) 
VALUES ('TM3', 'Yen japonés', '110.28');


-- Insertar registros que cumplen con la restricción CHECK
INSERT INTO COM_Orden_Compra (ordenCompraID, tipoMonedaID, fechaCompra, estadoCompra, proveedorID) 
VALUES ('OC4', 'TM1', TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'P', 'PROV2');

INSERT INTO COM_Orden_Compra (ordenCompraID, tipoMonedaID, fechaCompra, estadoCompra, proveedorID) 
VALUES ('OC5', 'TM2', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'PR', 'PROV3');

INSERT INTO COM_Orden_Compra (ordenCompraID, tipoMonedaID, fechaCompra, estadoCompra, proveedorID) 
VALUES ('OC6', 'TM3', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'E', 'PROV1');


-- Insertar registros en COM_Factura_Compra_Encabezado
INSERT INTO COM_Factura_Compra_Encabezado (facturaCompraID, ordenCompraID, proveedorID, tipoMonedaID, fechaFacturaCompra) 
VALUES ('FC1', 'OC4', 'PROV2', 'TM1', TO_DATE('2023-10-10', 'YYYY-MM-DD'));

INSERT INTO COM_Factura_Compra_Encabezado (facturaCompraID, ordenCompraID, proveedorID, tipoMonedaID, fechaFacturaCompra) 
VALUES ('FC2', 'OC5', 'PROV3', 'TM2', TO_DATE('2023-11-15', 'YYYY-MM-DD'));

INSERT INTO COM_Factura_Compra_Encabezado (facturaCompraID, ordenCompraID, proveedorID, tipoMonedaID, fechaFacturaCompra) 
VALUES ('FC3', 'OC6', 'PROV1', 'TM3', TO_DATE('2023-12-20', 'YYYY-MM-DD'));


-- Insertar registros en COM_Detalle_Factura
INSERT INTO COM_Detalle_Factura (facturaID, productoID, cantidadProducto, precioUnitario, impuestoVentas) 
VALUES ('FC1', 'PROD1', 5, 25.00, 5.00);

INSERT INTO COM_Detalle_Factura (facturaID, productoID, cantidadProducto, precioUnitario, impuestoVentas) 
VALUES ('FC2', 'PROD2', 10, 15.50, 3.00);

INSERT INTO COM_Detalle_Factura (facturaID, productoID, cantidadProducto, precioUnitario, impuestoVentas) 
VALUES ('FC3', 'PROD3', 3, 50.00, 7.50);


-- Insertar registros en COM_Descuento
INSERT INTO COM_Descuento (descuentoID, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) 
VALUES ('DESC1', 'Descuento Producto A', 'Descuento por volumen', 10.00, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Si');

INSERT INTO COM_Descuento (descuentoID, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) 
VALUES ('DESC2', 'Descuento Producto B', 'Descuento especial', 5.00, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'Si');

INSERT INTO COM_Descuento (descuentoID, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) 
VALUES ('DESC3', 'Descuento Producto C', 'Descuento por temporada', 0.00, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'No');


-- Insertar registros en COM_Detalle_Compra
INSERT INTO COM_Detalle_Compra (ordenCompraID, descuentoID, cantidadProducto, tipoMonedaID, precioUnitario, impuestoVentas) 
VALUES ('OC4', 'DESC1', 8, 'TM1', 20.00, 4.00);

INSERT INTO COM_Detalle_Compra (ordenCompraID, descuentoID, cantidadProducto, tipoMonedaID, precioUnitario, impuestoVentas) 
VALUES ('OC5', 'DESC2', 15, 'TM2', 18.75, 3.50);

INSERT INTO COM_Detalle_Compra (ordenCompraID, descuentoID, cantidadProducto, tipoMonedaID, precioUnitario, impuestoVentas) 
VALUES ('OC6', 'DESC3', 5, 'TM3', 45.00, 6.75);


-- Insertar registros en COM_Historial_Compra
INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, proveedorID, productoID, cantidadCompra, precioTotal) 
VALUES ('HC1', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'PROV1', 'PROD1', 10, 250.00);

INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, proveedorID, productoID, cantidadCompra, precioTotal) 
VALUES ('HC2', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'PROV2', 'PROD2', 15, 300.00);

INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, proveedorID, productoID, cantidadCompra, precioTotal) 
VALUES ('HC3', TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'PROV3', 'PROD3', 5, 200.00);


-- Insertar registros en COM_Historial_Pago
INSERT INTO COM_Historial_Pago (historialPagoID, fechaPago, proveedorID, montoPago, metodoPago) 
VALUES ('HP1', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'PROV1', 500.00, 'T');

INSERT INTO COM_Historial_Pago (historialPagoID, fechaPago, proveedorID, montoPago, metodoPago) 
VALUES ('HP2', TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'PROV2', 750.00, 'EF');

INSERT INTO COM_Historial_Pago (historialPagoID, fechaPago, proveedorID, montoPago, metodoPago) 
VALUES ('HP3', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'PROV3', 300.00, 'T');


-- Insertar registros en COM_Seguimiento_Envio
INSERT INTO COM_Seguimiento_Envio (seguimientoID, ordenCompraID, fechaEnvio, tipoMonedaID, fechaEntrega, numeroSeguimiento) 
VALUES ('SE1', 'OC4', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'TM1', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'ABC123456');

INSERT INTO COM_Seguimiento_Envio (seguimientoID, ordenCompraID, fechaEnvio, tipoMonedaID, fechaEntrega, numeroSeguimiento) 
VALUES ('SE2', 'OC5', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'TM2', TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'DEF789012');

INSERT INTO COM_Seguimiento_Envio (seguimientoID, ordenCompraID, fechaEnvio, tipoMonedaID, fechaEntrega, numeroSeguimiento) 
VALUES ('SE3', 'OC6', TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'TM3', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'GHI345678');


--***************** FIN DEL MODULO COMPRAS *****************---


--***************** INICIO DEL MODULO RRHH *****************---

-- Insertar registros en RRHH_Departamentos
INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento) 
VALUES ('DPT1', 'Ventas');

INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento) 
VALUES ('DPT2', 'Recursos Humanos');

INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento) 
VALUES ('DPT3', 'Finanzas');

-- Insertar registros en RRHH_Puestos
INSERT INTO RRHH_Puestos (puestoID, nombrePuesto) 
VALUES ('PST1', 'Gerente de Ventas');

INSERT INTO RRHH_Puestos (puestoID, nombrePuesto) 
VALUES ('PST2', 'Analista de RRHH');

INSERT INTO RRHH_Puestos (puestoID, nombrePuesto) 
VALUES ('PST3', 'Contador');

-- Insertar registros en RRHH_Empleados
INSERT INTO RRHH_Empleados (empleadoID, nombreEmpleado, apellidoEmpleado, fechaNacimiento, direccion, telefono, email, departamentoID, puestoID, fechaIngreso) 
VALUES ('EMP1', 'Juan', 'Pérez', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Calle Principal 123', '123-456-7890', 'juan@example.com', 'DPT1', 'PST1', TO_DATE('2020-01-15', 'YYYY-MM-DD'));

INSERT INTO RRHH_Empleados (empleadoID, nombreEmpleado, apellidoEmpleado, fechaNacimiento, direccion, telefono, email, departamentoID, puestoID, fechaIngreso) 
VALUES ('EMP2', 'María', 'Gómez', TO_DATE('1992-08-25', 'YYYY-MM-DD'), 'Avenida Central 456', '987-654-3210', 'maria@example.com', 'DPT2', 'PST2', TO_DATE('2019-06-10', 'YYYY-MM-DD'));

INSERT INTO RRHH_Empleados (empleadoID, nombreEmpleado, apellidoEmpleado, fechaNacimiento, direccion, telefono, email, departamentoID, puestoID, fechaIngreso) 
VALUES ('EMP3', 'Luis', 'Rodríguez', TO_DATE('1988-11-10', 'YYYY-MM-DD'), 'Calle Secundaria 789', '111-222-3333', 'luis@example.com', 'DPT3', 'PST3', TO_DATE('2021-03-20', 'YYYY-MM-DD'));


-- Insertar registros en RRHH_Contratos
INSERT INTO RRHH_Contratos (contratoID, empleadoID, tipoContrato, fechaInicioContrato, fechaFinContrato, descripcionContrato) 
VALUES ('CT1', 'EMP1', 'Tiempo Completo', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'Contrato a tiempo completo para EMP1');

INSERT INTO RRHH_Contratos (contratoID, empleadoID, tipoContrato, fechaInicioContrato, fechaFinContrato, descripcionContrato) 
VALUES ('CT2', 'EMP2', 'Medio Tiempo', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'), 'Contrato a medio tiempo para EMP2');

INSERT INTO RRHH_Contratos (contratoID, empleadoID, tipoContrato, fechaInicioContrato, fechaFinContrato, descripcionContrato) 
VALUES ('CT3', 'EMP3', 'Por Proyecto', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'Contrato por proyecto para EMP3');


-- Insertar registros en RRHH_Salarios
INSERT INTO RRHH_Salarios (salarioID, empleadoID, montoSalario, fechaInicioSalario, fechaFinSalario, descripcionSalario) 
VALUES ('SAL1', 'EMP1', '5000', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'Salario base para EMP1');

INSERT INTO RRHH_Salarios (salarioID, empleadoID, montoSalario, fechaInicioSalario, fechaFinSalario, descripcionSalario) 
VALUES ('SAL2', 'EMP2', '3000', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'), 'Salario base para EMP2');

INSERT INTO RRHH_Salarios (salarioID, empleadoID, montoSalario, fechaInicioSalario, fechaFinSalario, descripcionSalario) 
VALUES ('SAL3', 'EMP3', '4500', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'Salario base para EMP3');


-- Insertar registros en RRHH_Beneficios
INSERT INTO RRHH_Beneficios (beneficiosID, empleadoID, tipoBeneficio, descripcionBeneficio, fechaInicioBeneficio, fechaFinBeneficio) 
VALUES ('BEN1', 'EMP1', 'Seguro Médico', 'Beneficio de seguro médico para EMP1', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));

INSERT INTO RRHH_Beneficios (beneficiosID, empleadoID, tipoBeneficio, descripcionBeneficio, fechaInicioBeneficio, fechaFinBeneficio) 
VALUES ('BEN2', 'EMP2', 'Vacaciones Pagadas', 'Beneficio de vacaciones pagadas para EMP2', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'));

INSERT INTO RRHH_Beneficios (beneficiosID, empleadoID, tipoBeneficio, descripcionBeneficio, fechaInicioBeneficio, fechaFinBeneficio) 
VALUES ('BEN3', 'EMP3', 'Bono Anual', 'Beneficio de bono anual para EMP3', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));


-- Insertar registros en RRHH_Evaluaciones
INSERT INTO RRHH_Evaluaciones (evaluacionID, empleadoID, fechaEvaluacion, resultadoEvaluacion, comentarios) 
VALUES ('EVL1', 'EMP1', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Satisfactorio', 'Buen desempeño en el proyecto');

INSERT INTO RRHH_Evaluaciones (evaluacionID, empleadoID, fechaEvaluacion, resultadoEvaluacion, comentarios) 
VALUES ('EVL2', 'EMP2', TO_DATE('2023-02-20', 'YYYY-MM-DD'), 'Excelente', 'Contribución destacada al equipo');

INSERT INTO RRHH_Evaluaciones (evaluacionID, empleadoID, fechaEvaluacion, resultadoEvaluacion, comentarios) 
VALUES ('EVL3', 'EMP3', TO_DATE('2023-03-25', 'YYYY-MM-DD'), 'Necesita Mejora', 'Oportunidades de desarrollo identificadas');


-- Insertar registros en RRHH_Vacaciones
INSERT INTO RRHH_Vacaciones (vacacionesID, empleadoID, fechaInicioVacaciones, fechaFinalVacaciones, estadoVacaciones) 
VALUES ('VAC1', 'EMP1', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-15', 'YYYY-MM-DD'), 'Aprobadas');

INSERT INTO RRHH_Vacaciones (vacacionesID, empleadoID, fechaInicioVacaciones, fechaFinalVacaciones, estadoVacaciones) 
VALUES ('VAC2', 'EMP2', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'Pendientes');

INSERT INTO RRHH_Vacaciones (vacacionesID, empleadoID, fechaInicioVacaciones, fechaFinalVacaciones, estadoVacaciones) 
VALUES ('VAC3', 'EMP3', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'Aprobadas');


-- Insertar registros en RRHH_Ausencias
INSERT INTO RRHH_Ausencias (ausenciasID, empleadoID, fechaInicioAusencia, fechaFinalAusencia, tipoAusencia) 
VALUES ('AUS1', 'EMP1', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'Enfermedad');

INSERT INTO RRHH_Ausencias (ausenciasID, empleadoID, fechaInicioAusencia, fechaFinalAusencia, tipoAusencia) 
VALUES ('AUS2', 'EMP2', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-10', 'YYYY-MM-DD'), 'Vacaciones no planificadas');

INSERT INTO RRHH_Ausencias (ausenciasID, empleadoID, fechaInicioAusencia, fechaFinalAusencia, tipoAusencia) 
VALUES ('AUS3', 'EMP3', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-05', 'YYYY-MM-DD'), 'Asuntos personales');


-- Insertar registros en RRHH_Capacitaciones
INSERT INTO RRHH_Capacitaciones (capacitacionID, empleadoID, nombreCapacitacion, fechaInicioCapacitacion, fechaFinalCapacitacion, descripcionCapacitacion) 
VALUES ('CAP1', 'EMP1', 'Taller de Liderazgo', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'Desarrollo de habilidades de liderazgo');

INSERT INTO RRHH_Capacitaciones (capacitacionID, empleadoID, nombreCapacitacion, fechaInicioCapacitacion, fechaFinalCapacitacion, descripcionCapacitacion) 
VALUES ('CAP2', 'EMP2', 'Curso de Ventas', TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'Técnicas avanzadas de ventas');

INSERT INTO RRHH_Capacitaciones (capacitacionID, empleadoID, nombreCapacitacion, fechaInicioCapacitacion, fechaFinalCapacitacion, descripcionCapacitacion) 
VALUES ('CAP3', 'EMP3', 'Seminario de Marketing', TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'Estrategias de marketing digital');


-- Insertar registros en RRHH_HistorialLaboral
INSERT INTO RRHH_HistorialLaboral (historialID, empleadoID, fechaInicioTrabajo, fechaFinalTrabajo, comentariosTrabajo) 
VALUES ('HL1', 'EMP1', TO_DATE('2020-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-14', 'YYYY-MM-DD'), 'Posición de gerente de ventas');

INSERT INTO RRHH_HistorialLaboral (historialID, empleadoID, fechaInicioTrabajo, fechaFinalTrabajo, comentariosTrabajo) 
VALUES ('HL2', 'EMP2', TO_DATE('2019-06-10', 'YYYY-MM-DD'), TO_DATE('2023-02-09', 'YYYY-MM-DD'), 'Analista de recursos humanos');

INSERT INTO RRHH_HistorialLaboral (historialID, empleadoID, fechaInicioTrabajo, fechaFinalTrabajo, comentariosTrabajo) 
VALUES ('HL3', 'EMP3', TO_DATE('2021-03-20', 'YYYY-MM-DD'), TO_DATE('2023-03-19', 'YYYY-MM-DD'), 'Contador junior');


-- Insertar registros en RRHH_Ingresos
INSERT INTO RRHH_Ingresos (codIngreso, descripcionIngreso) 
VALUES ('INC1', 'Ingreso inicial como gerente');

INSERT INTO RRHH_Ingresos (codIngreso, descripcionIngreso) 
VALUES ('INC2', 'Ingreso a la posición de analista');

INSERT INTO RRHH_Ingresos (codIngreso, descripcionIngreso) 
VALUES ('INC3', 'Ingreso al departamento contable');


-- Insertar registros en RRHH_Deducciones
INSERT INTO RRHH_Deducciones (codDeduccion, descripcionDeduccion) 
VALUES ('DED1', 'Deducción por Seguro Médico');

INSERT INTO RRHH_Deducciones (codDeduccion, descripcionDeduccion) 
VALUES ('DED2', 'Deducción por Impuestos');

INSERT INTO RRHH_Deducciones (codDeduccion, descripcionDeduccion) 
VALUES ('DED3', 'Deducción por Préstamo');


-- Insertar registros en RRHH_Planilla
INSERT INTO RRHH_Planilla (planillaID, año, mes, empleadoID) 
VALUES ('PL1', TO_DATE('2023', 'YYYY'), TO_DATE('01', 'MM'), 'EMP1');

INSERT INTO RRHH_Planilla (planillaID, año, mes, empleadoID) 
VALUES ('PL2', TO_DATE('2023', 'YYYY'), TO_DATE('01', 'MM'), 'EMP2');

INSERT INTO RRHH_Planilla (planillaID, año, mes, empleadoID) 
VALUES ('PL3', TO_DATE('2023', 'YYYY'), TO_DATE('01', 'MM'), 'EMP3');


-- Insertar registros en RRHH_PlanillaIngresos
INSERT INTO RRHH_PlanillaIngresos (planillaIngresosID, empleadoID, codIngreso, monto) 
VALUES ('PIN1', 'EMP1', 'INC1', '2500');

INSERT INTO RRHH_PlanillaIngresos (planillaIngresosID, empleadoID, codIngreso, monto) 
VALUES ('PIN2', 'EMP2', 'INC2', '2800');

INSERT INTO RRHH_PlanillaIngresos (planillaIngresosID, empleadoID, codIngreso, monto) 
VALUES ('PIN3', 'EMP3', 'INC3', '3000');


-- Insertar registros en RRHH_PlanillaDeducciones
INSERT INTO RRHH_PlanillaDeducciones (planillaDeduccionesID, empleadoID, codDeduccion, monto) 
VALUES ('PDED1', 'EMP1', 'DED1', '100');

INSERT INTO RRHH_PlanillaDeducciones (planillaDeduccionesID, empleadoID, codDeduccion, monto) 
VALUES ('PDED2', 'EMP2', 'DED2', '150');

INSERT INTO RRHH_PlanillaDeducciones (planillaDeduccionesID, empleadoID, codDeduccion, monto) 
VALUES ('PDED3', 'EMP3', 'DED3', '200');


--***************** FIN DEL MODULO RRHH *****************---



--***************** INICIO DEL MODULO VENTAS *****************---

-- Insertar registros en VEN_Clientes
INSERT INTO VEN_Clientes (clienteID, nombreCliente, primerApellidoCliente, segundoApellidoCliente, numeroTelefono, emailCliente) 
VALUES ('CLI1', 'Juan', 'García', 'López', '123456789', 'juan@example.com');

INSERT INTO VEN_Clientes (clienteID, nombreCliente, primerApellidoCliente, segundoApellidoCliente, numeroTelefono, emailCliente) 
VALUES ('CLI2', 'María', 'Rodríguez', 'Pérez', '987654321', 'maria@example.com');

INSERT INTO VEN_Clientes (clienteID, nombreCliente, primerApellidoCliente, segundoApellidoCliente, numeroTelefono, emailCliente) 
VALUES ('CLI3', 'Carlos', 'Martínez', 'Gómez', '55555555', 'carlos@example.com');


-- Insertar registros en VEN_Pedidos
INSERT INTO VEN_Pedidos (pedidoID, fechaPedido, clienteID) 
VALUES ('PED1', TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'CLI1');

INSERT INTO VEN_Pedidos (pedidoID, fechaPedido, clienteID) 
VALUES ('PED2', TO_DATE('2023-11-24', 'YYYY-MM-DD'), 'CLI2');

INSERT INTO VEN_Pedidos (pedidoID, fechaPedido, clienteID) 
VALUES ('PED3', TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'CLI3');


-- Insertar registros en VEN_Pedidos_productos
INSERT INTO VEN_Pedidos_productos (pedidoID, productoID, cantidad) 
VALUES ('PED1', 'PROD1', 5);

INSERT INTO VEN_Pedidos_productos (pedidoID, productoID, cantidad) 
VALUES ('PED2', 'PROD2', 3);

INSERT INTO VEN_Pedidos_productos (pedidoID, productoID, cantidad) 
VALUES ('PED3', 'PROD3', 7);


-- Insertar registros en VEN_Vendedores
INSERT INTO VEN_Vendedores (vendedor_id, nombre, empleado_id) 
VALUES ('VEN1', 'Luis', 'EMP1');

INSERT INTO VEN_Vendedores (vendedor_id, nombre, empleado_id) 
VALUES ('VEN2', 'Ana', 'EMP2');

INSERT INTO VEN_Vendedores (vendedor_id, nombre, empleado_id) 
VALUES ('VEN3', 'Pedro', 'EMP3');


-- Insertar registros en VEN_Encabezado_factura
INSERT INTO VEN_Encabezado_factura (numeroEncabezado, fechaEncabezado, ubicacionID, clienteID, vendedorID, pedidoID) 
VALUES ('ENC1', TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'UBIC1', 'CLI1', 'VEN1', 'PED1');

INSERT INTO VEN_Encabezado_factura (numeroEncabezado, fechaEncabezado, ubicacionID, clienteID, vendedorID, pedidoID) 
VALUES ('ENC2', TO_DATE('2023-11-24', 'YYYY-MM-DD'), 'UBIC2', 'CLI2', 'VEN2', 'PED2');

INSERT INTO VEN_Encabezado_factura (numeroEncabezado, fechaEncabezado, ubicacionID, clienteID, vendedorID, pedidoID) 
VALUES ('ENC3', TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'UBIC3', 'CLI3', 'VEN3', 'PED3');


-- Insertar registros en VEN_Descuentos
INSERT INTO VEN_Descuentos (descuentoID, nombre, descripcion, valor, fechaInicio, fechaFin, activo) 
VALUES ('DESC1', 'Descuento de temporada', 'Descuento especial para la temporada navideña', 10.50, TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'si');

INSERT INTO VEN_Descuentos (descuentoID, nombre, descripcion, valor, fechaInicio, fechaFin, activo) 
VALUES ('DESC2', 'Descuento de aniversario', 'Descuento por el aniversario de la tienda', 5.00, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'si');

INSERT INTO VEN_Descuentos (descuentoID, nombre, descripcion, valor, fechaInicio, fechaFin, activo) 
VALUES ('DESC3', 'Descuento de primavera', 'Descuento especial para la temporada de primavera', 8.75, TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-05-31', 'YYYY-MM-DD'), 'no');


-- Insertar registros en VEN_Promociones
INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID)
VALUES ('PROM1', 'Promoción de Verano', 'Descuento especial para la temporada de verano', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 15.00, 'PROD1');

INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID)
VALUES ('PROM2', 'Oferta Especial Navideña', 'Descuento para celebrar la navidad', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-25', 'YYYY-MM-DD'), 20.00, 'PROD2');

INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID)
VALUES ('PROM3', 'Promoción de Otoño', 'Descuento especial para la temporada de otoño', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 12.50, 'PROD3');


-- Insertar registros en VEN_Detalle_factura
INSERT INTO VEN_Detalle_factura (numeroEncabezado, productoID, precio, cantidad, subTotal, descuento, IVADetalleFactura, totalMasIva, almacenID, descuentoID, promocionID)
VALUES ('ENC1', 'PROD1', 25.00, 2, 50.00, 0.00, 10.50, 60.50, 'ALM1', 'DESC1', 'PROM1');

INSERT INTO VEN_Detalle_factura (numeroEncabezado, productoID, precio, cantidad, subTotal, descuento, IVADetalleFactura, totalMasIva, almacenID, descuentoID, promocionID)
VALUES ('ENC2', 'PROD2', 30.00, 3, 90.00, 5.00, 15.75, 100.75, 'ALM2', 'DESC2', 'PROM2');

INSERT INTO VEN_Detalle_factura (numeroEncabezado, productoID, precio, cantidad, subTotal, descuento, IVADetalleFactura, totalMasIva, almacenID, descuentoID, promocionID)
VALUES ('ENC3', 'PROD3', 20.00, 4, 80.00, 0.00, 8.40, 88.40, 'ALM3', 'DESC3', 'PROM3');


-- Insertar registros en VEN_Descuentos_Productos
INSERT INTO VEN_Descuentos_Productos (descuentoID, productoID, fecha)
VALUES ('DESC1', 'PROD1', TO_DATE('2023-06-01', 'YYYY-MM-DD'));

INSERT INTO VEN_Descuentos_Productos (descuentoID, productoID, fecha)
VALUES ('DESC2', 'PROD2', TO_DATE('2023-12-01', 'YYYY-MM-DD'));

INSERT INTO VEN_Descuentos_Productos (descuentoID, productoID, fecha)
VALUES ('DESC3', 'PROD3', TO_DATE('2023-09-01', 'YYYY-MM-DD'));


-- Insertar registros en VEN_Historial_Ventas
INSERT INTO VEN_Historial_Ventas (historialVentasID, fecha, numeroEncabezado, productoID)
VALUES (1, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'ENC1', 'PROD1');

INSERT INTO VEN_Historial_Ventas (historialVentasID, fecha, numeroEncabezado, productoID)
VALUES (2, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'ENC2', 'PROD2');

INSERT INTO VEN_Historial_Ventas (historialVentasID, fecha, numeroEncabezado, productoID)
VALUES (3, TO_DATE('2023-09-20', 'YYYY-MM-DD'), 'ENC3', 'PROD3');

-- Insertar registros en VEN_Metodo_pago
INSERT INTO VEN_Metodo_pago (metodoPagoID, nombre, activo)
VALUES ('MP1', 'Tarjeta de crédito', 'si');

INSERT INTO VEN_Metodo_pago (metodoPagoID, nombre, activo)
VALUES ('MP2', 'Efectivo', 'si');

INSERT INTO VEN_Metodo_pago (metodoPagoID, nombre, activo)
VALUES ('MP3', 'Transferencia bancaria', 'si');


-- Insertar registros en VEN_Factura_metodo_pago
INSERT INTO VEN_Factura_metodo_pago (numeroEncabezado, metodoPagoID, monto)
VALUES ('ENC1', 'MP1', 100.50);

INSERT INTO VEN_Factura_metodo_pago (numeroEncabezado, metodoPagoID, monto)
VALUES ('ENC2', 'MP2', 75.25);

INSERT INTO VEN_Factura_metodo_pago (numeroEncabezado, metodoPagoID, monto)
VALUES ('ENC3', 'MP3', 120.00);


-- Insertar registros en VEN_Envios
INSERT INTO VEN_Envios (IDEnvio, fechaEnvio, peso, costoEnvio, ubicacionID)
VALUES ('ENV1', TO_DATE('2023-10-25', 'YYYY-MM-DD'), 10.5, 50.25, 'UBIC1');

INSERT INTO VEN_Envios (IDEnvio, fechaEnvio, peso, costoEnvio, ubicacionID)
VALUES ('ENV2', TO_DATE('2023-11-12', 'YYYY-MM-DD'), 15.2, 70.80, 'UBIC2');

INSERT INTO VEN_Envios (IDEnvio, fechaEnvio, peso, costoEnvio, ubicacionID)
VALUES ('ENV3', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 20.0, 90.00, 'UBIC3');


-- Insertar registros en VEN_Envios_detalle
INSERT INTO VEN_Envios_detalle (IDEnvio, IDEncabezadoFactura)
VALUES ('ENV1', 'ENC1');

INSERT INTO VEN_Envios_detalle (IDEnvio, IDEncabezadoFactura)
VALUES ('ENV2', 'ENC2');

INSERT INTO VEN_Envios_detalle (IDEnvio, IDEncabezadoFactura)
VALUES ('ENV3', 'ENC3');


-- Insertar registros en VEN_Devoluciones
INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, encabezadoID, descripcion)
VALUES ('DEV1', 'PROD1', 'CLI1', TO_DATE('2023-10-20', 'YYYY-MM-DD'), 5.0, 'ENC1', 'Producto dañado al llegar');

INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, encabezadoID, descripcion)
VALUES ('DEV2', 'PROD2', 'CLI2', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 3.0, 'ENC2', 'Error en el pedido');

INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, encabezadoID, descripcion)
VALUES ('DEV3', 'PROD3', 'CLI3', TO_DATE('2023-09-28', 'YYYY-MM-DD'), 2.0, 'ENC3', 'Cambio de producto');


-- Insertar registros en VEN_Calificaciones_Clientes
INSERT INTO VEN_Calificaciones_Clientes (calificacionClienteID, clienteID, descripcion, fechaCalificacion, calificacion)
VALUES ('CAL1', 'CLI1', 'Excelente servicio', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 4.5);

INSERT INTO VEN_Calificaciones_Clientes (calificacionClienteID, clienteID, descripcion, fechaCalificacion, calificacion)
VALUES ('CAL2', 'CLI2', 'Buen trato al cliente', TO_DATE('2023-11-03', 'YYYY-MM-DD'), 4.0);

INSERT INTO VEN_Calificaciones_Clientes (calificacionClienteID, clienteID, descripcion, fechaCalificacion, calificacion)
VALUES ('CAL3', 'CLI3', 'Entrega rápida', TO_DATE('2023-09-25', 'YYYY-MM-DD'), 5.0);

--***************** FIN DEL MODULO VENTAS *****************---
