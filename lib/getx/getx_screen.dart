import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/getx/coin_model.dart';
import 'package:test1/getx/controller.dart';
import 'package:test1/getx/getx_item_widget.dart';

class GetXScreen extends StatefulWidget {
  const GetXScreen({super.key});

  @override
  State<GetXScreen> createState() => _GetXScreenState();
}

class _GetXScreenState extends State<GetXScreen> {
  final Controller _controller = Get.find();

  @override
  void initState() {
    _controller.errorMsg.listen((msg) {
      if (msg.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_controller.errorMsg.value)));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Obx(() => _buildBody()),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        elevation: 2.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("GetX"),
      );

  Widget _buildBody() {
    return _controller.loading.value ? _buildLoading() : _buildList();
  }

  Widget _buildLoading() =>
      const Center(child: CircularProgressIndicator.adaptive());

  Widget _buildList() {
    return ListView.separated(
        itemCount: _controller.listData.length,
        separatorBuilder: (context, index) => Container(
              color: Colors.black45,
              height: 0.5,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
            ),
        itemBuilder: ((context, index) {
          CoinModel model = _controller.listData[index];
          return GetXItemWidget(model: model);
        }));
  }
}
