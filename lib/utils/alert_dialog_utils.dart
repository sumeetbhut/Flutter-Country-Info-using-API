import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogUtils {
  AlertDialogUtils.alertDialog(context, message) {
    _confirmDialog1(context, message);
  }

  AlertDialogUtils.alertDialogWithAction(context, message,isDismissable, onOK) {
    _confirmDialog2(context, message,isDismissable, onOK);
  }

  AlertDialogUtils.alertDialogWithActionOptions(context, message, onNo, onYes) {
    _confirmDialog3(context, message, onNo, onYes);
  }
  AlertDialogUtils.showToast(BuildContext context, String msg){
    _showToast(context, msg);
  }

  Future<bool> _confirmDialog1(BuildContext context, String message) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              new FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<bool> _confirmDialog2(
      BuildContext context, String message, bool isDismissable, void onOK()) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: isDismissable, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              new FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  onOK();
                },
              ),
            ],
          );
        });
  }

  Future<Null> _confirmDialog3(BuildContext context,String message,  void onNo(), void onYes()) {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              new FlatButton(
                child: const Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop();
                  onYes();
                },
              ),
              new FlatButton(
                child: const Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop();
                  onNo();
                },
              ),
            ],
          );
        });
  }
  void _showToast(BuildContext context, String msg) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text(msg, textAlign: TextAlign.center,),
      ));
  }
}
