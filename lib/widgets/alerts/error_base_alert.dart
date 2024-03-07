import 'package:flutter/material.dart';

import 'package:trufi/translations/trufi_base_localizations.dart';
import 'package:trufi/widgets/alerts/base_build_alert.dart';
import 'package:trufi/widgets/screen/screen_helpers.dart';

class ErrorAlert extends StatelessWidget {
  static Future<void> showError({
    required BuildContext context,
    String? title,
    required String error,
  }) async {
    await showTrufiDialog<void>(
      context: context,
      onWillPop: false,
      builder: (_) {
        return ErrorAlert(
          title: title,
          error: error,
        );
      },
    );
  }

  final String? title;
  final String error;
  const ErrorAlert({
    Key? key,
    this.title,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = TrufiBaseLocalization.of(context);
    final theme = Theme.of(context);
    return BaseBuildAlert(
      title: Text(
        title ?? localization.commonError,
        style: TextStyle(
          color: theme.colorScheme.error,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      content: Text(error),
      actions: const [OKButton()],
    );
  }
}
