class Validators {
  static String? validateInput(String? value) {
    if (value == null || value.trim().isEmpty) return "Le champ est requis";
    if (value.trim().length < 5) return "Le champ doit contenir au moins 5 caractères";

    // Accepte lettres, accents, chiffres, espaces, apostrophes et tirets
    // if (!RegExp(r"^[A-Za-zÀ-ÖØ-öø-ÿ0-9'’\- ]+$").hasMatch(value)) {
    //   return "Champ invalide";
    // }

    return null;
  }

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
    if (value == null || value.isEmpty) {
      return "Le numéro de téléphone est requis";
    }
    
    // Regex améliorée pour prendre en charge plusieurs formats
    if (!RegExp(r'^(?:\+?(\d{1,3}))?[-. ]?(\d{2,4})[-. ]?(\d{2,4})[-. ]?(\d{2,4})$').hasMatch(value)) {
      return "Numéro de téléphone invalide";
    }
    
    return null;
  }


  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return "Le nom est requis";

    if (!RegExp(r"^[A-Za-zÀ-ÖØ-öø-ÿ]+([ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$").hasMatch(value)) {
      return "Nom invalide";
    }

    return null;
  }


  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) return "Le prénom est requis";
    // ignore: valid_regexps
    if (!RegExp(r'^[A-Za-zÀ-ÖØ-öø-ÿ ]+$').hasMatch(value)) return "Prénom invalide";
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
