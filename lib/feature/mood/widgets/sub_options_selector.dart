import 'package:flutter/material.dart';
import 'package:myapp/product/core/constants/app_constants.dart';

class SubOptionsSelector extends StatelessWidget {
  final Set<String> selectedMoods;
  final Set<String> selectedSubOptions;
  final ValueChanged<String> onSubOptionSelected;

  const SubOptionsSelector({
    super.key,
    required this.selectedMoods,
    required this.selectedSubOptions,
    required this.onSubOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: selectedMoods.expand((mood) {
        return getSubOptionsForMood(mood).map((subMood) {
          final isSubOptionSelected = selectedSubOptions.contains(subMood);

          return ChoiceChip(
            label: Text(subMood),
            selected: isSubOptionSelected,
            selectedColor: Colors.orange,
            backgroundColor: Colors.white,
            onSelected: (selected) => onSubOptionSelected(subMood),
          );
        }).toList();
      }).toList(),
    );
  }
}

List<String> getSubOptionsForMood(String mood) {
  switch (mood) {
    case AppStrings.happiness:
      return [
        'Возбуждение',
        'Восторг',
        'Игривость',
        'Наслаждение',
        'Осознание',
        'Смелость',
        'Удовольствие',
        'Чувственность',
        'Энергичность',
        'Экстравагантность',
        'Ожидание'
      ];
    case AppStrings.fear:
      return [
        'Тревога',
        'Ужас',
        'Нервозность',
        'Беспокойство',
        'Испуг',
        'Паника',
        'Досада',
        'Неуверенность',
        'Паранойя',
        'Печаль'
      ];
    case AppStrings.madness:
      return [
        'Ярость',
        'Вспыльчивость',
        'Волнение',
        'Гнев',
        'Злость',
        'Агрессия',
        'Ненависть',
        'Обострение',
        'Раздражение'
      ];
    case AppStrings.sadness:
      return [
        'Меланхолия',
        'Депрессия',
        'Тоска',
        'Опустошение',
        'Разочарование',
        'Скука',
        'Печаль',
        'Безнадежность',
        'Грусть'
      ];
    case AppStrings.calmness:
      return [
        'Умиротворение',
        'Расслабление',
        'Согласие',
        'Стабильность',
        'Гармония',
        'Уверенность',
        'Невозмутимость',
        'Спокойствие',
        'Тишина'
      ];
    case AppStrings.strength:
      return [
        'Мощь',
        'Уверенность',
        'Решительность',
        'Энергия',
        'Выносливость',
        'Твердые намерения',
        'Могущество',
        'Непоколебимость',
        'Влияние',
        'Решимость'
      ];
    case "Удивление":
      return [
        'Шок',
        'Неверие',
        'Потрясение',
        'Изумление',
        'Очарование',
        'Восхищение',
        'Озадаченность',
        'Загадка',
        'Неожиданность',
        'Интрига'
      ];
    case "Отвращение":
      return [
        'Неприязнь',
        'Презрение',
        'Отвращение',
        'Недовольство',
        'Брезгливость',
        'Раздражение',
        'Сопротивление',
        'Отчуждение',
        'Дискомфорт',
        'Антипатия'
      ];
    case "Вина":
      return [
        'Сожаление',
        'Раскаяние',
        'Страх перед наказанием',
        'Неловкость',
        'Обвинение',
        'Стыд',
        'Неправильность',
        'Ответственность',
        'Признание',
        'Виновность'
      ];
    case "Смущение":
      return [
        'Стыд',
        'Неловкость',
        'Замешательство',
        'Смущение',
        'Непонимание',
        'Засрамленность',
        'Растерянность',
        'Путаница',
        'Застенчивость'
      ];
    default:
      return [];
  }
}
