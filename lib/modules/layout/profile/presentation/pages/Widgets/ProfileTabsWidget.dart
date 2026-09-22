import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileTabsWidget extends StatefulWidget {
  const ProfileTabsWidget({super.key});

  @override
  State<ProfileTabsWidget> createState() => _ProfileTabsWidgetState();
}

class _ProfileTabsWidgetState extends State<ProfileTabsWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                icon: Icon(Icons.list,color: Color(0xFFF6BD00),size: 35,),
                text: 'Watch List',
              ),
              Tab(
                icon: Icon(Icons.folder,color: Color(0xFFF6BD00),size: 35,),
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Empty 1.png', width: 120, height: 120),
                      ],
                    ),
                  ),


                  const Center(
                    child: Text(
                      'No History Found',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
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