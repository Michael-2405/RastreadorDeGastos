import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rastreadordegastos/bar%20graph/bar_graph.dart';
import 'package:rastreadordegastos/data/expense_data.dart';
import 'package:rastreadordegastos/datetime/date_time_helper.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime comienzoDeSemana;
  const ExpenseSummary({super.key, required this.comienzoDeSemana});

  @override
  Widget build(BuildContext context) {
    // obtener la fecha por cada dia de semana
    String domingo = convertirDateTimeACadena(
      comienzoDeSemana.add(const Duration(days: 0)),
    );
    String lunes = convertirDateTimeACadena(
      comienzoDeSemana.add(const Duration(days: 1)),
    );
    String martes = convertirDateTimeACadena(
      comienzoDeSemana.add(const Duration(days: 2)),
    );
    String miercoles = convertirDateTimeACadena(
      comienzoDeSemana.add(const Duration(days: 3)),
    );
    String jueves = convertirDateTimeACadena(
      comienzoDeSemana.add(const Duration(days: 4)),
    );
    String viernes = convertirDateTimeACadena(
      comienzoDeSemana.add(const Duration(days: 5)),
    );
    String sabado = convertirDateTimeACadena(
      comienzoDeSemana.add(const Duration(days: 6)),
    );

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.only(top: 25.0),
        child: SizedBox(
          height: 200,
          child: MyBarGraph(
            maxY: 100,
            cantidadDom: value.calcularResumenDiarioDeGastos()[domingo] ?? 0,
            cantidadLun: value.calcularResumenDiarioDeGastos()[lunes] ?? 0,
            cantidadMar: value.calcularResumenDiarioDeGastos()[martes] ?? 0,
            cantidadMie: value.calcularResumenDiarioDeGastos()[miercoles] ?? 0,
            cantidadJue: value.calcularResumenDiarioDeGastos()[jueves] ?? 0,
            cantidadVie: value.calcularResumenDiarioDeGastos()[viernes] ?? 0,
            cantidadSab: value.calcularResumenDiarioDeGastos()[sabado] ?? 0,
          ),
        ),
      ),
    );
  }
}
