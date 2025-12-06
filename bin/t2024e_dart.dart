import 'package:t2024e_dart/student.dart';
import 'package:t2024e_dart/t2024e_dart.dart' as t2024e_dart;

void main(List<String> arguments) {
  print('Hello world: ${t2024e_dart.calculate()}!');
  List<Student> clazz = [
    Student(
      id: 'S001',
      name: 'Nguyen Van A',
      dateOfBirth: DateTime(2000, 5, 15),
      score: 8.5,
    ),
    Student(
      id: 'S002',
      name: 'Tran Thi B',
      dateOfBirth: DateTime(1999, 8, 22),
      score: 6.0,
    ),
    Student(
      id: 'S003',
      name: 'Le Van C',
      dateOfBirth: DateTime(2001, 12, 3),
      score: 4.5,
    ),
  ];
  for (var student in clazz) {
    student.displayInfo();
  }
}
