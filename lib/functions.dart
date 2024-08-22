String getNumberOfBytes(int numberOfBytes) {
  if (numberOfBytes >= 1024) {
    var kilobytes = numberOfBytes / 1024;
    var roundedUp = kilobytes.round();
    return "$kilobytes($roundedUp KB)";
  } else {
    return numberOfBytes.toString();
  }
}
