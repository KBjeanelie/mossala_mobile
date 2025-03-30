import 'package:intl/intl.dart';

DateTime parseDate(String dateString) {
  try {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.parse(dateString); // Essaie de parser la date
  } catch (e) {
    // Si la date est incorrecte, renvoyer une valeur par défaut
    return DateTime.now(); // Par exemple, renvoyer la date actuelle en cas d'erreur
  }
}
String timeAgo(String dateString) {
  DateTime? createdAt = DateTime.tryParse(dateString);
  
  if (createdAt == null) return "Date invalide";

  final DateTime now = DateTime.now();
  final Duration difference = now.difference(createdAt);

  if (difference.inSeconds < 1) {
    return "À l'instant";
  } else if (difference.inSeconds < 60) {
    return "Il y a ${difference.inSeconds} seconde${difference.inSeconds > 1 ? 's' : ''}";
  } else if (difference.inMinutes < 60) {
    return "Il y a ${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''}";
  } else if (difference.inHours < 24) {
    return "Il y a ${difference.inHours} heure${difference.inHours > 1 ? 's' : ''}";
  } else if (difference.inDays < 30) {
    return "Il y a ${difference.inDays} jour${difference.inDays > 1 ? 's' : ''}";
  } else if (difference.inDays < 365) {
    int months = difference.inDays ~/ 30;
    return "Il y a $months mois";
  } else {
    int years = difference.inDays ~/ 365;
    return "Il y a $years an${years > 1 ? 's' : ''}";
  }
}


