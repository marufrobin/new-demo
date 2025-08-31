import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_toaster.dart';

class AppUrlLauncher {
  Future<void> kLaunchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> kEmailLaunchURL(String email) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Partner support needed.',
      }),
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch $emailLaunchUri');
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $launchUri');
    }
  }

  Future<void> openWebsite(String url) async {
    final Uri launchUri = Uri(scheme: 'https', path: url);

    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $launchUri');
    }
  }
}

copyTextToClipboard({
  required String text,
  required BuildContext context,
}) async {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    context.mounted
        ? AppToaster.success(
            message: "Copied to clipboard",
            context: context,
          )
        : null;
  });
}
