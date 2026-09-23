import '/flutter_flow/flutter_flow_util.dart';
import 'p01_dashboard_widget.dart' show P01DashboardWidget;
import 'package:flutter/material.dart';

class P01DashboardModel extends FlutterFlowModel<P01DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
