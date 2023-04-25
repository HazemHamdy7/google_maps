import 'package:url_launcher/url_launcher.dart';

import 'custom_snakbar.dart';

Future<void> lacnchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnakBar(context, 'Cannot lanch $url');
    }
  }
}
