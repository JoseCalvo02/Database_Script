CREATE MATERIALIZED VIEW MV_PedidosPorCliente
BUILD IMMEDIATE
REFRESH FAST ON COMMIT
AS
SELECT c.clienteID, c.nombreCliente, COUNT(p.pedidoID) AS totalPedidos
FROM VEN_Clientes c
LEFT JOIN VEN_Pedidos p ON c.clienteID = p.clienteID
GROUP BY c.clienteID, c.nombreCliente;



