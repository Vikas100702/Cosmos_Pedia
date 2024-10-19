import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leadingWidget;
  final String? titleString;
  final Function? onTapFunction;

  const CustomListTile({
    super.key,
    this.leadingWidget,
    this.titleString,
    this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingWidget,
      title: Text(titleString!),
      onTap: (){
        onTapFunction!();
      },
    );
  }
}
