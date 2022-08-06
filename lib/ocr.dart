import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:io';

class ImageProcessing extends StatefulWidget {
  const ImageProcessing({Key? key}) : super(key: key);

  @override
  State<ImageProcessing> createState() => _ImageProcessingState();
}

class _ImageProcessingState extends State<ImageProcessing> {
  String _processedText = '';
  String _fileName = 'No file selected';
  InputImage? _image;

  void _uploadImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        setState(() => {
              _fileName = result.files.single.name,
              _image = InputImage.fromFile(
                  File.fromRawPath(result.files.single.bytes!))
            });
        // processImage();
      }
    } on PlatformException catch (e) {
      debugPrint("Unsupported operation$e");
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  void processImage() async {
    if (_image != null) {
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(_image!);
      setState(() {
        _processedText = recognizedText.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text('Or upload an image of text.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    onPressed: _uploadImage, child: const Text('Upload')),
              ),
              Text(_fileName,
                  style: const TextStyle(overflow: TextOverflow.ellipsis)),
              Text(_processedText)
            ],
          ),
        ],
      ),
    );
  }
}
