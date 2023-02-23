import 'dart:convert';

import 'package:receitas/data/models/step_model.dart';
import 'package:receitas/domain/entities/instruction.dart';

class InstructionModel extends Instruction {
  InstructionModel({
    super.name,
    required super.steps,
  });

  static InstructionModel fromMap(Map<String, dynamic> json) {
    return InstructionModel(
      name: json['name'],
      steps: StepModel.fromMapList(json['steps']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'steps': steps.map((e) => e.toJson()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  static InstructionModel fromJson(String source) =>
      fromMap(json.decode(source));

  //retornar uma lista de instruçoes
  static List<InstructionModel> fromMapList(List<dynamic> json) {
    return json.map((e) => InstructionModel.fromMap(e)).toList();
  }
}
