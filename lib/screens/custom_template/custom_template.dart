import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/controller/base/base_sidebar_controller.dart';
import 'package:mozilit/models/base/sidebar_data.dart';
import 'package:mozilit/network/endpoints.dart';

class CustomTemplate extends ConsumerStatefulWidget {
  const CustomTemplate({super.key});

  @override
  ConsumerState<CustomTemplate> createState() => _CustomTemplateState();
}

class _CustomTemplateState extends ConsumerState<CustomTemplate> {
  final _formKey = GlobalKey<FormState>();

  bool _web = false;
  bool _mac = false;
  bool _windows = false;

  bool _ios = false;
  bool _watch = false;
  bool _android = false;

  String _link = "";
  String _name = "";
  String _category = "";

  final List<DropdownMenuItem<String>> _categoryItems = [];

  _handleSubmit() {}

  _addCategory({required List<Datum> items}) {
    _categoryItems.clear();

    _categoryItems.add(
      const DropdownMenuItem(
        value: "",
        enabled: false,
        child: Text("Select a Value"),
      ),
    );

    for (var ele in items) {
      _categoryItems.add(
        DropdownMenuItem(
          value: ele.categoryName,
          child: Text(ele.categoryName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(getBaseSidebarData(APIEndpoints().baseSidebar));

    _addCategory(items: res.value!.data);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/custom_template.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Create custom template",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "The price and delivery time of custom features may change once we understand exactly what you need.",
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Template name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Template Name",
                          ),
                          onChanged: (text) => _name = text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter template name";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: DropdownButton(
                          value: _category,
                          isExpanded: true,
                          items: _categoryItems,
                          underline: const SizedBox(),
                          onChanged: (option) {
                            setState(() {
                              _category = option!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Link to similar template",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "www.template.com",
                          ),
                          onChanged: (text) => _link = text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter template URL";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Choose platforms for your template",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Desktop",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _web,
                              onChanged: (e) => {
                                setState(() {
                                  _web = !_web;
                                }),
                              },
                            ),
                            const SizedBox(width: 15),
                            const Text("Web"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _mac,
                              onChanged: (e) => {
                                setState(() {
                                  _mac = !_mac;
                                }),
                              },
                            ),
                            const SizedBox(width: 15),
                            const Text("macOS"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _windows,
                              onChanged: (e) => {
                                setState(() {
                                  _windows = !_windows;
                                }),
                              },
                            ),
                            const SizedBox(width: 15),
                            const Text("Windows"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Mobile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _android,
                              onChanged: (e) => {
                                setState(() {
                                  _android = !_android;
                                }),
                              },
                            ),
                            const SizedBox(width: 15),
                            const Text("Android"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _ios,
                              onChanged: (e) => {
                                setState(() {
                                  _ios = !_ios;
                                }),
                              },
                            ),
                            const SizedBox(width: 15),
                            const Text("iOS"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _watch,
                              onChanged: (e) => {
                                setState(() {
                                  _watch = !_watch;
                                }),
                              },
                            ),
                            const SizedBox(width: 15),
                            const Text("watchOS"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _handleSubmit();
                            }
                          },
                          child: const Text("Create Custom Template"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
