import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zerotohero/repositories/home-repository.dart';

CollectionReference get tarefas => Firestore.instance.collection("/tarefas");

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<Map>> getTarefas() async {
    return (await tarefas.getDocuments())
        .documents
        .map((e) => {"name": e.data['name']})
        .toList();
  }

  @override
  Stream<List<Map>> streamTarefas() {
    return tarefas
        .snapshots()
        .map((e) => e.documents.map((e) => {"name": e.data["name"]}).toList());
  }

}
