import 'package:flutter/material.dart';
import 'package:trufi/blocs/theme/theme_cubit.dart';
import 'package:trufi/widgets/drawer/menu/default_item_menu.dart';
import 'package:trufi/widgets/drawer/menu/default_pages_menu.dart';
import 'package:trufi/widgets/drawer/menu/social_media_item.dart';

abstract class TrufiMenuItem {
  final String? id;
  final WidgetBuilder selectedIcon;
  final WidgetBuilder notSelectedIcon;
  final WidgetBuilder name;
  final void Function(BuildContext, bool isSelected) onClick;

  TrufiMenuItem({
    this.id,
    required this.selectedIcon,
    required this.notSelectedIcon,
    required this.name,
    required this.onClick,
  });
  Widget buildItem(BuildContext context, {bool isSelected = false}) {
    final theme = Theme.of(context);
    final backgroundColor =
        ThemeCubit.isDarkMode(theme) ? Color(0xff1b1e37) : Color(0xffD3D5D5);

    return Container(
      color: isSelected ?  backgroundColor : ThemeCubit.isDarkMode(theme) ? Color(0xff212544) : Color(0xffBEC0C0),
      child: ListTile(
        iconColor: ThemeCubit.isDarkMode(theme) ? Color(0xffBEC0C0) : Color(0xff212544),
        leading: isSelected ? selectedIcon(context) : notSelectedIcon(context),
        title: name(context),
        selected: isSelected,
        onTap: () => onClick(context, isSelected),
      ),
    );
  }

  static Widget buildName(BuildContext context, String name, {Color? color}) {
    return Text(
      name,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: color,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}

List<List<TrufiMenuItem>> defaultMenuItems({
  required UrlSocialMedia? defaultUrls,
}) {
  return [
    DefaultPagesMenu.values.map((menuPage) => menuPage.toMenuPage()).toList(),
    [
      if (defaultUrls != null && defaultUrls.existUrl)
        defaultSocialMedia(defaultUrls),
      ...DefaultItemsMenu.values
          .map((menuPage) => menuPage.toMenuItem())
          .toList(),
    ]
  ];
}
