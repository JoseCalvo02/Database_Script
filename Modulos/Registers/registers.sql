/*******************MODULO INVENTARIO***************************/

-- Inserting records into INV_Categorias table
INSERT INTO INV_Categorias (categoriaID, nombre)
VALUES ('CAT1', 'Electronics'),
       ('CAT2', 'Clothing'),
       ('CAT3', 'Furniture');

-- Inserting records into INV_Marcas table
INSERT INTO INV_Marcas (marcaID, nombre)
VALUES ('M1', 'Sony'),
       ('M2', 'Samsung'),
       ('M3', 'Nike');

-- Inserting records into INV_Garantias table
INSERT INTO INV_Garantias (garantiaID, descripcion)
VALUES ('G1', '1 year warranty'),
       ('G2', '2 years warranty'),
       ('G3', 'No warranty');

