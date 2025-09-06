import 'package:flutter/material.dart';

class TestMediaQuerySizes extends StatelessWidget {
  const TestMediaQuerySizes({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Test MediaQuery Width')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Box width is 50% of screen width:"),
            Row(
              children: [
                Text("4.5", style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(width: 20),
                Flexible(
                  child: SizedBox(
                    width: screenWidth * 0.5,
                    height: 50,
                    child: Container(
                      color: Colors.blue,
                      child: const Center(child: Text('50% Width')),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Box width is 80% of screen width:"),
            SizedBox(
              width: screenWidth * 0.8,
              height: 50,
              child: Container(
                color: Colors.green,
                child: const Center(child: Text('80% Width')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}