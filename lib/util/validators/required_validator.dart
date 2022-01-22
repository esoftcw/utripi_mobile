String? requiredValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Input cannot be empty';
  }
  return null;
}