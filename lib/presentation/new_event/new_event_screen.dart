import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/home/widgets/category_card.dart';
import 'package:evently_app/presentation/new_event/widgets/categories_section.dart';
import 'package:evently_app/widgets/custom_text_form_feild.dart';
import 'package:evently_app/widgets/filled_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});
  static const String routeName = "/newEventScreen";

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  DateTime? eventSelectedDate;
  TimeOfDay? eventSelectedTime;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text("Add event")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        children: [
          CategoriesSection(isDark: isDark),
          CustomTextFormFeild(hintText: "Event Title", title: "Title"),
          CustomTextFormFeild(
            hintText: "Event Description....",
            title: "Description",
            maxLines: 5,
          ),
          SizedBox(height: 16),
          Row(
            spacing: 4,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: Theme.of(context).shadowColor,
              ),
              Text(
                "Event Date",
                style: AppTextStyles.styleS16W500(
                  color: Theme.of(context).highlightColor,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2040),
                    initialDate: eventSelectedDate ?? DateTime.now(),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      eventSelectedDate = selectedDate;
                    });
                  }
                },
                child: Text(
                  eventSelectedDate != null
                      ? DateFormat.yMMMMd().format(eventSelectedDate!)
                      : "Choose date",

                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).shadowColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            spacing: 4,
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: Theme.of(context).shadowColor,
              ),
              Text(
                "Event Time",
                style: AppTextStyles.styleS16W500(
                  color: Theme.of(context).highlightColor,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: eventSelectedTime ?? TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    setState(() {
                      eventSelectedTime = selectedTime;
                    });
                  }
                },
                child: Text(
                  (eventSelectedTime?.format(context) ?? "Choose time")
                      .toString(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).shadowColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .05),
          FilledButtonWidget(
            text: "Add Event",
            onPressed: () {},
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
