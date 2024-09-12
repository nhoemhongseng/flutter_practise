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

  Widget IconSlideAction(
      {String? caption, Color? color, IconData? icon, VoidCallback? onTap}) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            caption ?? "",
            style: const TextStyle(color: Colors.white),
          ),
          Icon(icon)
        ],
      ),
    );
  }

  Widget _renderItemWidget(context, index) {
    final user = _list[index];
    return Dismissible(
      key: Key(user.getFullName()),
      background: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconSlideAction(
            caption: 'Archive',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () {},
          ),
          IconSlideAction(
            caption: 'Share',
            color: Colors.indigo,
            icon: Icons.share,
            onTap: () {},
          ),
        ],
      ),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              ClipOval(
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
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
