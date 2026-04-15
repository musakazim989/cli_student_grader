import 'dart:io';

const String appTitle = "Student Grader v1.0";

final Set<String> availableSubjects = {'Math', 'Science', 'English'};

List<Map<String, dynamic>> students = [];

var shouldExit = false;

const menuOptions =
    '''
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:
''';

void main(List<String> arguments) {
  do {
    print(menuOptions);
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        break;
      case '2':
        break;
      case '3':
        break;
      case '4':
        break;
      case '5':
        break;
      case '6':
        break;
      case '7':
        break;
      case '8':
        shouldExit = true;
        print("Exiting $appTitle. Goodbye!");
        break;
      default:
        print("Invalid option. Please try again.");
    }
  } while (shouldExit == false);
}
