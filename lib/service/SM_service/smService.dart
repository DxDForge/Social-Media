// D A T A B A S E OPERATION => STORE DATA, GET DATA 


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DataBase_SocialMediaService{
  // INASTANCE OF F I R E B A S E -A U T H   &   F I R E - S T O R E 
FirebaseAuth auth =FirebaseAuth.instance;
FirebaseFirestore firestore =FirebaseFirestore.instance;



// GET => U S E R DATA L I S T FROM FIRESTROE => TO DISPLAY IT


// GET => U S E R DATA L I S T FROM FIRESTROE => TO DISPLAY IT
Stream<List<Map<String,dynamic>>> userDataList(){
 return firestore.collection('Users').snapshots().map((sanpshot) => sanpshot.docs.map((doc) {
    final users = doc.data();
    return users;
  }).toList()
  );
}

// ADD => P O S T DATA TO => FIRESTROE 
Future addPostToFirestoreDB (String content)async{
 // Get the userName
      final userNameDoc = await firestore.collection('Users').doc(auth.currentUser!.uid).get();
      final userName = userNameDoc.data()?['userName'] ?? 'Unknown'; // Retrieve userName from the document


await firestore.collection('Posts').doc(auth.currentUser!.uid).set({
        'uid': auth.currentUser!.uid,
        'userEmail': auth.currentUser!.email,
        'content': content,
        'timestamp': Timestamp.now(),
        'userName': userName,
});
      } 

  // GET => P O S T DATA FROM => FIRESTROE 
  Stream<List<Map<String, dynamic>>> getPostDataFromFirestore(){
   return firestore.collection('Posts').orderBy('timestamp',descending: true)
   .snapshots()
    .map((snapshot) => 
    snapshot.docs.map((doc){
      final data =doc.data();
      return data;
    
    }).toList()
    );
  }

}
