import 'package:flutter/material.dart';
import 'package:flota/styles/theme_assets.dart';
import 'package:flota/styles/theme_colors.dart';
import 'package:flota/util/keys.dart';
import 'package:flota/widget/general/action/action_item.dart';
import 'package:flota/widget/provider/data_provider_widget.dart';

class FlotaBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const FlotaBackButton.light({
    required this.onClick,
    this.fullScreen = false,
    Key? key,
  })  : isLight = true,
        super(key: key);

  const FlotaBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
    Key? key,
  })  : isLight = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ActionItem(
        key: Keys.backButton,
        svgAsset: getCorrectIcon(context),
        color: isLight ? ThemeColors.white : theme.colorsTheme.primary,
        onClick: onClick,
      ),
    );
  }

  String getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return ThemeAssets.closeIcon(context);
    }
    return ThemeAssets.backIcon(context);
  }
}
