import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../Home_screen/update_view/presentation/manager/update_profile_bloc.dart';
import '../manager/profile_bloc.dart';
import 'Widgets/ProfileActions.dart';
import 'Widgets/ProfileHeader.dart';
import 'Widgets/ProfileTabsWidget.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();

    GetIt.I<ProfileBloc>().add(
      GetProfileDataEvent(),
    );

    GetIt.I<UpdateProfileBloc>().add(
      const GetProfileEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A28),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: GetIt.I<ProfileBloc>(),
          ),

          BlocProvider.value(
            value: GetIt.I<UpdateProfileBloc>(),
          ),
        ],
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Profileheader(),

            Profileactions(),

            const ProfileTabsWidget(),
          ],
        ),
      ),
    );
  }
}