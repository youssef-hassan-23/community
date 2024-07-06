String formatTime(DateTime postTime) {
  // Convert Firestore timestamp to DateTime

  DateTime now = DateTime.now();
  Duration difference = now.difference(postTime);

  if (difference.inDays > 0) {
    return '${difference.inDays} days ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutes ago';
  } else {
    return 'just now';
  }
}
