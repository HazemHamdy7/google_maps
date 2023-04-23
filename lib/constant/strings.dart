const loginScreen = '/';
const otpScreen = '/otp_screen';
const mapScreen = '/map_screen';
String apiKey = 'AIzaSyAmMVF_LSWqNeuN4zjyfUe5B10RiHPxpaI';

String generateCountryFlag() {
  //! This function to build the country flag
  String countryCode = 'eg';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}
