int calculateNoOfMonths(String dob) {
  DateTime dateOfBirth = DateTime.parse(dob);
  DateTime now = DateTime.now();

  int yearDiff = now.year - dateOfBirth.year;
  int monthDiff = now.month - dateOfBirth.month;

  int noOfMonths = yearDiff * 12 + monthDiff;

  // Adjust for the day of the month
  if (now.day < dateOfBirth.day) {
    noOfMonths--;
  }

  return noOfMonths;
}
