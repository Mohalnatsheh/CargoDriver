import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../model/ChatMessageModel.dart';
import '../utils/Constants.dart';
import 'BaseServices.dart';

class ChatMessageService extends BaseService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late CollectionReference userRef;
  late CollectionReference rideChatRef;
  // FirebaseStorage _storage = FirebaseStorage.instance;

  ChatMessageService() {
    ref = fireStore.collection(MESSAGES_COLLECTION);
    userRef = fireStore.collection(USER_COLLECTION);
    rideChatRef = fireStore.collection(RIDE_CHAT);
  }

  Query chatMessagesWithPagination({
    String? driverID,
    required String riderID,
  }) {
    return ref!.doc("${riderID}_${driverID}").collection("chats").orderBy("createdAt", descending: true);
    // return ref!.doc(currentUserId).collection(receiverUserId).orderBy("createdAt", descending: true);
  }

  Query rideSpecificChatMessagesWithPagination({required String rideId}) {
    return rideChatRef.doc(rideId).collection("messages").orderBy("createdAt", descending: true);
  }

  Future<bool> isRideChatHistory({required String rideId}) async {
    QuerySnapshot<Map<String, dynamic>> b = await rideChatRef.doc(rideId).collection("messages").get();
    if (b.docs.isEmpty) {
      return false;
    }
    return true;
  }

  Future<DocumentReference> addMessage(ChatMessageModel data) async {
    var doc2 = await ref!.doc("${data.receiverId}_${data.senderId}").collection("chats").add(data.toJson());
    doc2.update({'id': doc2.id});
    return doc2;
  }

  Future<bool> exportChat({required String rideId, required String senderId, required String receiverId, bool? onlyDelete}) async {
    // chat export process
    if (onlyDelete != true) {
      try {
        QuerySnapshot<Map<String, dynamic>> b = await ref!.doc("${receiverId}_${senderId}").collection("chats").get();
        b.docs.forEach(
          (element) async {
            await rideChatRef.doc(rideId).collection("messages").add(element.data());
          },
        );
      } catch (e, s) {
        print("FailExportChats Operation::$e ::::$s");
      }
    }
    await justDeleteChat(senderId: senderId,receiverId: receiverId);
    return true;
  }

  Future<bool> justDeleteChat({required String senderId, required String receiverId,}) async {
     print("Check CHAT ROOM Id:::${receiverId}_${senderId}");
    try {
      var documentPath = "${receiverId}_${senderId}";
      CollectionReference collectionRef =ref!.doc(documentPath).collection("chats");
      QuerySnapshot querySnapshot = await collectionRef.get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
      await ref!.doc(documentPath).delete();
      return true;
    } catch (e, s) {
      print("FailDelete Operation::$e ::::$s");
      return false;
    }
  }

  // Future<void> addMessageToDb(DocumentReference senderDoc, ChatMessageModel data, UserData sender, UserData? user, {File? image}) async {
  //   String imageUrl = '';
  //
  //   if (image != null) {
  //     String fileName = basename(image.path);
  //     Reference storageRef = _storage.ref().child("$CHAT_DATA_IMAGES/${sharedPref.getString(USER_ID)}/$fileName");
  //
  //     UploadTask uploadTask = storageRef.putFile(image);
  //
  //     await uploadTask.then((e) async {
  //       await e.ref.getDownloadURL().then((value) async {
  //         imageUrl = value;
  //
  //         fileList.removeWhere((element) => element.id == senderDoc.id);
  //       }).catchError((e) {
  //         log(e);
  //       });
  //     }).catchError((e) {
  //       log(e);
  //     });
  //   }
  //
  //   updateChatDocument(senderDoc, image: image, imageUrl: imageUrl);
  //
  //   userRef.doc(data.senderId).update({"lastMessageTime": data.createdAt});
  //   addToContacts(senderId: data.senderId, receiverId: data.receiverId);
  //
  //   DocumentReference receiverDoc = await ref!.doc(data.receiverId).collection(data.senderId!).add(data.toJson());
  //
  //   updateChatDocument(receiverDoc, image: image, imageUrl: imageUrl);
  //
  //   userRef.doc(data.receiverId).update({"lastMessageTime": data.createdAt});
  // }

  // DocumentReference? updateChatDocument(DocumentReference data, {File? image, String? imageUrl}) {
  //   Map<String, dynamic> sendData = {'id': data.id};
  //
  //   if (image != null) {
  //     sendData.putIfAbsent('photoUrl', () => imageUrl);
  //   }
  //   // log(sendData);
  //   data.update(sendData);
  //
  //   log("Data $sendData");
  //   return null;
  // }

  // DocumentReference getContactsDocument({String? of, String? forContact}) {
  //   return userRef.doc(of).collection(CONTACT_COLLECTION).doc(forContact);
  // }

  // addToContacts({String? senderId, String? receiverId}) async {
  //   Timestamp currentTime = Timestamp.now();
  //
  //   await addToSenderContacts(senderId, receiverId, currentTime);
  //   await addToReceiverContacts(senderId, receiverId, currentTime);
  // }

  // Future<void> addToSenderContacts(String? senderId, String? receiverId, currentTime) async {
  //   DocumentSnapshot senderSnapshot = await getContactsDocument(of: senderId, forContact: receiverId).get();
  //
  //   if (!senderSnapshot.exists) {
  //     //does not exists
  //     ContactDataModel receiverContact = ContactDataModel(
  //       uid: receiverId,
  //       addedOn: currentTime,
  //     );
  //
  //     await getContactsDocument(of: senderId, forContact: receiverId).set(receiverContact.toJson());
  //   }
  // }

  // Future<void> addToReceiverContacts(
  //   String? senderId,
  //   String? receiverId,
  //   currentTime,
  // ) async {
  //   DocumentSnapshot receiverSnapshot = await getContactsDocument(of: receiverId, forContact: senderId).get();
  //
  //   if (!receiverSnapshot.exists) {
  //     //does not exists
  //     ContactDataModel senderContact = ContactDataModel(
  //       uid: senderId,
  //       addedOn: currentTime,
  //     );
  //     await getContactsDocument(of: receiverId, forContact: senderId).set(senderContact.toJson());
  //   }
  // }

  //Fetch User List
  //
  // Stream<QuerySnapshot> fetchContacts({String? userId}) {
  //   return userRef.doc(userId).collection(CONTACT_COLLECTION).snapshots();
  // }
  //
  // Stream<List<UserData>> getUserDetailsById({String? id, String? searchText}) {
  //   return userRef
  //       .where("uid", isEqualTo: id)
  //       .where('caseSearch', arrayContains: searchText.validate().isEmpty ? null : searchText!.toLowerCase())
  //       .snapshots()
  //       .map((event) => event.docs.map((e) => UserData.fromJson(e.data() as Map<String, dynamic>)).toList());
  // }
  //
  // Stream<QuerySnapshot> fetchLastMessageBetween({required String senderId, required String receiverId}) {
  //   return ref!.doc(senderId.toString()).collection(receiverId.toString()).orderBy("createdAt", descending: false).snapshots();
  // }
  //
  // Future<void> clearAllMessages({String? senderId, required String receiverId}) async {
  //   final WriteBatch _batch = fireStore.batch();
  //
  //   ref!.doc(senderId).collection(receiverId).get().then((value) {
  //     value.docs.forEach((document) {
  //       _batch.delete(document.reference);
  //     });
  //
  //     return _batch.commit();
  //   }).catchError((e) {
  //     log(e.toString());
  //   });
  // }
  //
  // Future<void> deleteChat({String? senderId, required String receiverId}) async {
  //   ref!.doc(senderId).collection(receiverId).doc().delete();
  //   userRef.doc(senderId).collection(CONTACT_COLLECTION).doc(receiverId).delete();
  // }

  Future<void> deleteSingleMessage({String? senderId, required String receiverId, String? documentId}) async {
    try {
      // Delete For All
      // await ref!.doc("${receiverId}_${senderId}").collection("chats").doc(documentId).delete();
      // Delete For Specific User
      final chatDocRef = ref!.doc("${receiverId}_${senderId}").collection("chats").doc(documentId);
      await chatDocRef.update({
        'deleted': true
      });
    } on Exception catch (e) {
      log(e.toString());
      throw 'Something went wrong';
    }
  }

  Future<void> setUnReadStatusToTrue({required String senderId, required String receiverId, String? documentId}) async {
    print("CheckCase::${senderId}_${receiverId}");
    ref!.doc("${receiverId}_${senderId}").collection("chats").where('senderId', isNotEqualTo: senderId).get().then((value) {
      value.docs.forEach((element) {
        element.reference.update({
          'isMessageRead': true,
        });
      });
    });
    return;
    ref!.doc(senderId).collection(receiverId).where('senderId', isNotEqualTo: senderId).get().then((value) {
      value.docs.forEach((element) {
        element.reference.update({
          'isMessageRead': true,
        });
      });
    });

    ref!.doc(receiverId).collection(senderId).where('senderId', isNotEqualTo: senderId).get().then((value) {
      value.docs.forEach((element) {
        element.reference.update({
          'isMessageRead': true,
        });
      });
    });
  }

  Stream<int> getUnReadCount({String? senderId, required String receiverId, String? documentId}) {
    return ref!.doc("${receiverId}_${senderId}").collection("chats")
        .where('isMessageRead', isEqualTo: false)
        .where('receiverId', isEqualTo: senderId)
        .snapshots()
        .map(
          (event) => event.docs.length,
        )
        .handleError((e) {
      return e;
    });
  }
}
