

import 'package:flutter/material.dart';



   showToast(BuildContext ctx,String toastmsg){
    ScaffoldMessenger.of(ctx).showSnackBar( SnackBar(
      content: Text(toastmsg),
    ));
  }
