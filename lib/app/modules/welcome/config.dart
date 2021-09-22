import 'package:flutter/material.dart';

class Config {
  static SliverGridDelegateWithMaxCrossAxisExtent delegate = SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3 / 2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
  );
}
