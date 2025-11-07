import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_list_page_widget.dart' show ChatListPageWidget;
import 'package:flutter/material.dart';

class ChatListPageModel extends FlutterFlowModel<ChatListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Tab_bar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    tabBarModel.dispose();
  }
}
