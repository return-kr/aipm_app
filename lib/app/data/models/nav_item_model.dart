import 'package:flutter/material.dart';

class NavItemModel {
  const NavItemModel({
    required this.title,
    required this.sectionId,
    required this.sectionKey,
    this.icon,
  });

  final String title;
  final String sectionId;
  final GlobalKey sectionKey;
  final String? icon;

  NavItemModel copyWith({
    String? title,
    String? sectionId,
    GlobalKey? sectionKey,
    String? icon,
  }) {
    return NavItemModel(
      title: title ?? this.title,
      sectionId: sectionId ?? this.sectionId,
      sectionKey: sectionKey ?? this.sectionKey,
      icon: icon ?? this.icon,
    );
  }

  factory NavItemModel.fromMap(Map<String, dynamic> map) {
    return NavItemModel(
      title: map['title'] ?? '',
      sectionId: map['sectionId'] ?? '',
      sectionKey: GlobalKey(),
      icon: map['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'sectionId': sectionId, 'icon': icon};
  }

  @override
  String toString() {
    return 'NavItemModel(title: $title, sectionId: $sectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is NavItemModel &&
            title == other.title &&
            sectionId == other.sectionId;
  }

  @override
  int get hashCode => Object.hash(title, sectionId);
}
