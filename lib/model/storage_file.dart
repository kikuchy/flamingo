part 'storage_file.g.dart';

class StorageFile {
  StorageFile(
      {this.name,
      this.path,
      this.url,
      this.mimeType,
      this.additionalData,
      this.metadata});
  factory StorageFile.fromJson(Map<String, dynamic> json) =>
      _$StorageFileFromJson(json);

  bool isDeleted = false;

  String folderName;

  String name;
  String path;
  String url;
  String mimeType;
  Map<String, dynamic> additionalData;
  Map<String, String> metadata;

  Map<String, dynamic> toJson() => _$StorageFileToJson(this);
}
