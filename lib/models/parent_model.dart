class Parent{
  final String uuid;
  final String fName;
  final String lName;
  //just store the uuid of the wards
  final List<String>? wards;

  Parent({
    required this.uuid,
    required this.fName,
    required this.lName,
    this.wards,
  });
}