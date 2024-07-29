import 'package:custom_dialog/custom_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            FilledButton(
              onPressed: () {
                CustomDialog.showMessageDialog(
                  context,
                  type: MessageDialogType.success,
                  message: 'This is a success message dialog.',
                );
              },
              child: const Text("Show success message dialog"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showMessageDialog(
                  context,
                  type: MessageDialogType.success,
                  message: 'This is a success message dialog.',
                  assetDialogLogo: 'assets/logo.gif',
                );
              },
              child: const Text("Show success message dialog with logo"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showMessageDialog(
                  context,
                  type: MessageDialogType.error,
                  message: 'This is an error message dialog.',
                );
              },
              child: const Text("Show error message dialog"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showMessageDialog(
                  context,
                  type: MessageDialogType.error,
                  message: 'This is an error message dialog.',
                  assetDialogLogo: 'assets/logo.gif',
                );
              },
              child: const Text("Show error message dialog with logo"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showConfirmDialog(
                  context,
                  title: 'Delete Item',
                  message: 'Do you want to delete this item?',
                  onYes: () {
                    // proceed with the action
                  },
                );
              },
              child: const Text("Show confirm dialog"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showConfirmDialog(
                  context,
                  title: 'Delete Item',
                  message: 'Do you want to delete this item?',
                  assetDialogLogo: 'assets/logo.gif',
                  onYes: () {
                    // proceed with the action
                  },
                );
              },
              child: const Text("Show confirm dialog with logo"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showSelectionDialog(
                  context,
                  options: [
                    SelectionDialogOption(key: 'phone', icon: Icons.phone_outlined, text: 'Phone'),
                    SelectionDialogOption(key: 'email', icon: Icons.email_outlined, text: 'Email'),
                    SelectionDialogOption(key: 'sms', icon: Icons.sms_outlined, text: 'SMS'),
                  ],
                  onSelected: (selected) {
                    // proceed with the selected option
                  },
                );
              },
              child: const Text("Show select option dialog"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showSelectionDialog(
                  context,
                  options: [
                    SelectionDialogOption(key: 'phone', icon: Icons.phone_outlined, text: 'Phone'),
                    SelectionDialogOption(key: 'email', icon: Icons.email_outlined, text: 'Email'),
                    SelectionDialogOption(key: 'sms', icon: Icons.sms_outlined, text: 'SMS'),
                  ],
                  assetDialogLogo: 'assets/logo.gif',
                  onSelected: (selected) {
                    // proceed with the selected option
                  },
                );
              },
              child: const Text("Show select option dialog with logo"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showInputDialog(
                  context,
                  title: 'Phone Verification',
                  inputItems: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'enter sms code'),
                    )
                  ],
                  onSubmit: () {
                    // proceed with the input data
                  },
                );
              },
              child: const Text("Show input dialog"),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                CustomDialog.showInputDialog(
                  context,
                  title: 'Phone Verification',
                  assetDialogLogo: 'assets/logo.gif',
                  inputItems: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'enter sms code'),
                    )
                  ],
                  onSubmit: () {
                    // proceed with the input data
                  },
                );
              },
              child: const Text("Show input dialog with logo"),
            ),
          ],
        ),
      ),
    );
  }
}
