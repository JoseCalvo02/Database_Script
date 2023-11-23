------------------------------------
----> PUNTO #4 - Índices       <----
------------------------------------
-- Índice en la columna nombre de la tabla INV_Productos
CREATE INDEX IDX_Productos_Nombre ON INV_Productos(nombre);

-- Índice en la columna categoriaID de la tabla INV_Productos
CREATE INDEX IDX_Productos_CategoriaID ON INV_Productos(categoriaID);
