USE LavaControl;

-- Registrar un nuevo cliente en el sistema
INSERT INTO usuarios (rol_id, nombre, email, password_hash, telefono) 
VALUES (3, 'Sofía Valenzuela', 'sofia.valenzuela@gmail.com', '$2y$10$hashedpassword6', '3149876543');

-- Buscar clientes cuyo nombre contenga 'Mar' ordenados alfabéticamente
SELECT id, nombre, email, telefono 
FROM usuarios 
WHERE rol_id = 3 AND nombre LIKE '%Mar%' 
ORDER BY nombre ASC;

--  Modificar el número de teléfono de un usuario
UPDATE usuarios 
SET telefono = '3109998888' 
WHERE id = 3;

--  Borrar un registro de usuario o servicio por su ID
DELETE FROM servicios 
WHERE id = 10;

-- [JOIN] Consultar las órdenes de servicio detalladas con el nombre del cliente y el empleado responsable
SELECT o.id AS orden_id, c.nombre AS cliente, e.nombre AS empleado_responsable, o.peso_total_kg,
 o.costo_total, o.estado, o.fecha_creacion FROM ordenes o
JOIN usuarios c ON c.id = o.cliente_id
JOIN usuarios e ON e.id = o.empleado_id
ORDER BY o.fecha_creacion DESC;

-- Detalle completo de los servicios solicitados dentro de cada orden
SELECT o.id AS orden_id, c.nombre AS cliente, s.nombre_servicio,
    d.cantidad, d.subtotal FROM detalle_orden d
JOIN ordenes o ON o.id = d.orden_id
JOIN usuarios c ON c.id = o.cliente_id
JOIN servicios s ON s.id = d.servicio_id;

-- [AGREGACIÓN Y GROUP BY] Calcular los ingresos totales acumulados por mes 
SELECT 
    DATE_FORMAT(fecha_creacion, '%Y-%m') AS mes, 
    SUM(costo_total) AS ingresos_totales,
    COUNT(*) AS total_ordenes_mes
FROM ordenes
GROUP BY mes
ORDER BY mes ASC;

-- [HAVING] Identificar clientes frecuentes que tienen más de 2 órdenes registradas en el sistema
SELECT 
    cliente_id, 
    COUNT(*) AS total_ordenes
FROM ordenes
GROUP BY cliente_id
HAVING COUNT(*) > 2;

-- [AGREGACIÓN Y GROUP BY] Consultar el total recaudado según el método de pago utilizado
SELECT 
    metodo_pago, 
    COUNT(*) AS cantidad_transacciones,
    SUM(monto_pagado) AS total_recaudado
FROM pagos
WHERE estado_pago = 'Pagado'
GROUP BY metodo_pago;