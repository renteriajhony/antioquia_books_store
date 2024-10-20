// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import './models/model_test.dart' as model;
import './api/store_api_test.dart' as api;
import './ui/pages/pages.dart' as pages;
import './ui/widgets/widgets.dart' as widgets;
import './providers/books_provider_test.dart' as providers;

void main() {
  model.main();
  api.main();
  pages.main();
  widgets.main();
  providers.main();
}
