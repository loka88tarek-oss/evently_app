import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:evently_app/presentation/home/home_screen.dart';
import 'package:evently_app/presentation/home/widgets/category_card.dart';
import 'package:evently_app/presentation/new_event/widgets/categories_section.dart';
import 'package:evently_app/presentation/provider/new_event_provider.dart';
import 'package:evently_app/widgets/app_bar_icon_widget.dart';
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
    final l10n = AppLocalizations.of(context)!;
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
            appBar: AppBar(
              leading: AppBarIconWidget(
                containerChild: Icon(Icons.arrow_back_ios_new_outlined),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(HomeScreen.routeName);
                },
              ),
              title: Text(l10n.addEvent),
              centerTitle: true,
            ),
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
                        return l10n.eventTitleRequired;
                      }
                      return null;
                    },
                    controller: titleController,
                    hintText: l10n.eventTitle,
                    title: l10n.title,
                  ),
                  CustomTextFormFeild(
                    controller: descriptionController,
                    hintText: l10n.eventDescription,
                    title: l10n.description,
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
                        l10n.eventDate,
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
                              : l10n.chooseDate,

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
                        l10n.eventTime,
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
                                  l10n.chooseTime)
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
                    text: l10n.addEvent,
                    onPressed: () async {
                      bool isValidate = _formState.currentState!.validate();
                      if (isValidate) {
                        if (providerRead.eventSelectedDate == null) {
                          SnakeBarHelper.errorSnakeBar(
                            context,
                            l10n.dateRequired,
                          );
                          return;
                        }
                        if (providerRead.eventSelectedTime == null) {
                          SnakeBarHelper.errorSnakeBar(
                            context,
                            l10n.timeRequired,
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
                              l10n.eventAdded,
                            );
                            Navigator.of(context).pop(true);
                          }
                        } on Exception catch (e) {
                          if (context.mounted) {
                            SnakeBarHelper.errorSnakeBar(context, e.toString());
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
