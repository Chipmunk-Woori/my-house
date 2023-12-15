enum StorageManagerKey {
  accessToken('accessToken'),
  refreshToken('refreshToken'),
  pushToken('pushToken'),
  loginStatus('loginStatus'), //true/false
  uid('uid'),
  user('user');

  const StorageManagerKey(this.key);

  final String key;
}
