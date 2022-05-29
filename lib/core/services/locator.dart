import 'package:food_buddy/core/services/firestore_db.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => FirestoreDB());
}
