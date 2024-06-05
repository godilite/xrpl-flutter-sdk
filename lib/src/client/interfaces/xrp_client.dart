abstract class XrpClient {
  /// Connects the client to the given [NETWORK]
  void connect(NETWORK network);

  /// Closes the client and cleans up any resources associated with it.
  void close();
}

/// Enum representing the different networks that the client can connect to.
enum NETWORK {
  mainnetS1('wss://s1.ripple.com', 'https://s1.ripple.com:51234'),
  mainnetS2('wss://s2.ripple.com', 'https://s2.ripple.com:51234'),
  mainnetCluster('wss://xrplcluster.com', 'https://xrplcluster.com'),
  testnet('wss://s.altnet.rippletest.net:51233', 'https://s.altnet.rippletest.net:51234'),
  testnetClio('wss://clio.altnet.rippletest.net:51233', 'https://clio.altnet.rippletest.net:51234'),
  devnet('wss://s.devnet.rippletest.net:51233', 'https://s.devnet.rippletest.net:51234'),
  devnetClio('wss://clio.devnet.rippletest.net:51233', 'https://clio.devnet.rippletest.net:51234'),
  sideChain('wss://sidechain-net2.devnet.rippletest.net:51233', 'https://sidechain-net2.devnet.rippletest.net:51234');

  final String websocketUrl;
  final String rpcUrl;

  const NETWORK(this.websocketUrl, this.rpcUrl);
}
