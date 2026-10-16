import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/presentation/home/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key, required this.isDark});
  final bool isDark;
  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  CategoryEnum selectedCategory = CategoryEnum.birthday;

  @override
  Widget build(BuildContext context) {
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
              image: AssetImage(selectedCategory.getImage(widget.isDark)),
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
                      selectedCategory = p0;
                      setState(() {});
                    }
                  },
                  categoryEnum: e,
                  isSelected: e == selectedCategory,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
