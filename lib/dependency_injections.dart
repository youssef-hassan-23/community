
import 'package:get_it/get_it.dart';

import 'src/features/authentication/data/implements/auth_implements.dart';
import 'src/features/authentication/data/sources/auth_remote_datesources.dart';
import 'src/features/authentication/domain/repositories/auth_repositories.dart';
import 'src/features/authentication/domain/usecases/login_usecase.dart';
import 'src/features/authentication/presentation/provider/login_provider.dart';

final getIt = GetIt.instance;

void setup() async {

  getIt.registerFactory<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceimpl());
  getIt.registerFactory<AuthenticationRepository>(() =>
      AuthenticationRepositoryImp(
          remoteDataSource: getIt<AuthenticationRemoteDataSource>()));
  getIt.registerFactory<GetLogin>(
      () => GetLogin(repository: getIt<AuthenticationRepository>()));
  getIt.registerLazySingleton<LoginProvider>(
      () => LoginProvider(getIt<GetLogin>()));
}
