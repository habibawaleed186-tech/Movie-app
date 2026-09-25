import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/modules/layout/profile/presentation/pages/Widgets/history_view.dart';
import 'package:movie_app/modules/layout/profile/presentation/pages/Widgets/watch_list_view.dart';

import '../../manager/profile_bloc.dart';

class ProfileTabsWidget extends StatefulWidget {
  const ProfileTabsWidget({super.key});

  @override
  State<ProfileTabsWidget> createState() => _ProfileTabsWidgetState();
}

class _ProfileTabsWidgetState extends State<ProfileTabsWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFFF6BD00),
            indicatorWeight: 4.0,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.list,
                  color: Color(0xFFF6BD00),
                  size: 35,
                ),
                text: 'Watch List',
              ),
              Tab(
                icon: Icon(
                  Icons.folder,
                  color: Color(0xFFF6BD00),
                  size: 35,
                ),
                text: 'History',
              ),
            ],
          ),

          Expanded(
            child: Container(
              color: Colors.black,
              child: TabBarView(
                controller: _tabController,
                children: [

                  // =========================
                  // Watch List
                  // =========================

                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoaded) {
                        if (state.favorites.isEmpty) {
                          return Center(
                            child: Image.asset(
                              'assets/images/Empty 1.png',
                              width: 120,
                              height: 120,
                            ),
                          );
                        }

                        return WatchListView(
                          movies: state.favorites,
                        );
                      }

                      if (state is ProfileError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),

                  // =========================
                  // History
                  // =========================

                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoaded) {
                        if (state.histories.isEmpty) {
                          return const Center(
                            child: Text(
                              'No History Found',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }

                        return HistoryView(
                          movies: state.histories,
                        );
                      }

                      if (state is ProfileError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}