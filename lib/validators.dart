class AppValidators {
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не може бути порожнім';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Введіть email (логін)';
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Введіть коректну адресу електронної пошти';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введіть пароль';
    }
    if (value.length < 7) {
      return 'Пароль має містити щонайменше 7 символів';
    }
    return null;
  }
}