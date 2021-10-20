class Control {
  final String hotmail = '@hotmail.com';
  final String gmail = '@gmail.com';
  // alphanumeric and _-=@,.;
  final validCharacters = RegExp(r'^[a-zA-Z0-9_\-@\.]+$');
  //final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
}