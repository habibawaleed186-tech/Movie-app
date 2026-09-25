import 'package:flutter/material.dart';
import 'package:movie_app/modules/layout/profile/presentation/pages/Widgets/movie.dart';

import '../../../data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/profile_entity.dart';
import 'package:movie_app/modules/layout/profile/presentation/pages/Widgets/movie.dart';

class WatchListView extends StatelessWidget {
  final List<ProfileEntity> movies;

  const WatchListView({
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