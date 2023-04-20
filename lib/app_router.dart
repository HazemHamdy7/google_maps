import 'package:flutter/material.dart';
import 'package:google_maps/presentations/screens/login_screen.dart';

import 'constant/strings.dart';

class AppRouter {
  Route? generatRoute(RouteSettings setting) {
    switch (setting.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
    return null;
  }
}
