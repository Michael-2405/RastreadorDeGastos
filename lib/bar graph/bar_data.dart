import 'package:rastreadordegastos/bar%20graph/individual_bar.dart';

class BarData {
  final double cantidadDom;
  final double cantidadLun;
  final double cantidadMar;
  final double cantidadMie;
  final double cantidadJue;
  final double cantidadVie;
  final double cantidadSab;

  BarData({
    required this.cantidadDom,
    required this.cantidadLun,
    required this.cantidadMar,
    required this.cantidadMie,
    required this.cantidadJue,
    required this.cantidadVie,
    required this.cantidadSab,
  });

  List<IndividualBar> datosDeBarra = [];

  // inicializar los datos de barra
  void inicializarDatosDeBarra() {
    datosDeBarra = [
      // domingo
      IndividualBar(x: 0, y: cantidadDom),
      // lunes
      IndividualBar(x: 1, y: cantidadLun),
      // martes
      IndividualBar(x: 2, y: cantidadMar),
      // miercoles
      IndividualBar(x: 3, y: cantidadMie),
      // jueves
      IndividualBar(x: 4, y: cantidadJue),
      // viernes
      IndividualBar(x: 5, y: cantidadVie),
      // sabado
      IndividualBar(x: 6, y: cantidadSab),
    ];
  }
}
