import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rastreadordegastos/bar%20graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double cantidadDom;
  final double cantidadLun;
  final double cantidadMar;
  final double cantidadMie;
  final double cantidadJue;
  final double cantidadVie;
  final double cantidadSab;

  const MyBarGraph({
    super.key,
    required this.maxY,
    required this.cantidadDom,
    required this.cantidadLun,
    required this.cantidadMar,
    required this.cantidadMie,
    required this.cantidadJue,
    required this.cantidadVie,
    required this.cantidadSab,
  });

  @override
  Widget build(BuildContext context) {
    // inicializar el grafico
    BarData myBarData = BarData(
      cantidadDom: cantidadDom,
      cantidadLun: cantidadLun,
      cantidadMar: cantidadMar,
      cantidadMie: cantidadMie,
      cantidadJue: cantidadJue,
      cantidadVie: cantidadVie,
      cantidadSab: cantidadSab,
    );
    myBarData.inicializarDatosDeBarra();

    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: myBarData.datosDeBarra
            .map(
              (dato) => BarChartGroupData(
                x: dato.x,
                barRods: [
                  BarChartRodData(
                    toY: dato.y,
                    color: Colors.grey[800],
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('D', style: style);
      break;
    case 1:
      text = const Text('L', style: style);
      break;
    case 2:
      text = const Text('M', style: style);
      break;
    case 3:
      text = const Text('M', style: style);
      break;
    case 4:
      text = const Text('J', style: style);
      break;
    case 5:
      text = const Text('V', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('', style: style);
  }

  return SideTitleWidget(child: text, meta: meta);
}
