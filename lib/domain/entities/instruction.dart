import 'package:receitas/data/models/step_model.dart';

class Instruction {
  final String? name;
  final List<StepModel> steps;

  Instruction({
    this.name,
    required this.steps,
  });
}
