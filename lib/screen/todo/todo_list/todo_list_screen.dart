import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/model/webservice/todo/todo.dart';
import 'package:flota/styles/theme_assets.dart';
import 'package:flota/styles/theme_dimens.dart';
import 'package:flota/util/keys.dart';
import 'package:flota/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flota/widget/general/action/action_item.dart';
import 'package:flota/widget/general/styled/flota_progress_indicator.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:flota/widget/todo/todo_row_item.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

@visibleForTesting
class TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoListViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        final errorKey = viewModel.errorKey;
        return Scaffold(
          backgroundColor: theme.colorsTheme.background,
          appBar: AppBar(
            title: Text(localization.todoTitle),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            centerTitle: context.isIOSTheme,
            backgroundColor: theme.colorsTheme.primary,
            actions: [
              ActionItem(
                key: Keys.downloadAction,
                svgAsset: ThemeAssets.downloadIcon(context),
                onClick: viewModel.onDownloadClicked,
                color: theme.colorsTheme.appBarAction,
              ),
              ActionItem(
                key: Keys.addAction,
                svgAsset: ThemeAssets.addIcon(context),
                onClick: viewModel.onAddClicked,
                color: theme.colorsTheme.appBarAction,
              ),
            ],
          ),
          body: Builder(
            builder: (context) {
              if (viewModel.isLoading) return Center(child: FlotaProgressIndicator(dark: theme.isLightTheme));
              if (errorKey != null) {
                return Center(
                  child: Text(
                    localization.getTranslation(errorKey),
                    style: theme.coreTextTheme.bodyNormal.copyWith(color: theme.colorsTheme.errorText),
                  ),
                );
              }

              return Scrollbar(
                child: StreamBuilder<List<Todo>>(
                  stream: viewModel.dataStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (data == null) return Container();
                    if (data.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(ThemeDimens.padding32),
                          child: Text(
                            localization.todoEmptyState,
                            textAlign: TextAlign.center,
                            style: theme.coreTextTheme.bodyNormal,
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return TodoRowItem(
                          title: item.title,
                          value: item.completed,
                          onChanged: (value) => viewModel.onTodoChanged(id: item.id, value: value),
                        );
                      },
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: ThemeDimens.padding16),
                        child: Container(
                          height: 1,
                          color: theme.colorsTheme.primary.withOpacity(0.1),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
