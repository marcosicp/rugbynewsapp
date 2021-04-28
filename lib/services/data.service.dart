import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talarugbyclub/models/config.model.dart';
// import 'package:cyclear/src/auth/auth.dart';
// import 'package:cyclear/src/repository/cicleador_model.dart';
// import 'package:firebase_database/firebase_database.dart';

// import '../../constants.dart';
// import 'bolsa_base_model.dart';
// import 'pdr_model.dart';

enum LoginMethod { Google, Facebook, Email }

class DataRepositorio {
  final databaseReference2 = Firestore.instance;
  // FireAuth auth = new FireAuth();

  Future<Config> getConfig() async {
    try {
    
    final databaseReference2 = Firestore.instance;
    Config config;

    await databaseReference2.collection('config')
        .getDocuments()
        .then((QuerySnapshot data) {
          data.documents.forEach((key) {
            config = Config.fromDatabase(key.documentID, key.data);
      });
    });
    return config;  
    } catch (e) {
    return null;
    }
    
  }
  // Future<String> crearBolsa(
  //     String code,
  //     String email,
  //     String telefono,
  //     Function onSuccess,
  //     Function(String) onRegisterError) async {

  //   // final currentUser = await auth.getCurrentUser();
  //   final databaseReference2 = Firestore.instance;
    
  //   if (currentUser != null){
    
  //     DocumentReference ref = await databaseReference2.collection("bolsas").add({
  //         'code': code,
  //         'email': email,
  //         'pdrDocumentId': '',
  //         'pdr': '',
  //         'pdrFechaAsignacion': null,
  //         'tdrFechaAsignacion': null,
  //         'sdsFechaAsignacion': null,
  //         'cicleadorFechaAsignacion': null,
  //         'tdrDocumentId': '',
  //         'tdr': '',
  //         'sdsDocumentId': '',
  //         'sds': '',
  //         'edited': null,
  //         'telefono': telefono,
  //         'creado': Timestamp.now(),
  //         'pertenece': '',
  //         });

  //       onSuccess();

  //       return code;
  //     }
  //     return code;
  // }

  // Future<bool> eliminarBolsa(String documentId) async {
  //   try {
  //     final databaseReference2 = Firestore.instance;
  //     var isok = await databaseReference2.collection('bolsas').document(documentId).delete();
      
  //     return true; 
  //   } catch (e) {
  //     return false;
  //   } 
  // }

  // Future<List<BolsaBaseModel>> getAllBolsas() async {
  //   final List<BolsaBaseModel> bolsas = [];
  //   try {
  
  //     final databaseReference2 = Firestore.instance;
      
  //     await databaseReference2.collection('bolsas').orderBy("creado", descending: true)
  //         .getDocuments()
  //         .then((QuerySnapshot data) {
  //           data.documents.forEach((key) {
  //           bolsas.add( BolsaBaseModel.fromDatabase(key.documentID, key.data));
  //         });

  //         return bolsas; 
  //       });
  //       return bolsas; 
  //       } catch (e) {
  //     return null;
  //   } 
  // }

  // Future<List<BolsaBaseModel>> validateCode(String code) async {
  //   final List<BolsaBaseModel> bolsas = [];
  //   try {
  
  //     final databaseReference2 = Firestore.instance;
      
  //     await databaseReference2.collection('bolsas')
  //         .where('code', isEqualTo: code)
  //         .getDocuments()
  //         .then((QuerySnapshot data) {
  //           data.documents.forEach((key) {
  //           bolsas.add( BolsaBaseModel.fromDatabase(key.documentID, key.data));
  //         });
  //         return bolsas; 
  //       });
  //       return bolsas; 
  //       } catch (e) {
  //     return null;
  //   } 
  // }

  // Future<String> generateCode() async {
  //   final List<BolsaBaseModel> bolsas = [];
  //   try {
  
  
  //     final databaseReference2 = Firestore.instance;
      

  //     DocumentReference ref = await databaseReference2.collection("bolsas").add({
  //         'code': '',
  //         'email': '',
  //         'pdrDocumentId': '',
  //         'pdr': '',
  //         'pdrFechaAsignacion': null,
  //         'tdrFechaAsignacion': null,
  //         'sdsFechaAsignacion': null,
  //         'cicleadorFechaAsignacion': null,
  //         'tdrDocumentId': '',
  //         'tdr': '',
  //         'sdsDocumentId': '',
  //         'sds': '',
  //         'edited': null,
  //         'telefono': '',
  //         'creado': Timestamp.now(),
  //         'pertenece': '',});

  //     // await databaseReference2.collection('bolsas')
  //     //     .where('code', isEqualTo: code)
  //     //     .getDocuments()
  //     //     .then((QuerySnapshot data) {
  //     //       data.documents.forEach((key) {
  //     //       bolsas.add( BolsaBaseModel.fromDatabase(key.documentID, key.data));
  //     //     });
  //     //     return bolsas; 
  //     //   });
  //       return ref.documentID; 
  //       } catch (e) {
  //     return null;
  //   } 
  // }

  // Future<bool> guardarBolsa(String _documentId, String _code, String _email, String _telefono) async {
  //   try {
  //     final CollectionReference _dbs = Firestore.instance.collection('bolsas');
  //     var ref = await _dbs.document(_documentId).updateData({
  //         'code': _code,
  //         'email': _email,
  //         'pdrDocumentId': '',
  //         'pdr': '',
  //         'pdrFechaAsignacion': null,
  //         'tdrFechaAsignacion': null,
  //         'sdsFechaAsignacion': null,
  //         'cicleadorFechaAsignacion': null,
  //         'tdrDocumentId': '',
  //         'tdr': '',
  //         'sdsDocumentId': '',
  //         'sds': '',
  //         'edited': null,
  //         'telefono': _telefono,
  //         'creado': Timestamp.now(),
  //         'pertenece': ''
  //         });
    
  //   // onSuccess();
  //   return true;
  //       } catch (e) {
  //     return null;
  //   } 
  // }

  // Future<List<BolsaBaseModel>> getAllBolsasByUser(String uid) async {
  //   final databaseReference2 = Firestore.instance;
  //   List<BolsaBaseModel> bolsas = [];

  //   await databaseReference2.collection('bolsas')
  //       .where('uid', isEqualTo: uid)
  //       .getDocuments()
  //       .then((QuerySnapshot data) {
  //         data.documents.forEach((key) {

  //         bolsas.add( BolsaBaseModel.fromDatabase(key.data["uid"], key.data));
  //     });
  //   });
  //   return bolsas;
  // }

  // Future<List<BolsaBaseModel>> getAllBolsasByCicle(String cicleDocumentId) async {
  //   final databaseReference2 = Firestore.instance;
  //   List<BolsaBaseModel> bolsas = [];

  //   await databaseReference2.collection('bolsas')
  //       .where('cicleDocumentId', isEqualTo: cicleDocumentId)
  //       .getDocuments()
  //       .then((QuerySnapshot data) {
  //         data.documents.forEach((key) {
  //         if(key.data["pertenece"] == "CICLEADOR") {
  //           bolsas.add( BolsaBaseModel.fromDatabase(key.data["uid"], key.data));
  //         }
  //     });
  //   });
  //   return bolsas;
  // }

  // Future<BolsaBaseModel> getBolsaByCode(String code) async {
  //   final databaseReference2 = Firestore.instance;
  //   List<BolsaBaseModel> bolsas = [];

  //   await databaseReference2.collection('bolsas')
  //       .where('code', isEqualTo: code)
  //       .getDocuments()
  //       .then((QuerySnapshot data) {
  //         data.documents.forEach((key) {

  //         bolsas.add( BolsaBaseModel.fromDatabase(key.documentID, key.data));
  //     });
  //   });
  //   return bolsas[0];
  // }

  // Future<Stream<QuerySnapshot>> getAllCicleadores() async {
  //   final cicleadores = await databaseReference2.collection('cicleadores').snapshots();
  //   return cicleadores;
  // }

  // Future<List<PdrModel>> getAllPDRs() async {
  //   final databaseReference2 = Firestore.instance;
  //   List<PdrModel> pdrs = [];

  //   await databaseReference2.collection('pdr')
  //       .getDocuments()
  //       .then((QuerySnapshot data) {
  //         data.documents.forEach((key) {
  //           pdrs.add( PdrModel.fromDatabase(key.documentID, key.data));
  //     });
  //   });
  //   return pdrs;
  // }

  // Future<Stream<QuerySnapshot>> getAllTDR() async {
  //   final tdr = await databaseReference2.collection('tdr').snapshots();
  //   return tdr;
  // }

  // Future<bool> asignarBolsa(String documentId, BolsaBaseModel bolsa, Function onSuccess) async {
  //   final CollectionReference _dbs = Firestore.instance.collection('bolsas');
  //   await _dbs.document(bolsa.documentID).updateData({
  //     'pdrDocumentId': documentId,
  //     'pertenece' : 'PDR',
  //     'edited': DateTime.now()
  //   });

  //   onSuccess();
  //   return true;
  // }

  // Future<bool> asignarBolsaCicle(String documentId, BolsaBaseModel bolsa, Function onSuccess) async {
  //   final CollectionReference _dbs = Firestore.instance.collection('bolsas');
  //   await _dbs.document(bolsa.documentID).updateData({
  //     'cicleDocumentId': documentId,
  //     'pertenece' : 'CICLEADOR',
  //     'edited': DateTime.now()
  //   });

  //   onSuccess();
  //   return true;
  // }

  // Future<PdrModel> getPdrByUserId(String pdrDocumentID) async {
  //   final databaseReference2 = Firestore.instance;
  //   var pdrModel = await databaseReference2.collection('pdr').document(pdrDocumentID).get();
  
  //   var apdrModel = PdrModel.fromSnapshotDocument(pdrModel);
  //   return apdrModel;
  // }

  // Future<CicleadorModel> getCicleByUserId(String cicleDocumentID) async {
  //   final databaseReference2 = Firestore.instance;
  //   var cicleModel = await databaseReference2.collection('cicleadores').document(cicleDocumentID).get();
  
  //   var _cicleModel = CicleadorModel.fromSnapshotDocument(cicleModel);
  //   return _cicleModel;
  // }

}
