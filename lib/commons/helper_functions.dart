//input date of birth, return number of months till now
int calculateMonths(DateTime dob) {
  DateTime now = DateTime.now();
  int yearsDifference = now.year - dob.year;
  int monthsDifference = now.month - dob.month;

  int totalMonths = (yearsDifference * 12) + monthsDifference;

  return totalMonths;
}
