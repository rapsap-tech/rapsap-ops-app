import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';

void main() {
  test('plain ids become part of the path', () {
    expect(
      ApiConstants.review.verify('t-22-0900'),
      endsWith('/review/t-22-0900/verify'),
    );
    expect(
      ApiConstants.team.active('m_1'),
      endsWith('/team/members/m_1/active'),
    );
  });

  for (final id in ['..', '../team', 'a/b', 'x?y=1', '', 'a' * 65, 'a%2Fb']) {
    test('rejects "$id" as not found', () {
      expect(
        () => ApiConstants.review.verify(id),
        throwsA(isA<NotFoundException>()),
      );
    });
  }
}
