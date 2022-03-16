import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class UploadFileProvider extends ChangeNotifier {
  String _filePath = '';
  final List<String?> _filePathList = [];
  String _fileType = '';

  String _title = '';
  String _txtContent = '';

  PlatformFile? _file;

  String get filePath => _filePath;
  List<String?> get filePathList => _filePathList;
  String get fileType => _fileType;
  String get title => _title;
  String get txtContent => _txtContent;
  PlatformFile? get file => _file;

  setFilePath(String path) {
    _filePath = path;
    notifyListeners();
  }

  setFilePathList(List<String?> paths) {
    _filePath = '';
    _filePathList.addAll(paths);
    notifyListeners();
  }

  setFileType(String type) {
    _fileType = type;
    notifyListeners();
  }

  clearFilePathList() {
    _filePathList.clear();
    notifyListeners();
  }

  setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  setTextContent(String content) {
    _txtContent = content;
    notifyListeners();
  }

  setFile(PlatformFile file) {
    _file = file;
    notifyListeners();
  }
}
