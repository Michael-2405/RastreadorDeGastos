import 'package:flutter/material.dart';
import 'package:rastreadordegastos/datetime/date_time_helper.dart';
import 'package:rastreadordegastos/models/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  // lista de todos los gastos
  List<ExpenseItem> listaDeGastoGeneral = [];

  // obtener lista de gastos
  List<ExpenseItem> obtenerTodaLaListaDeGastos() {
    return listaDeGastoGeneral;
  }

  // agregar nuevo gasto
  void agregarNuevoGasto(ExpenseItem nuevoGasto) {
    listaDeGastoGeneral.add(nuevoGasto);

    notifyListeners();
  }

  // eliminar un gasto
  void borrarGasto(ExpenseItem gasto) {
    listaDeGastoGeneral.remove(gasto);

    notifyListeners();
  }

  // obtener dia de semana
  String obtenerDiaDeSemana(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Lun';
      case 2:
        return 'Mar';
      case 3:
        return 'Mie';
      case 4:
        return 'Jue';
      case 5:
        return 'Vie';
      case 6:
        return 'Sab';
      case 7:
        return 'Dom';
      default:
        return '';
    }
  }

  // obtener fecha para empezar la semana
  DateTime fechaDeComienzoDeSemana() {
    DateTime? comienzoDeSemana;

    // obtener la fecha de hoy
    DateTime hoy = DateTime.now();

    // ir hacia atras desde hoy para encontrar el domingo
    for (int i = 0; i < 7; i++) {
      if (obtenerDiaDeSemana(hoy.subtract(Duration(days: i))) == 'Dom') {
        comienzoDeSemana = hoy.subtract(Duration(days: i));
      }
    }
    return comienzoDeSemana!;
  }

  // convertir la lista de gastos general a un resumen de gastos diarios
  Map<String, double> calcularResumenDiarioDeGastos() {
    Map<String, double> resumenDeGastosDiario = {
      // date (yyyymmdd) : cantidadTotalPorDia
    };

    for (var gasto in listaDeGastoGeneral) {
      String fecha = convertirDateTimeACadena(gasto.fecha);
      double cantidad = double.parse(gasto.cantidad);

      if (resumenDeGastosDiario.containsKey(fecha)) {
        double cantidadActual = resumenDeGastosDiario[fecha]!;
        cantidadActual += cantidad;
        resumenDeGastosDiario[fecha] = cantidadActual;
      } else {
        resumenDeGastosDiario.addAll({fecha: cantidad});
      }
    }

    return resumenDeGastosDiario;
  }
}
