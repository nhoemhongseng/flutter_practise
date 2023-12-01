import 'package:flutter/material.dart';
import 'package:test1/exercise/local_storange_manager.dart';
import 'package:test1/exercise/user_model.dart';

class ExerciseOne extends StatefulWidget {
  const ExerciseOne({super.key});

  @override
  State<ExerciseOne> createState() => _ExersiceOneState();
}

class _ExersiceOneState extends State<ExerciseOne> {
  final localManager = LocalStorageManager.instance;
  List<UserModel> _users = [];

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _saveUser() async {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      return;
    }
    final isSave = await localManager.putUser(
      UserModel(
        name: _nameController.text,
        email: _emailController.text,
      ),
    );

    if (isSave) {
      _nameController.clear();
      _emailController.clear();
    }
  }

  void _getUser() async {
    final users = await localManager.getUsers();
    setState(() {
      _users = users;
    });
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.all(16),
        filled: true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Local Storage"),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: _inputDecoration("Input User"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emailController,
                decoration: _inputDecoration("Input Email"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _saveUser,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                child: const Text("Save User"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _getUser,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                child: const Text("Get User"),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final item = _users[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            item.name ?? "",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            item.email ?? "",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
