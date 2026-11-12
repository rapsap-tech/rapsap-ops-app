import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';
import 'package:rapsap_ops_app/core/widgets/media_close_button.dart';
import 'package:rapsap_ops_app/core/widgets/photo_viewer.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/message_photo.dart';

void main() {
  testWidgets('a chat photo opens full screen and closes', (tester) async {
    ScreenUtil.configure(
      data: const MediaQueryData(size: AppConstants.designSize),
      designSize: AppConstants.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
    );
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MessagePhoto(
            message: ChatMessage(
              id: '1',
              senderName: 'Priya',
              isMine: false,
              sentAt: DateTime(2026, 11, 12),
              photoUrl: 'https://media.example/p.jpg',
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(MessagePhoto));
    await tester.pumpAndSettle();
    expect(find.byType(PhotoViewer), findsOneWidget);

    await tester.tap(find.byType(MediaCloseButton));
    await tester.pumpAndSettle();
    expect(find.byType(PhotoViewer), findsNothing);
  });
}
