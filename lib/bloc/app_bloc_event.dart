part of 'app_bloc_bloc.dart';

@immutable
abstract class AppBlocEvent {
  const AppBlocEvent();
}

// @immutable
// class AppBlocEventUploadImage implements AppBlocEvent {
//   final String filePathToUpload;

//   const AppBlocEventUploadImage({
//     required this.filePathToUpload,
//   });
// }

// @immutable
// class AppBlocEventDeleteAccount implements AppBlocEvent {
//   const AppBlocEventDeleteAccount();
// }

@immutable
class AppBlocEventLogOut implements AppBlocEvent {
  const AppBlocEventLogOut();
}

@immutable
class AppBlocEventInitialize implements AppBlocEvent {
  const AppBlocEventInitialize();
}

@immutable
class AppBlocEventLogIn implements AppBlocEvent {
  final String email;
  final String password;

  const AppBlocEventLogIn({
    required this.email,
    required this.password,
  });
}

@immutable
class AppBlocEventGoToRegistration implements AppBlocEvent {
  const AppBlocEventGoToRegistration();
}

@immutable
class AppBlocEventGoToLogin implements AppBlocEvent {
  const AppBlocEventGoToLogin();
}

@immutable
class AppBlocEventRegister implements AppBlocEvent {
  final String image;
  final String email;
  final String password;

  const AppBlocEventRegister({
    required this.image,
    required this.email,
    required this.password,
  });
}

@immutable
class AppBlocEventGoToDetailScreen implements AppBlocEvent {
  final BuildContext context;
  final String? ref;
  const AppBlocEventGoToDetailScreen({
    this.ref,
    required this.context,
  });
}
