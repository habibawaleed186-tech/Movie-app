import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/core/assets/app_assets.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/modules/layout/movies_model.dart';
import 'package:movie_app/modules/layout/widgets/background.dart';

class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({super.key});

  @override
  State<HomeScreenLayout> createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                      child: Container(
                        color: AppColor.Dark,
                      ),
                    ),
                    Background(image: moviesList[_currentIndex].image),
                    SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Image.asset(
                            AppAssets.HeaderText,
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 15),
                          CarouselSlider.builder(
                            itemCount: moviesList.length,
                            itemBuilder: (context, index, realIndex) {
                              final movie = moviesList[index];
                              final isActive = index == _currentIndex;

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
                                            image: AssetImage(movie.image),
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
                    Text(
                      'Action',
                      style: TextStyle(
                        color: AppColor.white,
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
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    final movie = moviesList[index];
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
                                image: AssetImage(movie.image),
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
  }
}
