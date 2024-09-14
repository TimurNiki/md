import 'package:flutter/material.dart';

/// This class holds all the constant strings used throughout the application.
/// By centralizing string definitions, we ensure consistency across the app and
/// make localization easier. Each constant string is categorized by its
/// usage context within the application.
///
/// Categories include:
/// - **Home Tabbar**: Strings for tab names on the home screen.
/// - **Mood Diary Screen**: Strings related to mood diary entries and options.
/// - **Moods**: Names of different moods that users can select.
/// - **Submit Button**: Strings related to submission feedback and actions.
/// - **Calendar**: Strings for calendar-related features such as date and time formats.

@immutable
final class AppStrings {
  const AppStrings._();

  // Home Tabbar
  static const String moodDiary = "Дневник настроения";
  static const String statistics = "Статистика";

  /// Mood Diary Screen
  static const String howDoYouFeel = "Что чувствуешь?";
  static const String stressLevel = "Уровень стресса";
  static const String selfesteem = "Самооценка";
  static const String notes = "Заметки";
  static const String save = "Сохранить";
  static const String low = "Низкий";
  static const String high = "Высокий";
  static const String unconfidence = "Неуверенность";
  static const String confidence = "Уверенность";
  static const String enterNote = "Введите заметку";

  // Moods
  static const String happiness = "Радость";
  static const String fear = "Страх";
  static const String madness = "Бешенство";
  static const String sadness = "Грусть";
  static const String calmness = "Спокойствие";
  static const String strength = "Сила";

  // Submit button
  static const String success = "Успешно";
  static const String successful = "Ваше настроение успешно записано.";
  static const String ok = "OK";
  static const String pleaseSelectMood =
      "Пожалуйста, выберите хотя бы одно настроение.";

  // Calendar
  static const String locale = 'ru_RU';
  static const String dateFormat = 'd MMMM';
  static const String timeFormat = 'HH:mm';
  static const String today = 'Сегодня';
  static const String monthView = 'Просмотр месяца';
  static const String yearView = 'Просмотр года';
}

final class AppSvg {
  AppSvg._();
  static const String book = 'assets/icons/book.svg';
  static const String stats = 'assets/icons/statistics.svg';
}

final class TextStyles {
  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: Color(0xFF4C4C69),
  );
}
