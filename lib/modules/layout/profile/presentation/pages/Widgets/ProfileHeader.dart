import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utiles/avatar_data.dart';
import '../../../../../Home_screen/update_view/presentation/manager/update_profile_bloc.dart';
import '../../manager/profile_bloc.dart';
class Profileheader extends StatelessWidget {
  const Profileheader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
      builder: (context, updateState) {
        String name = '';
        int avatarIndex = 0;

        if (updateState is GetProfileSuccess) {
          name = updateState.data.name;
          avatarIndex = updateState.data.avatarIndex;
        }

        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, profileState) {
            int favouriteCount = 0;
            int historyCount = 0;

            if (profileState is ProfileLoaded) {
              favouriteCount = profileState.favorites.length;
              historyCount = profileState.histories.length;
            }

            return Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF282A28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: AvatarData.images[avatarIndex].image(),
                      ),

                      const SizedBox(width: 30),

                      Row(
                        children: [
                          _buildStatColumn(
                            '$favouriteCount',
                            'Wish List',
                          ),

                          const SizedBox(width: 40),

                          _buildStatColumn(
                            '$historyCount',
                            'History',
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStatColumn(
      String count,
      String label,
      ) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}