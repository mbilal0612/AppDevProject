class ChildModel {
  final String fName;
  final String lName;
  final String dob;
  final int noOfMonths;
  //store id of current class
  final String currentClass;
  final String parentUUID;

  ChildModel({
    required this.fName,
    required this.lName,
    required this.dob,
    required this.noOfMonths,
    required this.currentClass,
    required this.parentUUID,
  });
}
