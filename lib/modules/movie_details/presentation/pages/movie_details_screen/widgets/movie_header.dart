import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';

import '../../../../../../core/assets/app_assets.dart';
import '../../../../../../core/config/app_color.dart';
import '../../../../../layout/profile/data/model/profile_model.dart';
import '../../../../../layout/profile/presentation/manager/profile_bloc.dart';

class MovieHeader extends StatelessWidget {
  final MovieEntity movie;

  const MovieHeader({super.key, required this.movie});

  String get _backgroundImage {
    if (movie.coverImage.isNotEmpty) {
      return movie.coverImage;
    }
    return movie.backgroundImage;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 645.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 645.h,
            width: double.infinity,
            child: _backgroundImage.isNotEmpty &&
                    _backgroundImage.startsWith('http')
                ? Image.network(
                    _backgroundImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppAssets.doctor,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(AppAssets.doctor, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.white.withValues(alpha: 0.1),
                    AppColor.Dark.withValues(alpha: 0.7),
                    AppColor.Dark.withValues(alpha: 1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.h,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppAssets.play),
            ),
          ),
          Positioned(
            top: 20.h,
            left: 16.w,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                AppAssets.arrow,
                colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
              ),
            ),
          ),
          Positioned(
            top: 20.h,
            right: 16.w,
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                bool isFavorite = false;

                if (state is ProfileLoaded) {
                  isFavorite = state.isFavorite;
                }

                return IconButton(
                  onPressed: () {
                    if (movie.id == null) return;

                    final profileMovie = ProfileModel(
                      id: movie.id,
                      rating: movie.rating,
                      coverImage: movie.coverImage,
                      backgroundImage: movie.backgroundImage,
                    );

                    if (isFavorite) {
                      context.read<ProfileBloc>().add(
                        RemoveFavoriteEvent(movie.id!),
                      );
                    } else {
                      context.read<ProfileBloc>().add(
                        AddFavoriteEvent(profileMovie),
                      );
                    }
                  },
                  icon: SvgPicture.asset(
                    AppAssets.bookmark,
                    colorFilter: ColorFilter.mode(
                      isFavorite ? AppColor.yellow : AppColor.white,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            )),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.title.isEmpty ? 'Unknown Movie' : movie.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  movie.year == 0 ? '' : '${movie.year}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.text,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
