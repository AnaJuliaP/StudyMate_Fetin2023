import 'package:flutter/material.dart';
import 'package:studymate_project_fetin/core/app_export.dart';
import 'package:studymate_project_fetin/widgets/custom_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                theme.colorScheme.onErrorContainer,
                theme.colorScheme.primaryContainer,
              ],
            ),
          ),
          child: Container(
            width: getHorizontalSize(427),
            padding: getPadding(
              left: 104,
              right: 104,
              bottom: 200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomImageView(
                  imagePath: 'assets/images/img_signupman.png',
                  height: getSize(201),
                  width: getSize(201),
                  margin: getMargin(
                    top: 87,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      top: 16,
                    ),
                    child: Text(
                      "ORGANIZE-SE ",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 17,
                    top: 36,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgSwitch,
                        height: getVerticalSize(24),
                        width: getHorizontalSize(26),
                        margin: getMargin(
                          top: 11,
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(97),
                        margin: getMargin(
                          left: 12,
                          bottom: 4,
                        ),
                        child: Text(
                          "RENDA MAIS NO \nSEU DIA A DIA",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge!.copyWith(
                            height: 1.30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 18,
                    top: 41,
                    right: 29,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgLogin,
                        height: getVerticalSize(23),
                        width: getHorizontalSize(26),
                        margin: getMargin(
                          top: 11,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: getHorizontalSize(131),
                          margin: getMargin(
                            left: 13,
                            bottom: 3,
                          ),
                          child: Text(
                            "ENTRE E COMECE SUA \nROTINA ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelLarge!.copyWith(
                              height: 1.30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 18,
                    top: 41,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgRefresh,
                        height: getVerticalSize(23),
                        width: getHorizontalSize(26),
                        margin: getMargin(
                          top: 11,
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(82),
                        margin: getMargin(
                          left: 13,
                          bottom: 3,
                        ),
                        child: Text(
                          "RENOVE SEUS HÁBITOS ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge!.copyWith(
                            height: 1.30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          onTap: () {
            Navigator.pushNamed(context, '/MenuScreen');
          },
          width: getHorizontalSize(274),
          text: "COMEÇAR".toUpperCase(),
          margin: getMargin(
            left: 77,
            right: 76,
            bottom: 40,
          ),
        ),
      ),
    );
  }
}
