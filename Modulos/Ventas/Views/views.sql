/********************CORREGIDO ٩(◕‿◕｡)۶ ****************************/  
CREATE MATERIALIZED VIEW MV_PedidosPorCliente
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT c.clienteID, c.nombreCliente, COUNT(p.pedidoID) AS totalPedidos
FROM VEN_Clientes c
LEFT JOIN VEN_Pedidos p ON c.clienteID = p.clienteID
GROUP BY c.clienteID, c.nombreCliente;

CREATE MATERIALIZED VIEW MV_TotalProductosPorPedido
BUILD DEFERRED
REFRESH COMPLETE ON DEMAND
AS
SELECT pedidoID, COUNT(productoID) AS totalProductos
FROM VEN_Pedidos_productos
GROUP BY pedidoID;

/********************FINAL corrección ٩(◕‿◕｡)۶****************************/  

CREATE VIEW VW_DetallesPedidosProductos AS
SELECT p.pedidoID, p.fechaPedido, pp.productoID, pp.cantidad
FROM VEN_Pedidos p
JOIN VEN_Pedidos_productos pp ON p.pedidoID = pp.pedidoID;

CREATE VIEW VW_ClientesConPedidos AS
SELECT c.clienteID, c.nombreCliente, p.pedidoID, p.fechaPedido
FROM VEN_Clientes c
LEFT JOIN VEN_Pedidos p ON c.clienteID = p.clienteID;


