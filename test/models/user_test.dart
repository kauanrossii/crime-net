import 'package:crime_net/domain/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('User entity must generate a valid uuid when instanciated', () {
    final user = User("test.user@test.com", "test.password");

    expect(user.uuid, isNotNull);
    expect(Uuid.isValidUUID(fromString: user.uuid.v4()), isTrue);
  });

  test("UpdateInformation method must change the user's information", () {
    const newEmail = "updated.user@test.com";
    const newPassword = "new.password";

    final user = User("test.user@test.com", "test.password");

    user.updateInformations(newEmail, newPassword);

    expect(user.getEmail(), newEmail);
    expect(user.getPassword(), newPassword);
  });
}
