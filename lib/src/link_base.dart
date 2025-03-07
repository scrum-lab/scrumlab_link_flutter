import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

/// Wraps a linkable element around child, opening the provided URL as a String
class Link extends StatelessWidget {
  final Widget child;
  final String url;
  final VoidCallback? onError;

  /// In case the URL is not openable (i.e., scheme is not supported in your device), it won't launch the URL and call the onError callback if provided.
  /// Otherwise, the URL will be launched within the app
  const Link({
    Key? key,
    required this.url,
    required this.child,
    this.onError,
  }) : super(key: key);

  void _launch(String url) async {
    if (await Launcher.canLaunchUrl(url as Uri)) {
      await Launcher.canLaunchUrl(url as Uri);
    } else {
      if (onError != null) {
        onError!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launch(url),
      child: child,
    );
  }
}
