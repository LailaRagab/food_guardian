import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/colors.dart';
import 'custom_date_picker_text_field.dart';

class CustomShowMyDatePickerWidget extends StatefulWidget {
  const CustomShowMyDatePickerWidget({super.key, required this.onDateSelected});

  final ValueChanged<DateTime> onDateSelected;

  @override
  State<CustomShowMyDatePickerWidget> createState() =>
      _CustomShowMyDatePickerWidgetState();
}

class _CustomShowMyDatePickerWidgetState
    extends State<CustomShowMyDatePickerWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return CustomDatePickerTextField(
      date: selectedDate,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                colorScheme: ColorScheme.light(primary: AppColors.kPrimary),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.kRed,
                  ),
                ),
              ),
              child: child!,
            );
          },
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );

        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });

          widget.onDateSelected(pickedDate);
        }
      },
    );
  }
}
