
String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid email address';
  }
  return null;
}