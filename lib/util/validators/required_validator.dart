String? requiredValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Input field cannot be empty';
  }
  return null;
}