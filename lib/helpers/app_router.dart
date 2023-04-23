import 'package:flutter/material.dart';
import 'package:google_maps/presentations/screens/login_screen.dart';
import 'package:google_maps/presentations/screens/map_screen.dart';
import 'package:google_maps/presentations/screens/otp_screen.dart';

import '../constant/strings.dart';

class AppRouter {
  Route? generatRoute(RouteSettings setting) {
    switch (setting.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
    }
    return null;
  }
}
