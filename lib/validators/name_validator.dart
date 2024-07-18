/// The NameValidator class in Dart provides a method to validate a given string value for a valid name
/// format.
class NameValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'cannot contain special characters/numbers';
    }
    return null;
  }
}
