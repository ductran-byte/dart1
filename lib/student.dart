import 'package:sqlite3/sqlite3.dart';

class Student {
  String id;
  String name;
  double mathScore;
  double engScore;

  Student({
    required this.id,
    required this.name,
    required this.mathScore,
    required this.engScore,
  });

  double get averageScore => (mathScore + engScore) / 2;

  String get rank {
    if (averageScore >= 8.0) return 'Giỏi';
    if (averageScore >= 6.5) return 'Khá';
    if (averageScore >= 5.0) return 'Trung Bình';
    return 'Yếu';
  }

  @override
  String toString() {
    return 'ID: $id | Tên: $name | ĐTB: $averageScore | Xếp loại: $rank';
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'mathScore': mathScore,
      'engScore': engScore,
    };
  }

  factory Student.fromMap(Map<String, Object?> map) {
    return Student(
      id: map['id'] as String,
      name: map['name'] as String,
      mathScore: map['mathScore'] as double,
      engScore: map['engScore'] as double,
    );
  }
}
