
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_reviewer/pages/acc_activation.dart';
import 'package:food_reviewer/pages/engineer_invite.dart';
import 'package:food_reviewer/pages/otp.dart';
import 'package:integration_test/integration_test.dart';

import 'package:food_reviewer/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    "App Test",
    () {
      testWidgets(
        "full app test",
        (tester) async {
          // const app1.AccActivate();
          await tester.pumpWidget(const AccActivate());
          // App UI state to constant (no refreshing...)
          await tester.pumpAndSettle();

          // Set up variables
          final phoneNumber = find.byType(TextFieldSample).first;
          final getActivationCode =
              find.byKey(const Key("getActivationalCode"));

          // Enter test
          await tester.enterText(phoneNumber, "123456");
          // When change something to the UI
          await tester.pumpAndSettle();

          // Ensure the widget is visible
          await tester.ensureVisible(getActivationCode);
          await tester.tap(getActivationCode);
          await tester.pumpAndSettle();

          // Expecting OTP page is found
          expect(find.byType(OTP), findsOneWidget);

          await tester.pumpAndSettle();
          await tester.enterText(find.byType(ObscuredTextFieldSample), "1234");
          await tester.pumpAndSettle();

          final activateOTP = find.byKey(const Key("activateOTP"));
          await tester.ensureVisible(activateOTP);
          await tester.tap(activateOTP);
          await tester.pumpAndSettle();

          expect(find.byType(app.Factory2), findsOneWidget);

          await tester.pumpAndSettle();
        },
      );

      testWidgets("Main to Engineers", (tester) async {
        // await tester.ensureVisible(find.byType(BottomNavigationBar).at(0));
        await tester.pumpWidget(const app.Factory2());
        await tester.pumpAndSettle();

        // Ensure the BottomNavigationBar is present
        expect(find.byType(BottomNavigationBar), findsOneWidget);

        // await tester.tap(find.byType(BottomNavigationBar).at(0));
        await tester.tap(find.byIcon(Icons.person));
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key("AddButton")));
        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextFieldName), "Goku");
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key("submitInvitation")));
        await tester.pumpAndSettle();
      });

      testWidgets("Main to setting", (tester) async {
        await tester.pumpWidget(const app.Factory2());
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.settings).last, findsOneWidget);

        await tester.tap(find.byIcon(Icons.settings).last);
        await tester.pumpAndSettle();

        // Verify that the factory1 button is present
        expect(find.byKey(const Key("factory1")), findsOneWidget);

        await tester.tap(find.byKey(const Key("factory1")));
        await tester.pumpAndSettle();
      });
    },
  );
}
