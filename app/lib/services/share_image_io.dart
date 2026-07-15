import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// PNG byte'larını geçici bir dosyaya yazıp sistemin paylaş sayfasını açar.
/// İnternet gerektirmez — paylaşımı işletim sistemi/başka uygulama yapar
/// (Instagram, WhatsApp...). Sipling'in kendisi hiçbir yere bağlanmaz.
Future<void> shareImageBytes(Uint8List bytes, {String? text}) async {
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/sipling-orman-ozeti.png');
  await file.writeAsBytes(bytes, flush: true);
  await SharePlus.instance.share(
    ShareParams(files: [XFile(file.path)], text: text),
  );
}
