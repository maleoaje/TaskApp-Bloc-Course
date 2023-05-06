// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String id;
  final String desc;
  final String date;
  bool? isDone;
  bool? isFavorite;
  bool? isDeleted;

  Task({
    this.isDeleted,
    this.isDone,
    this.isFavorite,
    required this.date,
    required this.title,
    required this.id,
    required this.desc,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? id,
    String? desc,
    String? date,
    bool? isDone,
    bool? isFavorite,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'desc': desc,
      'date': date,
      'isDone': isDone,
      'isFavorite': isFavorite,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      desc: map['desc'] as String,
      id: map['id'] as String,
      date: map['date'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  List<Object?> get props =>
      [title, id, desc, date, isDone, isDeleted, isFavorite];
}
