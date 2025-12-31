import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({required this.url, super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri.uri(Uri.parse(widget.url)),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
          ),
          // Positioned(
          //   top: 75, // отступ от верхнего края
          //   left: 16,
          //   child: InkWell(
          //     onTap: () async {
          //       if (await webViewController.canGoBack()) {
          //         webViewController.goBack();
          //       } else {
          //         Navigator.pop(context);
          //       }
          //     },
          //     child: ClipRRect(
          //       borderRadius: BorderRadiusGeometry.circular(25),

          //       child: Container(
          //         color: Colors.black54,
          //         child: const Icon(
          //           Icons.arrow_back,
          //           color: Colors.white,
          //           size: 40,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
