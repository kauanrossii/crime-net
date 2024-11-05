import 'package:flutter/material.dart';

class ListFeatures extends StatelessWidget {
  const ListFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Align(
          alignment: Alignment.center,
          child:
              // Card para a funcionalidade "Descobrir crimes na região"
              Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descobrir crimes na região',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Permite ao usuário visualizar crimes ocorridos '
                    'em sua área local, ajudando-o a ficar informado sobre '
                    'a segurança de sua vizinhança.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child:
              // Card para a funcionalidade "Reportar crime ocorrido"
              Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reportar crime ocorrido',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Facilita o reporte de crimes que o usuário presenciou '
                    'ou dos quais foi vítima, permitindo que ele contribua '
                    'para a segurança pública ao compartilhar informações.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
