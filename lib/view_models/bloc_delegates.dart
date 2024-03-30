import 'package:flutter_poc/helpers/utils.dart';

import 'blocs.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printLog('Bloc Event==> $event');
  }
/* 
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printLog('Change==> $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    printLog('Create==> $bloc');
  } */

/*   @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    printLog('Bloc Transition==>$transition');
  }
 */
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    printError('Bloc Error==> $error');
    super.onError(bloc, error, stackTrace);
  }
}
