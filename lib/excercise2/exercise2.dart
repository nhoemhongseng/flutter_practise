import 'package:flutter/material.dart';
import 'package:test1/excercise2/user_repository.dart';

import 'user.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  final UserRepository _userRepository = UserRepositoryImpl();
  List<User> _list = [];

  @override
  void initState() {
    super.initState();
    _userRepository.getUserList().then((users) => {
          setState(() {
            _list = users;
          })
        });
  }

  Widget _renderItemWidget(context, index) {
    final user = _list[index];
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                user.avatar ?? "",
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.getFullName(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email ?? "",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: _list.isEmpty
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                itemCount: _list.length,
                itemBuilder: _renderItemWidget,
              ),
      ),
    ));
  }
}
