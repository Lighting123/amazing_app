String getNumberOfBytes(int numberOfBytes) {
  if (numberOfBytes >= 1024) {
    var kilobytes = numberOfBytes / 1024;
    return "$kilobytes KB";
  } else {
    return numberOfBytes.toString();
  }
}
