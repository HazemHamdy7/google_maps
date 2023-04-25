// import 'package:flutter/material.dart';
// import 'package:google_maps/presentations/screens/login_screen.dart';
// import 'package:google_maps/presentations/screens/map_screen.dart';
// import 'package:google_maps/presentations/screens/otp_screen.dart';

// import '../constant/strings.dart';

// class AppRouter {
//   Route? generatRoute(RouteSettings setting) {
//     switch (setting.name) {
//       case loginScreen:
//         return MaterialPageRoute(builder: (_) => LoginScreen());

//       case otpScreen:
//         return MaterialPageRoute(builder: (_) => const OtpScreen());
//       case mapScreen:
//         return MaterialPageRoute(builder: (_) => const MapScreen());
//     }
//     return null;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bussniss_logic/maps/maps_cubit.dart';
import '../bussniss_logic/phone_auth/phone_auth_cubit.dart';
import '../constant/strings.dart';
import '../data/reop/maps_repo.dart';
import '../data/webservices/places_web_serviecs.dart';
import '../presentations/screens/login_screen.dart';
import '../presentations/screens/map_screen.dart';
import '../presentations/screens/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                MapsCubit(MapsRepository(PlacesWebServices())),
            child: const MapScreen(),
          ),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
    }
    return null;
  }
}
