import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../product/core/constants/app_constants.dart';

class YearlyCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final void Function(DateTime) onDaySelected;

  const YearlyCalendar({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(12, (index) {
        final month = DateTime(focusedDay.year, index + 1);
        return ListTile(
          title: Text(DateFormat('MMMM yyyy', AppStrings.locale).format(month)),
          onTap: () => _showMonthView(context, month),
        );
      }),
    );
  }

  void _showMonthView(BuildContext context, DateTime month) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Container(
                  color: Colors.blueGrey.shade200,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Text(
                        DateFormat('MMMM yyyy', AppStrings.locale)
                            .format(month),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                Expanded(
                  child: TableCalendar(
                    locale: AppStrings.locale,
                    focusedDay: month,
                    firstDay: DateTime(month.year, month.month, 1),
                    lastDay: DateTime(month.year, month.month + 1, 0),
                    selectedDayPredicate: (day) => false,
                    onDaySelected: (selectedDay, focusedDay) {
                      onDaySelected(selectedDay);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
