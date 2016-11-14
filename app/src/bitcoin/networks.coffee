
bitcoin.networks.dash =
  magicPrefix: '\x19DarkCoin Signed Message:\n',
  bip32:
    public: 0x02FE52F8,
    private: 0x05358394
  pubKeyHash: 76
  scriptHash: 16


ledger.bitcoin ||= {}
ledger.bitcoin.Networks =
  bitcoin:
    name: 'bitcoin'
    bolosAppName: 'Bitcoin'
    plural: 'bitcoins'
    ticker: 'btc'
    scheme: 'bitcoin:'
    tickerKey:
      from: 'fromBTC'
      to: 'toBTC'
    bip44_coin_type: '0'
    version:
      regular: 0
      P2SH: 5
      XPUB: 0x0488B21E
    bitcoinjs: bitcoin.networks.bitcoin
    ws_chain: 'bitcoin'
    dust: 5430
    handleFeePerByte: yes

  testnet:
    name: 'testnet'
    plural: 'bitcoins'
    ticker: 'btctest'
    scheme: 'bitcoin:'
    bip44_coin_type: '1'
    version:
      regular: 111
      P2SH: 196
    bitcoinjs: bitcoin.networks.testnet
    ws_chain: 'testnet3'
    dust: 5430
    handleFeePerByte: yes

  segnet:
    name: 'segnet'
    plural: 'bitcoins'
    ticker: 'segtest'
    scheme: 'bitcoin:'
    bip44_coin_type: '1'
    version:
      regular: 30
      P2SH: 50
      XPUB: 0x053587CF
    bitcoinjs:
      messagePrefix: '\x18Bitcoin Signed Message:\n',
      bip32: {
        public: 0x053587CF,
        private: 0x05358394
      },
      pubKeyHash: 30,
      scriptHash: 50,
      wif: 158,
      dustThreshold: 546
    dust: 5430
    handleFeePerByte: yes

  litecoin:
    name: 'litecoin'
    plural: 'litecoins'
    scheme: 'litecoin:'
    bolosAppName: 'Litecoin'
    ticker: 'ltc'
    tickerKey:
      from: 'fromLTC'
      to: 'toLTC'
    bip44_coin_type: '2'
    version:
      regular: 48
      P2SH: 5
      XPUB: 0x19DA462
    bitcoinjs: bitcoin.networks.litecoin
    dust: 10000
    handleFeePerByte: no

  dogecoin:
    name: 'dogecoin'
    plural: 'dogecoins'
    scheme: 'dogecoin:'
    bolosAppName: 'Dogecoin'
    ticker: 'doge'
    tickerKey:
      from: 'fromDOGE'
      to: 'toDOGE'
    bip44_coin_type: '3'
    version:
      regular: 30
      P2SH: 22
      XPUB: 0x02facafd
    bitcoinjs: bitcoin.networks.dogecoin
    dust: 10000
    handleFeePerByte: no

  dash:
    name: 'dash'
    plural: 'dash'
    scheme: 'dash:'
    bolosAppName: 'Dash'
    ticker: 'dash'
    tickerKey:
      from: 'fromDASH'
      to: 'toDASH'
    bip44_coin_type: '5'
    version:
      regular: 76
      P2SH: 16
      XPUB: 0x02FE52F8
    bitcoinjs: bitcoin.networks.dash
    dust: 10000
    handleFeePerByte: no

  zcash:
    name: 'zcash'
    plural: 'zcash'
    scheme: 'zcash:'
    bolosAppName: 'Zcash'
    ticker: 'zec'
    tickerKey:
      from: 'fromZEC'
      to: 'toZEC'
    bip44_coin_type: '133'
    version:
      regular: 0x1CB8
      P2SH: 0x1CBD
      XPUB: 0x0488B21E
    bitcoinjs:
      messagePrefix: '\x16Zcash Signed Message:\n',
      bip32: {
        public: 0x0488B21E,
        private: 0x05358394
      }
    dust: 10000
    handleFeePerByte: no