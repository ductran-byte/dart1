class Student {
  String id;
  String name;
  DateTime dateOfBirth;
  double score;

  Student({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.score,
  });

  int get age {
    return DateTime.now().year - dateOfBirth.year;
  }

  void displayInfo() {
    print('ID: $id');
    print('Name: $name');
    print('Date of Birth: ${dateOfBirth.toLocal()}');
    print('Age: $age');
    print('Score: $score');
  }
}
