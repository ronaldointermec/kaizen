import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaizen/firebase_options.dart';
import 'package:kaizen/app.dart';
import 'package:kaizen/model/core.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   Core core = Core();
//   await core.setUserData();
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _imagem;
  double _uploadProgress = 0;
  String? _downloadUrl;

  Future _recuperarImagem(bool daCamera) async {
    _downloadUrl = null;
    final ImagePicker picker = ImagePicker();
    XFile? imagemSelecionada;

    if (daCamera) {
      imagemSelecionada = await picker.pickImage(source: ImageSource.camera);
    } else {
      imagemSelecionada = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = File(imagemSelecionada!.path);
    });
  }

  Future<void> _uploadImagem() async {
    if (_imagem == null) return;

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage
        .ref()
        .child('uploads/${DateTime.now().millisecondsSinceEpoch}.jpg');
    UploadTask uploadTask = ref.putFile(_imagem!);

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {

      
      setState(() {
        _uploadProgress =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      });
    }, onError: (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro no upload: $e')),
      );
    });

    try {
      await uploadTask;
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        _downloadUrl = downloadUrl;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload completo! URL: $downloadUrl')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao recuperar a URL: $e')),
      );
    }

    setState(() {
      _uploadProgress = 0;
      _imagem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione uma imagem'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {

                    _recuperarImagem(true);
                  },
                  child: Text('Camera')),
              TextButton(
                  onPressed: () {
                    _recuperarImagem(false);
                  },
                  child: Text('Galeria')),
              _imagem == null ? Container() : Image.file(_imagem!),
            _imagem == null ? Container() :  TextButton(
                  onPressed: () {
                    _uploadImagem();

                  },
                  child: Text('Upload Storage')),
              SizedBox(height: 20),
              LinearProgressIndicator(
                minHeight: 10,
                color: Colors.red,
                value: _uploadProgress / 100,
              ),
              SizedBox(height: 20),

                _downloadUrl == null ? Container() :  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(_downloadUrl!),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
