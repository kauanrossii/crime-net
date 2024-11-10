import 'package:crime_net/domain/enums/crime_type.dart';
import 'package:crime_net/domain/models/reported_crime.dart';
import 'package:crime_net/domain/services/reported_crime_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class ListReportedCrimes extends StatefulWidget {
  final ReportedCrimeService reportedCrimeService;

  const ListReportedCrimes({super.key, required this.reportedCrimeService});

  @override
  State<StatefulWidget> createState() => ListReportedCrimesState();
}

class ListReportedCrimesState extends State<ListReportedCrimes> {
  List<ReportedCrime> reportedCrimes = [];
  Map<String, String> addressCache = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: reportedCrimes.length,
        itemBuilder: (context, index) {
          final reportedCrime = reportedCrimes[index];
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.transparent, // Fundo transparente
                border: Border.all(color: Colors.grey), // Borda, se necessário
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(reportedCrime.type.value),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          "Data do ocorrido: ${formatarData(reportedCrime.date)}",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                    FutureBuilder<String>(
                      future: getAddressFromCoordinates(
                          reportedCrime.latitude, reportedCrime.longitude),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Row(
                            children: [
                              Icon(Icons.location_on, size: 18),
                              SizedBox(width: 8),
                              Text("Carregando endereço..."),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return const Row(
                            children: [
                              Icon(Icons.location_on, size: 18),
                              SizedBox(width: 8),
                              Text("Erro ao carregar endereço"),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              const Icon(Icons.location_on, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Wrap(
                                alignment: WrapAlignment.start,
                                runSpacing: 4.0,
                                children: [
                                  Text(
                                    snapshot.data ?? "Endereço desconhecido",
                                    overflow: TextOverflow.clip,
                                    softWrap: true,
                                  ),
                                ],
                              ))
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
                isThreeLine: true,
              ));
        });
  }

  String formatarData(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays < 1) {
      if (difference.inHours >= 1) {
        return '${difference.inHours} horas atrás';
      } else if (difference.inMinutes >= 1) {
        return '${difference.inMinutes} minutos atrás';
      } else {
        return 'Agora mesmo';
      }
    } else {
      final DateFormat dateFormat = DateFormat('dd/MM/yyyy, HH:mm');
      return dateFormat.format(date);
    }
  }

  Future<String> getAddressFromCoordinates(
      double latitude, double longitude) async {
    String cacheKey = '$latitude,$longitude';

    if (addressCache.containsKey(cacheKey)) {
      return addressCache[cacheKey]!;
    }

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address =
            '${placemark.street} - ${placemark.name}, ${placemark.subLocality}';

        addressCache[cacheKey] = address;

        return address;
      } else {
        return "Endereço não encontrado";
      }
    } catch (e) {
      return "Erro ao obter endereço: $e";
    }
  }

  fetchData() async {
    final loadedReportedCrimes = await widget.reportedCrimeService.getAll();
    setState(() {
      reportedCrimes = loadedReportedCrimes;
    });
  }
}
