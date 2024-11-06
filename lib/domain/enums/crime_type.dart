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
        return 'theft';
      case CrimeType.robbery:
        return 'robbery';
      case CrimeType.murder:
        return 'murder';
      case CrimeType.attemptedMurder:
        return 'attemptedMurder';
      case CrimeType.kidnapping:
        return 'kidnapping';
      case CrimeType.traffic:
        return 'traffic';
      case CrimeType.smuggling:
        return 'smuggling';
      case CrimeType.bodilyInjury:
        return 'bodilyInjury';
      default:
        return 'unknown';
    }
  }
}