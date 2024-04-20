import 'package:flutter/material.dart';
import '../widgets/cdialog.dart';

Future<bool> showAlertDialog(BuildContext context) async {
  var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text("提示信息"),
            content: const Text("确定要删除吗？"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("确定")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("取消")),
            ]);
      });
  return result ?? false;
}

Future<String> showSimpleDialog(BuildContext context) async {
  var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(title: const Text("请选择语言"), children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, "chinese"),
            child: const Text("汉语"),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, "english"),
            child: const Text("英语"),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, "japanese"),
            child: const Text("日语"),
          ),
        ]);
      });
  return result ?? "";
}

Future<String> modelButtonSheet(BuildContext context) async {
  var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              ListTile(
                  title: const Text("日语"),
                  onTap: () {
                    Navigator.pop(context, "japanese");
                  }),
              const Divider(),
              ListTile(
                  title: const Text("英语"),
                  onTap: () {
                    Navigator.pop(context, "english");
                  }),
              const Divider(),
              ListTile(
                  title: const Text("德语"),
                  onTap: () {
                    Navigator.pop(context, "german");
                  }),
              const Divider(),
              ListTile(
                  title: const Text("中文"),
                  onTap: () {
                    Navigator.pop(context, "chinese");
                  }),
            ],
          ),
        );
      });
  return result ?? "";
}

Future<String> showCDialog(BuildContext context,
    {required String title, required String content, Function()? close}) async {
  var result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CDialog(
          title: title,
          content: content,
          close: () {
            if (close != null) {
              close();
            }
            Navigator.pop(context, "click close button");
          },
        );
      });

  return result ?? "";
}
