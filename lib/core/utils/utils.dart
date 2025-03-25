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
  final DateTime now = DateTime.now();
  final DateTime createdAt = parseDate(dateString); 
  final Duration difference = now.difference(createdAt);

  if (difference.inSeconds < 60) {
    return "Il y a ${difference.inSeconds} seconde${difference.inSeconds > 1 ? 's' : ''}";
  } else if (difference.inMinutes < 60) {
    return "Il y a ${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''}";
  } else if (difference.inHours < 24) {
    return "Il y a ${difference.inHours} heure${difference.inHours > 1 ? 's' : ''}";
  } else if (difference.inDays < 30) {
    return "Il y a ${difference.inDays} jour${difference.inDays > 1 ? 's' : ''}";
  } else if (difference.inDays < 365) {
    return "Il y a ${difference.inDays ~/ 30} mois";
  } else {
    return "Il y a ${difference.inDays ~/ 365} an${difference.inDays ~/ 365 > 1 ? 's' : ''}";
  }
}

