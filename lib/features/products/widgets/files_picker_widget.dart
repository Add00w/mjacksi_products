import 'dart:io' show File;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';

class FilesPickerWidget extends ConsumerStatefulWidget {
  const FilesPickerWidget({super.key});
  @override
  ConsumerState<FilesPickerWidget> createState() => _FilesPickerWidgetState();
}

class _FilesPickerWidgetState extends ConsumerState<FilesPickerWidget> {
  var files = <File>[];
  void _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        files = result.paths.map((path) => File(path!)).toList();
      });
      ref.read(pickedFilesProvider.notifier).state = files;
    }
  }

  void _unselectImage(File fileToDelete) {
    setState(() {
      files.removeWhere((file) => file.path == fileToDelete.path);
    });
    ref.read(pickedFilesProvider.notifier).state = files;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Row(
          children: [
            ...files.map(
              (file) {
                return ImageWithCloseIcon(
                  onClose: () => _unselectImage(file),
                  file: file,
                );
              },
            ).toList(growable: false),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _pickFiles,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: MJacksiIconButton(
                  onTap: () {},
                  icon: Icons.add,
                  foregroundColor: MjacksiColors.green,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'اضغط لاضافة الصور',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageWithCloseIcon extends StatelessWidget {
  const ImageWithCloseIcon({
    required this.onClose,
    required this.file,
    super.key,
  });
  final VoidCallback onClose;
  final File file;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 4),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              file,
              height: 100,
              width: 90,
              fit: BoxFit.fill,
            ),
          ),
          PositionedDirectional(
            top: 4,
            end: 4,
            width: 22,
            height: 22,
            child: DecoratedBox(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.red,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onClose,
                color: Colors.white,
                icon: const Icon(Icons.close),
                iconSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

final pickedFilesProvider = StateProvider((_) => <File>[]);
