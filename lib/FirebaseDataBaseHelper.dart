import 'package:firebase_database/firebase_database.dart';
import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';
import 'Constants.dart';
class FirebaseDataBaseHelper {
  static final databaseReference = FirebaseDatabase.instance.reference();
  static Future<void> insertUser(
      String fullname, String email, String phone, String password) {
    String pushKey = databaseReference.child(FireBaseKeys.USERS).push().key;
    return databaseReference
        .child(FireBaseKeys.USERS)
        .child(pushKey)
        .set(<String, String>{
      FireBaseKeys.EMAIL: email,
      FireBaseKeys.PASSWORD: password,
      FireBaseKeys.MOBILE: phone,
      FireBaseKeys.FULL_NAME: fullname
    });
  }
  static PublishSubject<bool> checkCredentails(String email, String password)  {
      Map<dynamic, dynamic> map;
      Map<String, String> innner;
      PublishSubject<bool> subject=PublishSubject<bool>();
      bool flag=false;
      databaseReference
        .child(FireBaseKeys.USERS)
        .once()
        .then((snapshot) => {

              map = snapshot.value,
              map.forEach((k, v) => {
                   // v = innner as Map<String, String>,
                    if (v[FireBaseKeys.EMAIL] == email &&
                        v[FireBaseKeys.PASSWORD] == password)
                      {
                          flag=true,
                  subject.add(flag)
                      }
                  })

            }).whenComplete((){

              if(flag==false){
                subject.addError(Errors.ENTER_CORRECT_EMAIL_PASSWORD);
              }
      });
      return subject;
  }
}
class FireBaseKeys {
  static final String USERS = "user";
  static final String EMAIL = "email";
  static final String PASSWORD = "password";
  static final String MOBILE = "mobile";
  static final String FULL_NAME = "full_name";
}
