import 'package:flutter/material.dart';
import 'package:myapp/feature/home/widgets/datetime_custom_text.dart';

import '../../../product/core/utils/date_time_utils.dart';

class DateTimeHeaderText extends StatelessWidget {
  const DateTimeHeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final getFormattedDateTime = DateTimeUtils.getFormattedDateTime();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DatetimeCustomText(text: getFormattedDateTime),
        ],
      ),
    );
  }
}
