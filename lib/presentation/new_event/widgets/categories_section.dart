import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/presentation/home/widgets/category_card.dart';
import 'package:evently_app/presentation/provider/new_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    NewEventProvider providerListen = Provider.of<NewEventProvider>(
      context,
      listen: true,
    );
    NewEventProvider providerRead = Provider.of<NewEventProvider>(
      context,
      listen: false,
    );
    Size size = MediaQuery.of(context).size;
    return Column(
      spacing: 16,
      children: [
        Container(
          width: double.infinity,
          height: size.height * .2,
          decoration: BoxDecoration(
            border: BoxBorder.all(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(
                providerListen.selectedCategory.getImage(isDark),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(
          width: double.infinity,
          height: size.height * .05,
          child: ListView(
            scrollDirection: .horizontal,
            children: [
              ...CategoryEnum.values.map(
                (e) => CategoryCard(
                  onSelect: (p0) {
                    if (p0 != null) {
                      providerRead.changeCategory(p0);
                    }
                  },
                  categoryEnum: e,
                  isSelected: e == providerListen.selectedCategory,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
