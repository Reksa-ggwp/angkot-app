import 'package:flutter/material.dart';
import 'package:trufi/blocs/localization/trufi_localization_cubit.dart';
import 'package:trufi/widgets/drawer/menu/trufi_menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleMenuItem extends TrufiMenuItem {
  SimpleMenuItem({
    required WidgetBuilder buildIcon,
    required WidgetBuilder name,
    void Function()? onClick,
  }) : super(
          selectedIcon: buildIcon,
          notSelectedIcon: buildIcon,
          name: name,
          onClick: (context, isSelected) {
            if (onClick != null) onClick();
          },
        );
}

enum DefaultItemsMenu { language }

extension LayerIdsToString on DefaultItemsMenu {
  SimpleMenuItem toMenuItem() {
    final Map<DefaultItemsMenu, SimpleMenuItem> map = {
      DefaultItemsMenu.language: SimpleMenuItem(
          buildIcon: (context) => const Icon(Icons.language),
          name: (context) {
            final List<Locale> values = context
                .findAncestorWidgetOfExactType<MaterialApp>()!
                .supportedLocales
                .toList();
            final currentLocale = Localizations.localeOf(context);
            return DropdownButton<Locale>(
              value: values.firstWhere(
                (value) => value == currentLocale,
              ),
              onChanged: (Locale? value) {
                context.read<TrufiLocalizationCubit>().changeLocale(
                      currentLocale: value,
                    );
              },
              items: values.map((Locale value) {
                return DropdownMenuItem<Locale>(
                  value: value,
                  child: Text(
                    TrufiLocalizationCubit.localeDisplayName(value),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                );
              }).toList(),
            );
          }),

    };

    return map[this]!;
  }
}
