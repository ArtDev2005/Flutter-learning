import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_learning/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.chrome).existsSync(), isTrue);
    expect(File(Images.icon).existsSync(), isTrue);
  });
}
