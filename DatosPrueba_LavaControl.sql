USE LavaControl;

INSERT INTO roles (id, nombre_rol) VALUES 
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Cliente');

INSERT INTO usuarios (id, rol_id, nombre, email, password_hash, telefono) VALUES 
(1, 1, 'Caren Yonda', 'caren.admin@lavanderia.com', '$2y$10$hashedpassword1', '3101112233'),
(2, 2, 'Carlos Pérez', 'carlos.emp@lavanderia.com', '$2y$10$hashedpassword2', '3202223344'),
(3, 3, 'María Rodríguez', 'maria.rod@gmail.com', '$2y$10$hashedpassword3', '3153334455'),
(4, 3, 'Andrés Gómez', 'andres.g@gmail.com', '$2y$10$hashedpassword4', '3184445566'),
(5, 3, 'Luisa Fernanda', 'luisa.f@gmail.com', '$2y$10$hashedpassword5', '3125556677');

INSERT INTO servicios (id, nombre_servicio, descripcion, precio_unitario, tipo_cobro) VALUES 
(1, 'Lavado por Kilo Regular', 'Lavado, secado y doblado de ropa de uso diario.', 5000.00, 'Kilo'),
(2, 'Lavado en Seco Traje', 'Tratamiento delicado para trajes o sacos formales.', 16000.00, 'Unidad'),
(3, 'Lavado de Edredón / Cobija', 'Lavado profundo y desinfección de cobijas pesadas.', 20000.00, 'Unidad'),
(4, 'Planchado por Prenda', 'Servicio exclusivo de planchado a vapor.', 3500.00, 'Unidad'),
(5, 'Lavado de Calzado', 'Limpieza y desinfección especializada de tenis.', 12000.00, 'Unidad');

INSERT INTO ordenes (id, cliente_id, empleado_id, peso_total_kg, costo_total, estado, observaciones) VALUES 
(1, 3, 2, 4.50, 22500.00, 'En Secado', 'Prenda delicada azul con botón flojo.'),
(2, 4, 2, 6.00, 30000.00, 'En Lavado', 'Ninguna observación especial.'),
(3, 5, 2, 3.00, 20000.00, 'Listo', 'Incluye edredón grande individual.'),
(4, 3, 1, 5.20, 26000.00, 'Recibido', 'Separar ropa blanca de color.'),
(5, 4, 1, 2.00, 12000.00, 'Entregado', 'Servicio de lavado de tenis completado.');

INSERT INTO detalle_orden (orden_id, servicio_id, cantidad, subtotal) VALUES 
(1, 1, 4.50, 22500.00),
(2, 1, 6.00, 30000.00),
(3, 3, 1.00, 20000.00),
(4, 1, 5.20, 26000.00),
(5, 5, 1.00, 12000.00);

INSERT INTO pagos (orden_id, monto_pagado, metodo_pago, estado_pago) VALUES 
(1, 22500.00, 'Efectivo', 'Pagado'),
(2, 0.00, 'Efectivo', 'Pendiente'),
(3, 20000.00, 'Nequi', 'Pagado'),
(4, 26000.00, 'Transferencia', 'Pagado'),
(5, 12000.00, 'Daviplata', 'Pagado');