import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_api/src/models/user/user.dart';

void main() {
  group('User', () {
    group('fromJson', () {
      test('return correct User object', () {
        expect(
            User.fromJson(const <String, dynamic>{
              'id': 'id',
            }),
            isA<User>().having((w) => w.id, 'id', 'id'));
      });
    });
  });
}
