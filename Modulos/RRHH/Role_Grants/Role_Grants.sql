-- Crea role para el módulo
CREATE ROLE rrhh_role;

-- Otorgar grant con privilegios sobre las tablas ===> CORREGIR CON SUS DATOS
GRANT ALL PRIVILEGES ON INV_ALERTASSTOCK TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_ALMACENES TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_CATEGORIAS TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_DEVOLUCIONES TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_GARANTIAS TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_HISTORIALMOVIMIENTOS TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_MARCAS TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_PRODUCTOS TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_PRODUCTOSPROVEEDORES TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_STOCK TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_TRANSFERENCIASALMACENES TO inventarios_role;
GRANT ALL PRIVILEGES ON INV_UBICACIONES TO inventarios_role;
