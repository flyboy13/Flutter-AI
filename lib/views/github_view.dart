import 'package:flutter/material.dart';

class GitHubView extends StatelessWidget {
  const GitHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'GitHub Repository',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.withOpacity(0.1),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const SelectableText(
                'https://github.com/flyboy13',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.1), width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: const SelectableText(
                    'Email: nductai.work@gmail.com',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.1), width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: const SelectableText(
                    'phone: 0584802232',
                  ),
                )
              ],
            )
          ],
        )));
  }
}
