import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:evently_app/presentation/home/widgets/category_card.dart';
import 'package:evently_app/presentation/new_event/widgets/categories_section.dart';
import 'package:evently_app/presentation/provider/new_event_provider.dart';
import 'package:evently_app/widgets/custom_text_form_feild.dart';
import 'package:evently_app/widgets/filled_button_widget.dart';
import 'package:evently_app/widgets/snake_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});
  static const String routeName = "/newEventScreen";

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ChangeNotifierProvider(
      create: (context) => NewEventProvider(),
      child: Builder(
        builder: (ctx) {
          NewEventProvider providerListen = Provider.of<NewEventProvider>(
            ctx,
            listen: true,
          );
          NewEventProvider providerRead = Provider.of<NewEventProvider>(
            ctx,
            listen: false,
          );
          return Scaffold(
            appBar: AppBar(title: Text("Add event")),
            body: Form(
              key: _formState,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                children: [
                  CategoriesSection(isDark: isDark),
                  CustomTextFormFeild(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event title";
                      }
                      return null;
                    },
                    controller: titleController,
                    hintText: "Event Title",
                    title: "Title",
                  ),
                  CustomTextFormFeild(
                    controller: descriptionController,
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
                            initialDate:
                                providerRead.eventSelectedDate ??
                                DateTime.now(),
                          );
                          if (selectedDate != null) {
                            providerRead.changeDate(selectedDate);
                          }
                        },
                        child: Text(
                          providerListen.eventSelectedDate != null
                              ? DateFormat.yMMMMd().format(
                                  providerListen.eventSelectedDate!,
                                )
                              : "Choose date",

                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: Theme.of(context).shadowColor,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).shadowColor,
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
                            initialTime:
                                providerRead.eventSelectedTime ??
                                TimeOfDay.now(),
                          );

                          if (selectedTime != null) {
                            providerRead.changeTime(selectedTime);
                          }
                        },
                        child: Text(
                          (providerListen.eventSelectedTime?.format(context) ??
                                  "Choose time")
                              .toString(),
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: Theme.of(context).shadowColor,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).shadowColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .05),
                  FilledButtonWidget(
                    text: "Add Event",
                    onPressed: () async {
                      bool isValidate = _formState.currentState!.validate();
                      if (isValidate) {
                        if (providerRead.eventSelectedDate == null) {
                          SnakeBarHelper.errorSnakeBar(
                            context,
                            "Date is required!",
                          );
                          return;
                        }
                        if (providerRead.eventSelectedTime == null) {
                          SnakeBarHelper.errorSnakeBar(
                            context,
                            "Time is required!",
                          );
                          return;
                        }
                        try {
                          EventModel event = EventModel(
                            categoryEnum: providerRead.selectedCategory,
                            date: providerRead.getFormattedDate(),
                            title: titleController.text,
                            description: descriptionController.text,
                          );
                          await EventService.addEvent(event);
                          if (context.mounted) {
                            SnakeBarHelper.sucessSnakeBar(
                              context,
                              "Event was added!!",
                            );
                            Navigator.pop(context,true);
                          }
                        } on Exception catch (e) {
                          // TODO
                          if (context.mounted) {
                            SnakeBarHelper.errorSnakeBar(
                              context,
                              e.toString(),
                            );
                          }
                        }
                      }
                    },
                    isLoading: providerListen.isLoading,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
