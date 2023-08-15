class CompletedTaskModel {
  final int id;
  final String name;
  final int difficulty;
  final DateTime completionDate;

  CompletedTaskModel({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.completionDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'difficulty': difficulty,
      'completion_date': completionDate.toIso8601String(),
    };
  }
}
