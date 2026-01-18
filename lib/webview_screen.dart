import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:media/packages/flutter_close_app.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  final String _url = "https://naturalcalm.site/";

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return FlutterCloseAppPage(
      onCloseFailed: () {
          Fluttertoast.showToast(
            msg: 'اضغط مرة أخرى للخروج من التطبيق',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(widget._url)),
                onLoadStop: (controller, url) {
                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
              if (_isLoading)
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
