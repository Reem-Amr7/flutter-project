import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/dashboard/modules/model/entity/user_model.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userModel.name ?? 'XXX',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              userModel.address ?? 'XXX',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 22, 134, 37),
              ),
            ),
          ),
        ],
      ),
    );
  }
}