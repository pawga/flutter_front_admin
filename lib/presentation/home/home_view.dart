import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final controller = Get.find<HomeLogic>();
  final state = Get
      .find<HomeLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(36.0),
        child: AppBar(
          backgroundColor: const Color(0xFFD9D9D9),
          title: const Align(
              alignment: Alignment.center,
              child: Text(
                'Testing the resource server',//.tr,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )),
          actions: <Widget>[
            PopupMenuButton(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28.0))),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              itemBuilder: (context) =>
              [
                PopupMenuItem(
                  value: 0,
                  child: Text('Settings'.tr),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    'Help'.tr,
                    style: const TextStyle(
                      color: Color(0xFF0085D0),
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case 1:
                  //Get.toNamed(Routes.categories);
                    print("Selected Settings");
                    break;
                  default:
                    print("Click unknown");
                    break;
                }
              },
            )
          ],
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formStateKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 512,
                            child: TextFormField(
                              controller: controller.requestController,
                              decoration: const InputDecoration(
                                hintText: 'Request URL', //.tr,
                                labelText: 'Request URL', //.tr,
                              ),
                              validator: (value) => _validateRequest(value!),
                              onSaved: (value) => {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 32.0,
                      ),
                      Obx(() {
                        return SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile<int>(
                                key: const ValueKey<String>('DIO'),
                                title: const Text('DIO'),
                                toggleable: true,
                                value: 0,
                                groupValue: controller.selectedIdx.value,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectedIdx.value = value;
                                  }
                                },
                              ),
                              RadioListTile<int>(
                                key: const ValueKey<String>('Http Client'),
                                title: const Text('Http Client'),
                                toggleable: true,
                                value: 1,
                                groupValue: controller.selectedIdx.value,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectedIdx.value = value;
                                  }
                                },
                              ),
                              RadioListTile<int>(
                                key: const ValueKey<String>('Http Pro Client'),
                                title: const Text('Http Pro Client'),
                                toggleable: true,
                                value: 2,
                                groupValue: controller.selectedIdx.value,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectedIdx.value = value;
                                  }
                                },
                              ),
                              ElevatedButton(
                                child: const Text('Perform'), //Text('Perform'.tr)
                                onPressed: () => _submitRequest(),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 798,
                  child: Obx(() {
                    return Text(controller.answer.value);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submitRequest() {
    if (_formStateKey.currentState!.validate()) {
      controller.submitRequest();
    }
  }

  String? _validateRequest(String value) {
    return null;
  }
}
