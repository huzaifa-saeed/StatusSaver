import 'package:status_saver/l10n/l10n.dart';

const String savedStatusesDirectory =
    "/storage/emulated/0/Download/SavedStatuses";

const String jpg = ".jpg";
const String mp4 = ".mp4";
const String png = ".png";

const List<String> recentDirectoryPaths = [
  "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses",
  "/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses",
  "/storage/emulated/0/WhatsApp/Media/.Statuses",
  "/storage/emulated/0/WhatsApp Business/Media/.Statuses",
];

const List<String> whatsappRecentDirectoryRelativePaths = [
  "WhatsApp/Media/.Statuses",
  "Android/media/com.whatsapp/WhatsApp/Media/.Statuses"
];

const List<String> w4bRecentDirectoryRelativePaths = [
  "WhatsApp Business/Media/.Statuses",
  "Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses"
];

const List<String> whatsappRecentDirectoryAbsolutePaths = [
  "/storage/emulated/0/WhatsApp/Media/.Statuses",
  "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses"
];

const List<String> w4bRecentDirectoryAbsolutePaths = [
  "/storage/emulated/0/WhatsApp Business/Media/.Statuses",
  "/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses"
];

const thumbnailsDirectoryPath = "$savedStatusesDirectory/.thumbnails";
const placeholderVideoThumbnailPath = "";

const whatsappPackageName = "com.whatsapp";
const w4bPackageName = "com.whatsapp.w4b";

const languageCodeKey = "languageCode";
const defaultLanguageCode = "en";
const systemLanguageCode = LanguageCode.system;
const emptyString = '';
const themeModeTypeKey = "themeData";