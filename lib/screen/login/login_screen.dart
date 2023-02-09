import 'package:flutter/material.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/navigator/middle_ware/login_guard.dart';
import 'package:flota/styles/theme_dimens.dart';
import 'package:flota/util/keys.dart';
import 'package:flota/viewmodel/login/login_viewmodel.dart';
import 'package:flota/widget/general/status_bar.dart';
import 'package:flota/widget/general/styled/flota_button.dart';
import 'package:flota/widget/general/styled/flota_input_field.dart';
import 'package:flota/widget/general/styled/flota_progress_indicator.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  navigationType: NavigationType.popAllAndPush,
  middlewares: [
    LoginGuard,
  ],
)
class LoginScreen extends StatefulWidget {
  static const String routeName = RouteNames.loginScreen;

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

@visibleForTesting
class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.animated(
        isDarkStyle: theme.isDarkTheme,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.background,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(ThemeDimens.padding16),
              child: Column(
                children: [
                  Container(height: ThemeDimens.padding16),
                  Text(
                    'Login',
                    style: theme.coreTextTheme.titleNormal,
                    textAlign: TextAlign.center,
                  ),
                  Container(height: ThemeDimens.padding32),
                  Text(
                    'Just fill in some text. There is no validator for the login',
                    style: theme.coreTextTheme.labelButtonSmall,
                  ),
                  Container(height: ThemeDimens.padding32),
                  FlotaInputField(
                    key: Keys.emailInput,
                    enabled: !viewModel.isLoading,
                    onChanged: viewModel.onEmailUpdated,
                    hint: 'Email',
                  ),
                  Container(height: ThemeDimens.padding16),
                  FlotaInputField(
                    key: Keys.passwordInput,
                    enabled: !viewModel.isLoading,
                    onChanged: viewModel.onPasswordUpdated,
                    hint: 'Password',
                  ),
                  Container(height: ThemeDimens.padding16),
                  if (viewModel.isLoading) ...[
                    const FlotaProgressIndicator.light(),
                  ] else ...[
                    FlotaButton(
                      key: Keys.loginButton,
                      isEnabled: viewModel.isLoginEnabled,
                      text: 'Login',
                      onClick: viewModel.onLoginClicked,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
