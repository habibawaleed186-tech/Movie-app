import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/layout/search/presentation/pages/widgets/search_movie_card.dart';

import '../../../../../core/assets/app_assets.dart';
import '../../../../../core/config/app_color.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../profile/data/model/profile_model.dart';
import '../../../profile/presentation/manager/profile_bloc.dart';
import '../manager/search_bloc.dart';
import '../manager/search_event.dart';
import '../manager/search_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(color: AppColor.white),
              onChanged: (value) {
                context.read<SearchBloc>().add(SearchMoviesEvent(value));
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.primaryColor,
                hintText: 'Search',
                hintStyle: const TextStyle(color: AppColor.white),
                prefixIcon: const Icon(Icons.search, color: AppColor.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
              ),
            ),

            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchSuccess) {
                    return GridView.builder(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      itemCount: state.movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 8.h,
                        mainAxisExtent: 279.h,
                      ),
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];

                        return SearchMovieCard(
                          movie: movie,
                          onTap: () {
                            final profileMovie =
                            ProfileModel(
                              id: movie.id,
                              rating: movie.rating,
                              coverImage: movie.coverImage,
                              backgroundImage: movie.coverImage, );
                            GetIt.I<ProfileBloc>().add( AddHistoryEvent(profileMovie), );
                            Navigator.pushNamed( context, AppRoutes.movieDetails, arguments: movie.id, );
                          },);
                      },
                    );
                  }

                  return Center(
                    child: Image.asset(
                      AppAssets.empty,
                      width: 200.w,
                      height: 200.h,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
