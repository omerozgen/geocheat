import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocheat/app.dart';

void main() {
  group('GeoCheat App Tests', () {
    testWidgets('App should start without crashing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const ProviderScope(child: GeoCheatApp()));

      expect(find.text('GeoCheat'), findsOneWidget);
    });

    testWidgets('Should display main categories', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: GeoCheatApp()));

      await tester.pumpAndSettle();

      // Ana kategorilerin görünür olduğunu kontrol et
      expect(find.text('Üçgenler'), findsOneWidget);
      expect(find.text('Dörtgenler'), findsOneWidget);
      expect(find.text('Çokgenler'), findsOneWidget);
      expect(find.text('Çember ve Daire'), findsOneWidget);
      expect(find.text('Katı Cisimler'), findsOneWidget);
      expect(find.text('Analitik Geometri'), findsOneWidget);
      expect(find.text('Hesap Makinesi'), findsOneWidget);
    });
  });
}
