import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatelessWidget {
  const UrlLauncher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url Launcher"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final url = 'https://twitter.com';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC:
                        false, //for ios on browser launch/make true to launch url in webview
                    forceWebView: true, //launch url in webview android
                    enableJavaScript: true, //launch url in webview android
                  );
                }
              },
              child: Text("Open Url in browser"),
            ),
            ElevatedButton(
              onPressed: () async {
                final phoneNumber = '+919876543210';
                final urlPhone = 'tel:$phoneNumber';
                final urlSMS = 'sms:$phoneNumber';

                if (await canLaunch(urlPhone)) {
                  await launch(urlPhone);
                }
              },
              child: Text("Open Phone number"),
            ),
            ElevatedButton(
              onPressed: () async {
                final toEmail = 'imran@gmail.com';
                final subject = 'new email subject';
                final message='hell this is new message from url launcher https://twitter.com';

                final url = 'mailto:$toEmail?subject=$subject&body=${Uri.encodeFull(message)}';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              child: Text("open in draft email"),
            ),
          ],
        ),
      ),
    );
  }
}
