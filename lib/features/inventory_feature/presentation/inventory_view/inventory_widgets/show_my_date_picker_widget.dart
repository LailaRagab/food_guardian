import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/colors.dart';
import 'custom_date_picker.dart';

class ShowMyDatePickerWidget extends StatefulWidget {
  const ShowMyDatePickerWidget({super.key, required this.onDateSelected});

  final ValueChanged<DateTime> onDateSelected;

  @override
  State<ShowMyDatePickerWidget> createState() => _ShowMyDatePickerWidgetState();
}

class _ShowMyDatePickerWidgetState extends State<ShowMyDatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CustomDatePicker(
      onTap: () async {
        selectedDate = await showDatePicker(
                context: context,
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      colorScheme:
                          ColorScheme.light(primary: AppColors.kPrimary),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors
                              .kRed, // "Cancel" and "OK" button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365))) ??
            selectedDate;

        if (selectedDate != null) {
          setState(() {
            selectedDate = selectedDate;
          });
        }
        ;

        widget.onDateSelected(selectedDate);
      },
      date: selectedDate,
    );
  }
}
