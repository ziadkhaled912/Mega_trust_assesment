import 'package:flutter_test/flutter_test.dart';
import 'package:mega_trust_task/shared/components/services/validators.dart';
void main() {
  test('non empty string', () {
    final validator = Validators.defaultValidation('test');
    expect(validator, null);
  });
}