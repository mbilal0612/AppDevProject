class ClassroomModel {
  final String uuid;
  final String name;
  final int startMonth;
  final int noOfMonths;
  final int capacity;
  final int waitlistCapacity;

  ClassroomModel({
    required this.uuid,
    required this.name,
    required this.startMonth,
    required this.noOfMonths,
    required this.capacity,
    required this.waitlistCapacity,
  });
}
