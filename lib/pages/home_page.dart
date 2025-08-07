import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rastreadordegastos/components/expense_summary.dart';
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
  final cantidadDeGastoEnPesoControlador = TextEditingController();

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
            TextField(
              controller: nombreGastoControlador,
              decoration: const InputDecoration(hintText: 'Nombre del gasto'),
            ),

            TextField(
              controller: cantidadDeGastoEnPesoControlador,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Pesos'),
            ),
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
      cantidad: cantidadDeGastoEnPesoControlador.text.trim(),
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
    cantidadDeGastoEnPesoControlador.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: agregarNuevoGasto,
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            // resumen semanal
            ExpenseSummary(comienzoDeSemana: value.fechaDeComienzoDeSemana()),

            const SizedBox(height: 20),
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
