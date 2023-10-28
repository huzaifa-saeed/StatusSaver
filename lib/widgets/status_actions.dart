import 'package:chewie/chewie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/services/show_toast.dart';

class StatusActions extends ConsumerWidget {
  const StatusActions({super.key, required this.statusPath});

  final String statusPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> actions = [];

    // Insert Save status action
    final String saveStatusPath = getSavedStatusPath(statusPath);
    if (saveStatusPath.compareTo(statusPath) != 0) {
      actions.add(FloatingActionButton.extended(
        heroTag: null,
        onPressed: () async {
          bool exists =
              ref.read(savedStatusesProvider).contains(saveStatusPath);
          if (!exists && await ref.read(savedStatusesProvider.notifier).saveStatus(statusPath)) {
            showToast(getMessage: () => context.l10n.statusSavedMessage);
          }
        },
        icon: const Icon(Icons.file_download_rounded),
        label: Text(context.l10n.saveButtonLabel),
      ));
    }

    actions.addAll([
      // Insert Share status action
      FloatingActionButton.extended(
        heroTag: null,
        onPressed: () {
          // ignore: deprecated_member_use
          Share.shareFiles([statusPath],
              subject:
                  'Whatsapp Status'); // FIXME: notification bar getting close (screen height changing issue)
        },
        icon: const Icon(Icons.share_rounded),
        label: Text(context.l10n.shareButtonLabel),
      )
    ]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actions,
    );
  }
}

class DeleteAction extends ConsumerWidget {
  const DeleteAction(
      {super.key, required this.statusPath, this.chewieController});

  final ChewieController? chewieController;
  final String statusPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        bool isVideoPlaying = chewieController?.isPlaying ?? false;
        if (isVideoPlaying) {
          chewieController?.pause();
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.deleteStatusWarningTitle),
            content: Text(
              context.l10n.deleteStatusWarningMessage,
              style: const TextStyle(fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  pop(context);
                  if (isVideoPlaying) {
                    chewieController?.play();
                  }
                },
                child: Text(context.l10n.cancelButtonLabel),
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(savedStatusesProvider.notifier)
                      .deleteStatus(statusPath)
                      .then(
                    (value) {
                      pop(context);
                      if(!value) return;
                      pop(context);
                      showToast(
                          message: AppLocalizations.of(context)
                                  ?.deletedStatusMessage ??
                              "Status deleted");
                      if (isVideoPlaying) {
                        chewieController?.play();
                      }
                    },
                  );
                },
                child: Text(context.l10n.deleteButtonLabel),
              ),
            ],
          ),
        );
      },
      icon: const Icon(
        Icons.delete_forever,
        color: Colors.white,
      ),
    );
  }
}
