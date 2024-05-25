class ClassroomModel {
  final String uuid;
  final String name;
  final String noOfMonths;
  final String capacity;
  final int waitlistCapacity;

  ClassroomModel({
    required this.uuid,
    required this.name,
    required this.noOfMonths,
    required this.capacity,
    required this.waitlistCapacity,
  });
}