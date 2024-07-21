import 'package:flutter/services.dart';

void exitApp() async {
  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
