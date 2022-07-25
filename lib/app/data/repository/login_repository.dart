import '../model/user_model.dart';
import '../provider/login_provider.dart';

class LoginRepository {
  
  final LoginApiClient apiClient = LoginApiClient();

  Future createUserWithEmailAndPassword(String email, String password, String name){
    return apiClient.createUserWithEmailAndPassword(email, password, name);
  }

  Future signInWithEmailAndPassword(String email, String password){
    return apiClient.signInWithEmailAndPassword(email, password);
  }

  signOut(){
    apiClient.signOut();
  }

}
