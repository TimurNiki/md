import 'package:flutter/material.dart';
import 'package:myapp/product/core/constants/app_constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/yearly_calendar.dart';

mixin CalendarMixin<T extends StatefulWidget> on State<T> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isMonthView = true;

  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;
  bool get isMonthView => _isMonthView;

  void _setFocusedDay(DateTime date) {
    setState(() {
      _focusedDay = date;
    });
  }

  void _setSelectedDay(DateTime date) {
    setState(() {
      _selectedDay = date;
    });
  }

  void _toggleView() {
    setState(() {
      _isMonthView = !_isMonthView;
    });
  }

  void showCalendarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Row(
                        children: [
                          TextButton(
                            child: Text(
                              _isMonthView
                                  ? AppStrings.yearView
                                  : AppStrings.monthView,
                              style: TextStyles.labelTextStyle,
                            ),
                            onPressed: () {
                              setState(() {
                                _toggleView();
                              });
                            },
                          ),
                          TextButton(
                            child: const Text(
                              AppStrings.today,
                              style: TextStyles.labelTextStyle,
                            ),
                            onPressed: () {
                              setState(() {
                                _setSelectedDay(DateTime.now());
                                _setFocusedDay(DateTime.now());
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _isMonthView
                      ? TableCalendar(
                          locale: AppStrings.locale,
                          focusedDay: _focusedDay,
                          firstDay: DateTime(2000),
                          lastDay: DateTime(2100),
                          selectedDayPredicate: (day) =>
                              isSameDay(_selectedDay, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _setSelectedDay(selectedDay);
                              _setFocusedDay(focusedDay);
                            });
                            Navigator.pop(context);
                          },
                          calendarStyle: const CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                          ),
                        )
                      : YearlyCalendar(
                          focusedDay: _focusedDay,
                          onDaySelected: (selectedDay) {
                            setState(() {
                              _setSelectedDay(selectedDay);
                              _setFocusedDay(selectedDay);
                            });
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
