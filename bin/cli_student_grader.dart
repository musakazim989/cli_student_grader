import 'dart:io';

const String appTitle = "Student Grader v1.0";

final Set<String> availableSubjects = {'Math', 'Science', 'English', 'History'};

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
        print('Enter student name (Add record):');
        String? name = stdin.readLineSync();
        students.add({
          'name': name,
          "scores": [],
          'subjects': {...availableSubjects},
          'bonus': null,
          'comment': null,
        });
        print("Student '$name' added successfully.");
        break;
      case '2':
        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]['name']}");
        }
        int? studentIndex;
        while (true) {
          print('Select student number to record score:');
          String? studentChoice = stdin.readLineSync();
          studentIndex = int.tryParse(studentChoice ?? '') ?? -1;

          if (studentIndex < 1 || studentIndex > students.length) {
            print("Invalid student number. Please try again.");
            continue;
          } else {
            break;
          }
        }

        var subjectList = availableSubjects.toList();
        for (int i = 0; i < subjectList.length; i++) {
          while (true) {
            print('Enter Score for ${subjectList[i]}: ');
            String? scoreInput = stdin.readLineSync();
            double score = double.tryParse(scoreInput ?? '') ?? -1;
            if (score < 0 || score > 100) {
              print("Invalid score. Please enter a value between 0 and 100.");
              continue;
            } else {
              students[studentIndex - 1]['scores'].add(score);
              break;
            }
          }
        }
        print('Scores recorded for ${students[studentIndex - 1]['name']}');
        break;

      case '3':
        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]['name']}");
        }

        int? studentIndex;
        while (true) {
          print('Select student number to add bonus points:');
          String? studentChoice = stdin.readLineSync();
          studentIndex = int.tryParse(studentChoice ?? '') ?? -1;
          if (studentIndex < 1 || studentIndex > students.length) {
            print("Invalid student number. Please try again.");
            continue;
          } else {
            break;
          }
        }

        while (true) {
          print('Enter bonus points (0-10): ');
          String? bonusInput = stdin.readLineSync();
          int bonusValue = int.tryParse(bonusInput ?? '') ?? 0;
          if (bonusValue < 0 || bonusValue > 10) {
            print(
              "Invalid bonus points. Please enter a value between 0 and 10.",
            );
            continue;
          } else {
            int? existingBonus = students[studentIndex - 1]['bonus'];

            students[studentIndex - 1]['bonus'] ??= bonusValue;
            if (existingBonus != null) {
              print('Student already has bounus points.');
            } else {
              print(
                'Bonus points added for ${students[studentIndex - 1]['name']}',
              );
            }
            break;
          }
        }

        break;
      case '4':
        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]['name']}");
        }

        int? studentIndex;
        while (true) {
          print('Select student number to add comment:');
          String? studentChoice = stdin.readLineSync();
          studentIndex = int.tryParse(studentChoice ?? '') ?? -1;
          if (studentIndex < 1 || studentIndex > students.length) {
            print("Invalid student number. Please try again.");
            continue;
          } else {
            break;
          }
        }

        print('Enter comment for ${students[studentIndex - 1]['name']}:');
        String? comment = stdin.readLineSync();
        students[studentIndex - 1]['comment'] = comment;
        String display =
            students[studentIndex - 1]['comment']?.toUpperCase() ??
            "No comment provided";
        print(display);

        break;
      case '5':
        for (var student in students) {
          var tags = [
            student["name"],
            "${student["scores"].length} scores",
            if (student["bonus"] != null) "⭐ Has Bonus",
          ];
          print(tags.join(" | "));
        }
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
    ;
    ;
  } while (shouldExit == false);
}
