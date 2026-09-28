import 'package:flutter/material.dart';

import '../../../domain/entities/profile_entity.dart';
import 'movie.dart';

class HistoryView extends StatelessWidget {
  final List<ProfileEntity> movies;

  const HistoryView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        childAspectRatio :0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Movie(
          movie: movies[index],
        );
      },
    );
  }
}