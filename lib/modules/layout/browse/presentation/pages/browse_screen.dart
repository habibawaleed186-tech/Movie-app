import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/assets/app_assets.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/core/routes/app_routes.dart';

import '../cubit/browse_cubit.dart';
import '../cubit/browse_state.dart';
import 'widgets/genre_chip.dart';
import 'widgets/movie_card.dart';

class BrowseScreen extends StatefulWidget {
  final bool showBackButton;

  const BrowseScreen({super.key, this.showBackButton = true});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  static const List<String> _genres = <String>[
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Music',
    'Musical',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Thriller',
    'War',
    'Western',
  ];

  @override
  void initState() {
    super.initState();

    final BrowseCubit cubit = context.read<BrowseCubit>();
    if (cubit.state is BrowseInitial) {
      cubit.fetchMoviesByGenre(cubit.selectedGenre);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 12.h),
            BlocBuilder<BrowseCubit, BrowseState>(
              builder: (context, state) {
                return _buildGenreChips(_resolveSelectedGenre(state));
              },
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: BlocBuilder<BrowseCubit, BrowseState>(
                builder: (context, state) {
                  return _buildStateContent(state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      child: Row(
        children: [
          if (widget.showBackButton) ...[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                AppAssets.arrow,
                colorFilter: const ColorFilter.mode(
                  AppColor.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ],
      ),
    );
  }

  String _resolveSelectedGenre(BrowseState state) {
    final String? stateGenre = switch (state) {
      BrowseLoading(selectedGenre: final genre) => genre,
      BrowseSuccess(selectedGenre: final genre) => genre,
      BrowseError(selectedGenre: final genre) => genre,
      _ => null,
    };

    return stateGenre ?? context.read<BrowseCubit>().selectedGenre;
  }

  Widget _buildGenreChips(String selectedGenre) {
    return SizedBox(
      height: 46.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _genres.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final genre = _genres[index];

          return GenreChip(
            label: genre,
            isSelected: genre == selectedGenre,
            onTap: () {
              context.read<BrowseCubit>().fetchMoviesByGenre(genre);
            },
          );
        },
      ),
    );
  }

  Widget _buildStateContent(BrowseState state) {
    if (state is BrowseLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColor.yellow),
      );
    }

    if (state is BrowseError) {
      return _buildErrorContent(state);
    }

    if (state is BrowseSuccess) {
      return _buildMoviesGrid(state);
    }

    return const SizedBox.shrink();
  }

  Widget _buildErrorContent(BrowseError state) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColor.red,
              size: 40,
            ),
            SizedBox(height: 12.h),
            Text(
              state.message,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.white, fontSize: 14.sp),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.yellow,
                foregroundColor: AppColor.dark,
              ),
              onPressed: () {
                context
                    .read<BrowseCubit>()
                    .fetchMoviesByGenre(state.selectedGenre);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesGrid(BrowseSuccess state) {
    if (state.movies.isEmpty) {
      return Center(
        child: Text(
          'No movies found for "${state.selectedGenre}".',
          style: TextStyle(color: AppColor.text, fontSize: 14.sp),
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.7,
      ),
      itemCount: state.movies.length,
      itemBuilder: (context, index) {
        final movie = state.movies[index];

        return MovieCard(
          movie: movie,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.movieDetails,
              arguments: movie.id,
            );
          },
        );
      },
    );
  }
}