enum CrimeType {
  theft,
  robbery,
  murder,
  attemptedMurder,
  kidnapping,
  traffic,
  smuggling,
  bodilyInjury
}

extension CrimeTypeExtension on CrimeType {
  String get value {
    switch (this) {
      case CrimeType.theft:
        return 'Furto';
      case CrimeType.robbery:
        return 'Roubo';
      case CrimeType.murder:
        return 'Assassinato';
      case CrimeType.attemptedMurder:
        return 'Tentativa de assassinato';
      case CrimeType.kidnapping:
        return 'Sequestro';
      case CrimeType.traffic:
        return 'Tráfico';
      case CrimeType.smuggling:
        return 'Contrabando';
      case CrimeType.bodilyInjury:
        return 'Lesão corporal';
      default:
        return 'Desconhecido';
    }
  }
}