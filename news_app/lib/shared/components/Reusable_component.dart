import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/modules/WebViewScreen/WebViewScreen.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget defulttextformfiled({
  TextEditingController? controller,
  Color? TextColor,
  backgroundoftextformfield,
  required keyboardType,
  bool obscureText = false,
  required String text,
  Icon? prefixIcon,
  Icon? suffixIcon,
  GestureTapCallback? onTap,
  Function(String)? onChanged,
  required String? Function(String?) validator,
}) =>
    TextFormField(
      cursorColor: Colors.deepOrange,
      style: TextStyle(
        color: TextColor,
      ),
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        fillColor: backgroundoftextformfield,
        filled: true,
        labelText: text,
        contentPadding: const EdgeInsets.all(25.0),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );

void navigatTo(context, {required Widget_ScreenGoTo}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget_ScreenGoTo,
      ),
    );

Widget ArticalesBulitIteam(article, context) => InkWell(
      onTap: () {
        navigatTo(context,
            Widget_ScreenGoTo: WebViewScreen(articalurl: article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              child: Center(
                child: Image.network(
                  ('${article['urlToImage']}'),
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.no_photography_sharp,
                    size: 60,
                    color: NewsCubit.get(context).isDark
                        ? Colors.white70
                        : Colors.black87,
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null)
                      return child;
                    else
                      return CircularProgressIndicator(
                        color: Colors.deepOrangeAccent,
                      );
                  },
                ),
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${article['title']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget LoadingAnimation({required Color LoadingAnimationColor}) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
              color: LoadingAnimationColor, size: 40),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Loading...',
          style: TextStyle(
            color: LoadingAnimationColor,
          ),
        ),
      ],
    );

Widget ArticalBulider(List, context) => List.length > 0
    ? ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            ArticalesBulitIteam(List[index], context),
        separatorBuilder: (context, index) => Container(
          height: 2.0,
          color: Colors.grey,
        ),
        itemCount: List.length,
      )
    : LoadingAnimation(
        LoadingAnimationColor:
            NewsCubit.get(context).isDark ? Colors.white : Colors.black87,
      );
