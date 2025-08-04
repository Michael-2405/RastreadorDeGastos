import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String nombre;
  final String cantidad;
  final DateTime fecha;

  const ExpenseTile({
    super.key,
    required this.nombre,
    required this.cantidad,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nombre),
      subtitle: Text('${fecha.day} / ${fecha.month} / ${fecha.year}'),
      trailing: Text('\$$cantidad'),
    );
  }
}
