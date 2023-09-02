import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/custom_template/platform_button.dart';
import 'package:mozilit/controller/base/base_sidebar_controller.dart';
import 'package:mozilit/controller/custom_template/platform_controller.dart';
import 'package:mozilit/models/base/sidebar_data.dart';
import 'package:mozilit/network/endpoints.dart';
import 'package:mozilit/network/requests.dart';

class CustomTemplate extends ConsumerStatefulWidget {
  const CustomTemplate({super.key});

  @override
  ConsumerState<CustomTemplate> createState() => _CustomTemplateState();
}

class _CustomTemplateState extends ConsumerState<CustomTemplate> {
  final _formKey = GlobalKey<FormState>();

  String _link = "";
  String _name = "";
  String _category = "";

  final List<DropdownMenuItem<String>> _categoryItems = [];

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

  _handleSubmit() {
    ApiRequests().postRequest(
      url: APIEndpoints().customTemplate,
      payload: {
        "name": _name,
        "user_id": "1",
        "platform_id": ["2"],
        "category_id": ["16"],
        "similar_template": _link,
      },
    ).then((value) {
      if (value != null) {
        debugPrint(value);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data added successfully")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Something went wrong")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final platformData = ref.watch(
      getPlatformData(APIEndpoints().platformData),
    );

    final categoryData = ref.watch(
      getBaseSidebarData(APIEndpoints().baseSidebar),
    );

    _addCategory(items: categoryData.hasValue ? categoryData.value!.data : []);

    return Scaffold(
      body: categoryData.hasValue && platformData.hasValue
          ? Row(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: platformData.value!.data.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (e, index) {
                                return TemplatePlatformButton(
                                  value: index,
                                  data: platformData
                                      .value!.data[index].platformName,
                                );
                              },
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
