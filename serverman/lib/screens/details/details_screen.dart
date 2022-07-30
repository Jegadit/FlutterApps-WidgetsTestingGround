import 'package:flutter/material.dart';
import 'package:serverman/models/movie.dart';
import 'package:serverman/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: movies[0]),
    );
  }
}
