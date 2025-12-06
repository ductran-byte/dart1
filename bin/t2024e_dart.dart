import 'package:t2024e_dart/student.dart';
import 'dart:io';
import 'package:t2024e_dart/database_helper.dart';

void main() {
  final dbHelper = DatabaseHelper();

  while (true) {
    print('\n================ QUẢN LÝ SINH VIÊN ================');
    print('1. Xem danh sách sinh viên');
    print('2. Thêm sinh viên mới');
    print('3. Xóa sinh viên theo ID');
    print('4. Tìm kiếm sinh viên theo tên');
    print('0. Thoát');
    stdout.write('Chọn chức năng (0-4): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        var allStudents = dbHelper.getAllStudents();
        showAllStudents(allStudents);
        break;

      case '2':
        addStudent(dbHelper);
        break;

      case '3':
        removeStudent(dbHelper);
        break;

      case '4':
        findStudent(dbHelper);
        break;

      case '0':
        print('Đã thoát chương trình. Tạm biệt!');
        dbHelper.close();
        return;

      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn lại!');
    }
  }
}

void showAllStudents(List<Student> list) {
  print('\n--- DANH SÁCH LỚP ---');
  if (list.isEmpty) {
    print('Danh sách đang trống!');
  } else {
    for (var sv in list) {
      print(sv.toString());
    }
    print('Tổng số: ${list.length} sinh viên');
  }
}

void addStudent(DatabaseHelper dbHelper) {
  stdout.write('\nNhập ID: ');
  String id = stdin.readLineSync() ?? '';

  stdout.write('Nhập Tên: ');
  String name = stdin.readLineSync() ?? '';

  stdout.write('Điểm Toán: ');
  double math = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  stdout.write('Điểm Anh: ');
  double eng = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  Student newSv = Student(id: id, name: name, mathScore: math, engScore: eng);

  dbHelper.insertStudent(newSv);
  print('✅ Thêm thành công!');
}

void removeStudent(DatabaseHelper dbHelper) {
  stdout.write('\nNhập ID sinh viên cần xóa: ');
  String id = stdin.readLineSync() ?? '';

  bool success = dbHelper.deleteStudent(id);
  if (success) {
    print('✅ Xóa thành công sinh viên có ID: $id');
  } else {
    print('❌ Không tìm thấy sinh viên với ID: $id');
  }
}

void findStudent(DatabaseHelper dbHelper) {
  stdout.write('\nNhập tên sinh viên cần tìm: ');
  String name = stdin.readLineSync() ?? '';

  List<Student> foundStudents = dbHelper.searchStudentsByName(name);
  if (foundStudents.isEmpty) {
    print('❌ Không tìm thấy sinh viên nào với tên chứa: "$name"');
  } else {
    print('\n--- KẾT QUẢ TÌM KIẾM ---');
    for (var sv in foundStudents) {
      print(sv.toString());
    }
    print('Tổng số: ${foundStudents.length} sinh viên');
  }
}
