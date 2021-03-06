import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final String image;
  final List<String> categories;
  final String description;
  final String coordinators;
  final String prize;
  const TaskModel({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.categories,
    @required this.description,
    @required this.coordinators,
    @required this.prize,
  });
}
