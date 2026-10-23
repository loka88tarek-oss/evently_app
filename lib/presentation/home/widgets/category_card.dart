import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
   
    required this.isSelected, required this.categoryEnum, this.isAll=false, required this.onSelect,
  });
final CategoryEnum? categoryEnum;
final Function(CategoryEnum?) onSelect;
final bool isAll;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Row(spacing: 4,
          children: [
            Icon( isAll? Icons.border_all_outlined:
               categoryEnum?.getIcon, color: isSelected ? Colors.white : theme.shadowColor),
            Text(isAll?l10n.all:
              categoryEnum?.getTitle(context)??'',
              style: AppTextStyles.styleS16W500(
                color: isSelected ? Colors.white : theme.highlightColor,
              ),
            ),
          ],
        ),
        onSelected: (value) {
          onSelect(categoryEnum);
          
        },
      
        selected: isSelected,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: theme.dividerColor),
          borderRadius: BorderRadius.circular(46),
        ),
        selectedColor: theme.shadowColor,
        backgroundColor: theme.splashColor,
        showCheckmark: false,
      ),
    );
  }
}
