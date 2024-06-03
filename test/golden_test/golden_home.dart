import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:project/screens/home.dart';

// import 'package:lob_app/pages/login.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'golden_toolkit_helper.dart';

void main() async {
  setUpAll(() async {});

  setUp(() async {});

  group('golden test Admin Home test', () {
    testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
        (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.runAsync(
          () async {
            await tester.pumpDeviceBuilder(
              createGoldenBuilder(
                HomePage(),
                'HomePage',
              ),
            );
          },
        );
      });
      await tester.pump(const Duration(seconds: 5));
      await screenMatchesGolden(
        tester,
        'home_view',
        customPump: (tester) => tester.pump(const Duration(seconds: 2)),
      );
    });
  });
}
