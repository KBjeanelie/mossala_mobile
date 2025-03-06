class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "L'email est requis";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return "Email invalide";
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) return "Le mot de passe doit avoir au moins 6 caractères";
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value!= password) return "Les mots de passe ne correspondent pas";
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return "Le numéro de téléphone est requis";
    if (!RegExp(r'^0[1-9][0-9]{8}$').hasMatch(value)) return "Numéro de téléphone invalide";
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return "Le nom est requis";
    if (!RegExp(r'^[A-Za-z��-Ö��-öø-�� ]+$').hasMatch(value)) return "Nom invalide";
    return null;
  }

  static String? validateQuater(String? value) {
    if (value == null || value.isEmpty) return "Le quartier est requise";
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) return "Le code OTP est requis";
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) return "Code OTP invalide";
    return null;
  }
}
