extension StringExt on String {
  DateTime backupDate() {
    final milliseconds =
        int.parse(replaceAll('backup_', '').replaceAll('.json', ''));
    return DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }
}
