import 'package:flutter/material.dart';

import '../colors.dart';

class SettingItem extends StatelessWidget {
  final String icon;
  final String name;
  final String version;
  final Function onPressed;
  final bool versionApp;
  final bool isCompleted;

  SettingItem(this.icon, this.name, this.onPressed,
      {this.versionApp = false, this.isCompleted = false, this.version = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        color: Colors.transparent,
        height: 30.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                icon,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                name,
                style: TextStyle(fontSize: 15),
              ),
            ),
            if (isCompleted)
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.check_outlined,
                    color: Colors.green,
                  )),
            if (versionApp)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  version,
                  style: TextStyle(
                    fontSize: 15,
                    color: Job2goPalette.blackDisabled,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: name != "App Version"
                  ? Icon(
                      Icons.arrow_forward_ios,
                      color: Job2goPalette.blackInactive,
                      size: 14,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
