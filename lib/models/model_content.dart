import 'package:flutter/material.dart';

class Model {
  final int id;
  final String title;
  final String images;
  final String location;
  final String location2;
  final String rating;
  final String review;

  Model(
    this.id,
    this.title,
    this.images,
    this.location,
    this.location2,
    this.rating,
    this.review,
  );

  static List<Model> getModel() {
    List<Model> models = [
      Model(
        1,
        "Gunung Bromo",
        "assets/background.png",
        "Malang",
        "Jawa Timur",
        "4.6",
        "(897) Reviews",
      ),
      Model(
        2,
        "Pantai Parangtritis",
        "assets/pantai.png",
        "Yogyakarta",
        "Jawa Timur",
        "4.5",
        "(1000) Reviews",
      ),
      Model(
        3,
        "Candi Prambanan",
        "assets/candi.png",
        "Yogyakarta",
        "Jawa Timur",
        "4.7",
        "(700) Reviews",
      ),
      Model(
        4,
        "Curug Luewi Hajo",
        "assets/curug.png",
        "Bogor",
        "Jawa Barat",
        "4.8",
        "(1120) Reviews",
      ),
    ];
    return models;
  }
}
