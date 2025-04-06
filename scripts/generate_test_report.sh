# shellcheck disable=SC2046
if [ $(pwd) != "/Users/pavelkoifman/StudioProjects/rides_showcase/" ]; then
  cd ..
fi
flutter test --coverage
lcov --remove coverage/lcov.info '**/*.g.dart' -o coverage/new_lcov.info
genhtml coverage/new_lcov.info -o coverage/html
open coverage/html/index.html
node covBadgeGen.js