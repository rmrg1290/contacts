
import 'package:flutter/cupertino.dart';

class EmptyState extends StatelessWidget{
  final String message;
  final Icon icon;

  EmptyState({@required this.message, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(message),
          SizedBox(
            width: 20,
          ),
          icon
        ],
      ),
    );
  }
}