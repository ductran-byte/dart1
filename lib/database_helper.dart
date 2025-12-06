import 'package:sqlite3/sqlite3.dart';
import 'student.dart';

class DatabaseHelper {
  late final Database dbHelper;
  static const dbPath = 'app.db';

  DatabaseHelper() {
    dbHelper = sqlite3.open(dbPath);
    _createTables();
  }

  void _createTables() {
    dbHelper.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        mathScore REAL NOT NULL,
        engScore REAL NOT NULL
      );
    ''');
  }

  List<Student> getAllStudents() {
    final ResultSet resultSet = dbHelper.select('SELECT * FROM students;');
    return resultSet.map((row) => Student.fromMap(row)).toList();
  }

  void insertStudent(Student student) {
    final stmt = dbHelper.prepare(
      'INSERT INTO students (id, name, mathScore, engScore) VALUES (?, ?, ?, ?);',
    );
    stmt.execute([
      student.id,
      student.name,
      student.mathScore,
      student.engScore,
    ]);
    stmt.dispose();
  }

  bool deleteStudent(String id) {
    final stmt = dbHelper.prepare('DELETE FROM students WHERE id = ?;');
    stmt.execute([id]);
    stmt.dispose();
    return true;
  }

  List<Student> searchStudentsByName(String name) {
    final stmt = dbHelper.prepare('SELECT * FROM students WHERE name LIKE ?;');
    final ResultSet resultSet = stmt.select(['%$name%']);
    stmt.dispose();
    return resultSet.map((row) => Student.fromMap(row)).toList();
  }

  void close() {
    dbHelper.dispose();
  }
}
