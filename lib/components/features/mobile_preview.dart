import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/features/add_note.dart';
import 'package:mozilit/controller/features/feature_screen_controller.dart';
import 'package:mozilit/network/endpoints.dart';

class FeatureMobilePreview extends ConsumerWidget {
  const FeatureMobilePreview({
    super.key,
    required this.featureId,
  });

  final String featureId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(
      getFeatureScreenData(APIEndpoints().featureScreen + featureId),
    );

    return res.hasValue
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 225,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
                child: Image.asset(
                  "assets/images/features_mobile.png",
                ),
              ),
              const SizedBox(width: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    res.value!.data.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Security & Privacy"),
                  const SizedBox(height: 30),
                  Text("₹ ${res.value!.data.price}"),
                  const Text("7.0 days"),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(res.value!.data.description),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => showPopupForm(context: context),
                      child: const Row(
                        children: [
                          Icon(Icons.list_alt),
                          SizedBox(width: 10),
                          Text("Add Note"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : const Center(child: Text("Nothing for Mobile Preview"));
  }
}
