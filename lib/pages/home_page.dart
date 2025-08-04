import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rastreadordegastos/components/expense_tile.dart';
import 'package:rastreadordegastos/data/expense_data.dart';
import 'package:rastreadordegastos/models/expense_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // cotroladores
  final nombreGastoControlador = TextEditingController();
  final cantidadGastoControlador = TextEditingController();

  // agregar nuevo gasto
  void agregarNuevoGasto() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Agregar nuevo gasto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // nombre del gasto
            TextField(controller: nombreGastoControlador),
            // cantidad del gasto
            TextField(controller: cantidadGastoControlador),
          ],
        ),
        actions: [
          // boton de cancelar
          MaterialButton(onPressed: cancelar, child: Text('Cancelar')),

          // boton de guardar
          MaterialButton(onPressed: guardar, child: Text('Guardar')),
        ],
      ),
    );
  }

  // guardar
  void guardar() {
    // crear el item del gasto
    ExpenseItem nuevoGasto = ExpenseItem(
      nombre: nombreGastoControlador.text.trim(),
      cantidad: cantidadGastoControlador.text.trim(),
      fecha: DateTime.now(),
    );

    // agregar el nuevo gasto
    Provider.of<ExpenseData>(
      context,
      listen: false,
    ).agregarNuevoGasto(nuevoGasto);

    Navigator.pop(context);
    clear();
  }

  // cancelar
  void cancelar() {
    Navigator.pop(context);
    clear();
  }

  // limpiar campos
  void clear() {
    nombreGastoControlador.clear();
    cantidadGastoControlador.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.green[300],
        floatingActionButton: FloatingActionButton(
          onPressed: agregarNuevoGasto,
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: [
            // resumen semanal

            // lista de gastos
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.obtenerTodaLaListaDeGastos().length,
              itemBuilder: (context, index) => ExpenseTile(
                nombre: value.obtenerTodaLaListaDeGastos()[index].nombre,
                cantidad: value.obtenerTodaLaListaDeGastos()[index].cantidad,
                fecha: value.obtenerTodaLaListaDeGastos()[index].fecha,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
