import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/navigator/middle_ware/analytics_permission_guard.dart';
import 'package:flota/navigator/middle_ware/authentication_guard.dart';
import 'package:flota/styles/theme_dimens.dart';
import 'package:flota/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flota/widget/general/styled/flota_back_button.dart';
import 'package:flota/widget/general/styled/flota_button.dart';
import 'package:flota/widget/general/styled/flota_input_field.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

@GetXRoute(
  middlewares: [
    AuthenticationGuard,
    AnalyticsPermissionGuard,
  ],
)
class TodoAddScreen extends StatefulWidget {
  static const String routeName = RouteNames.todoAddScreen;

  const TodoAddScreen({Key? key}) : super(key: key);

  @override
  TodoAddScreenState createState() => TodoAddScreenState();
}

@visibleForTesting
class TodoAddScreenState extends State<TodoAddScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoAddViewModel>(
      create: getIt,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: FlotaBackButton.light(
            onClick: viewModel.onBackClicked,
          ),
          title: Text(localization.todoAddTitle),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: ScrollConfiguration(
          behavior: ScrollWhenNeededBehavior(),
          child: Scrollbar(
            child: ListView(
              physics: ScrollWhenNeededPhysics(targetPlatform: Theme.of(context).platform),
              padding: const EdgeInsets.all(ThemeDimens.padding16),
              children: [
                FlotaInputField(
                  hint: localization.todoAddInputHint,
                  onChanged: viewModel.onTodoChanged,
                ),
                Container(height: ThemeDimens.padding16),
                FlotaButton(
                  text: localization.generalLabelSave,
                  isEnabled: viewModel.isSaveEnabled,
                  onClick: viewModel.onSaveClicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
