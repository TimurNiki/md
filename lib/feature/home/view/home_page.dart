
import 'package:flutter/material.dart';
import 'package:myapp/feature/statistics/view/statistics_page.dart';
import '../../../product/core/constants/app_constants.dart';
import '../../mood/view/mood_screen.dart';
import '../widgets/home_widget_import.dart';
import 'mixin/calendar_mixin.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with CalendarMixin<HomePage>
    {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const DateTimeHeaderText(),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_month, color: Color(0xFFBCBCBF)),
              onPressed: () => showCalendarBottomSheet(context),
            ),
          ],
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: Container(
              width: 350,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(35)),
              ),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: [
                  TabItem(
                    title: AppStrings.moodDiary,
                    iconPath: AppSvg.book,
                  ),
                  TabItem(
                    title: AppStrings.statistics,
                    iconPath: AppSvg.stats,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [MoodScreen(), StatisticsPage()],
        ),
      ),
    );
  }
}
