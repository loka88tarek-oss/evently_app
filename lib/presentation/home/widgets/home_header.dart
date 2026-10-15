import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/presentation/home/widgets/category_card.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(AppBar().preferredSize.width, 119);
}

class _HomeHeaderState extends State<HomeHeader> {
  CategoryEnum? selectedCategory;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  spacing: 5,
                  children: [
                    Text(
                      "Welcome Back ✨",
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: theme.hoverColor,
                      ),
                    ), //TODO:localization
                    Text(
                      "Name",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.highlightColor,
                      ),
                    ), //TODO:localization
                  ],
                ),
                Spacer(),
                Row(
                  spacing: 4,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.wb_sunny_outlined,
                        color: theme.shadowColor,
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      height: 38,
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: theme.shadowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "EN",
                          style: AppTextStyles.styleS14W400(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16,),
            Expanded(
              child:
              ListView(
                scrollDirection: .horizontal,
                children:[CategoryCard(onSelect: (p0){
                  selectedCategory=null;
                  setState(() {
                    
                  });
                },isSelected: selectedCategory==null, categoryEnum: null,isAll: true,),... CategoryEnum.values.map((e)=>CategoryCard(onSelect: (p0) {
                  selectedCategory=p0;
                  setState(() {
                    
                  });
                  
                },categoryEnum: e, isSelected: selectedCategory==e))]
              
                ,
              )
            ),
          ],
        ),
      ),
    );
  }

}
