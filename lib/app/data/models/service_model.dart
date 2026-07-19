import 'package:flutter/material.dart';

/// ===============================================================
/// SERVICE MODEL
/// ---------------------------------------------------------------
/// Model representing a service offered by the company.
/// ===============================================================

class ServiceModel {
  const ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.icon,
    this.features = const [],
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      icon: map['icon'] as IconData,
      features: List<String>.from(map['features'] ?? const []),
    );
  }

  final String description;
  final List<String> features;
  final IconData icon;
  final int id;
  final String image;
  final String title;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ServiceModel &&
            other.id == id &&
            other.title == title &&
            other.description == description &&
            other.image == image &&
            other.icon == icon &&
            other.features.length == features.length;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      description,
      image,
      icon,
      Object.hashAll(features),
    );
  }

  @override
  String toString() {
    return 'ServiceModel(id: $id, title: $title)';
  }

  ServiceModel copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
    IconData? icon,
    List<String>? features,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      icon: icon ?? this.icon,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'icon': icon,
      'features': features,
    };
  }
}
