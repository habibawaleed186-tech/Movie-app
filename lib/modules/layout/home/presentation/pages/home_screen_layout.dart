import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/core/assets/app_assets.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/modules/layout/home/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/modules/layout/home/data/repository/movie_repository_impl.dart';
import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';
import 'package:movie_app/modules/layout/home/domain/usecase/get_movies_use_case.dart';
import 'package:movie_app/modules/layout/home/presentation/manger/home_cubit.dart';
import 'package:movie_app/modules/layout/home/presentation/manger/home_state.dart';

class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({super.key});

  @override
  State<HomeScreenLayout> createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {
  late final HomeCubit _homeCubit;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit(
      GetMoviesUseCase(
        MovieRepositoryImpl(
          MovieRemoteDataSource(),
        ),
      ),
    );
    _homeCubit.fetchMovies();
  }

  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeCubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 40),
                    const SizedBox(height: 12),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _homeCubit.fetchMovies,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          final movies = (state is HomeSuccess) ? state.movies : const <MovieEntity>[];

          if (movies.isEmpty) {
            return const Center(
              child: Text('No movies available', style: TextStyle(color: Colors.white)),
            );
          }

          final actionMovies = movies.where((movie) {
            final normalizedGenres = movie.genres
                .map((genre) => genre.trim().toLowerCase())
                .toList();
            return normalizedGenres.contains('action');
          }).toList();

          final carouselMovies = movies;
          final activeIndex = _currentIndex.clamp(0, carouselMovies.length - 1);

          return Scaffold(
            backgroundColor: AppColor.Dark,
            body: Container(
              color: AppColor.Dark,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 520,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: _BackdropImage(
                              imageUrl: carouselMovies[activeIndex].backgroundImage.isNotEmpty
                                  ? carouselMovies[activeIndex].backgroundImage
                                  : carouselMovies[activeIndex].coverImage,
                            ),
                          ),
                          SafeArea(
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Image.asset(
                                  AppAssets.headerText,
                                  height: 40,
                                  width: MediaQuery.of(context).size.width * 0.50,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 15),
                                CarouselSlider.builder(
                                  itemCount: carouselMovies.length,
                                  itemBuilder: (context, index, realIndex) {
                                    final movie = carouselMovies[index];
                                    final isActive = index == activeIndex;
                                    final cover = movie.coverImage.isNotEmpty
                                        ? movie.coverImage
                                        : movie.backgroundImage;

                                    return Center(
                                      child: AnimatedScale(
                                        duration: const Duration(milliseconds: 300),
                                        scale: isActive ? 1.0 : 0.86,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 220,
                                              height: 320,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  image: cover.isNotEmpty
                                                      ? NetworkImage(cover)
                                                      : const AssetImage(AppAssets.poster)
                                                          as ImageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                                boxShadow: isActive
                                                    ? [
                                                        BoxShadow(
                                                          color: Colors.black.withValues(alpha: 0.35),
                                                          blurRadius: 18,
                                                          offset: const Offset(0, 12),
                                                        ),
                                                      ]
                                                    : null,
                                              ),
                                            ),
                                            Positioned(
                                              top: 12,
                                              left: 12,
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withValues(alpha: 0.55),
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    RatingBarIndicator(
                                                      rating: movie.rating,
                                                      itemCount: 1,
                                                      itemSize: 12,
                                                      itemBuilder: (context, index) {
                                                        return const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        );
                                                      },
                                                      unratedColor:
                                                          Colors.white.withValues(alpha: 0.35),
                                                      direction: Axis.horizontal,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      movie.rating.toStringAsFixed(1),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: 380,
                                    viewportFraction: 0.62,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(seconds: 3),
                                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.25,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 330,
                                  child: Image.asset(
                                    AppAssets.watchNow,
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Action',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See More',
                              style: TextStyle(color: AppColor.yellow),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: AppColor.yellow,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: actionMovies.length,
                        itemBuilder: (context, index) {
                          final movie = actionMovies[index];
                          final poster = movie.coverImage.isNotEmpty
                              ? movie.coverImage
                              : movie.backgroundImage;

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: poster.isNotEmpty
                                          ? NetworkImage(poster)
                                          : const AssetImage(AppAssets.poster)
                                              as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(alpha: 0.55),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          movie.rating.toStringAsFixed(1),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BackdropImage extends StatelessWidget {
  final String imageUrl;

  const _BackdropImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColor.Dark,
        image: DecorationImage(
          image: imageUrl.isNotEmpty
              ? NetworkImage(imageUrl)
              : const AssetImage(AppAssets.poster) as ImageProvider,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.55),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
