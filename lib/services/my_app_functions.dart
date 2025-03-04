import 'package:flutter/material.dart';
import 'package:soko_user/services/asset_manager.dart';
import 'package:soko_user/widgets/subtitle_text.dart';
import 'package:soko_user/widgets/title_text.dart';

class MyAppFunctions {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required String subtitle,
    bool isError = true,
    required Function fct,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Visibility(
                visible: !isError,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: SubtitleTextWidget(
                    label: "Cancel",
                    color: Colors.green,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: SubtitleTextWidget(
                  label: "OK",
                  color: Colors.red,
                ),
              ),
            ],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  isError ? AssetManager.error : AssetManager.warning,
                  height: 60,
                  width: 60,
                ),
                SizedBox(height: 10),
                TitleTextWidget(label: subtitle),
              ],
            ),
          );
        });
  }
}
