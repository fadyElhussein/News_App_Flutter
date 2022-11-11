import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String articalurl;
  WebViewScreen({required this.articalurl});
  //  ا  (this) هنا بتعود ان ال articalurl تبع ال class و حطيتوا جوا constractor علشان اول لما استدعيها لازم ابعت articalurl
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:WebView(
        initialUrl: articalurl,
      ),




    );
  }
}
