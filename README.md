NetworkActivityIndicatorManager
===============================

iOS の `UIApplication networkActivityIndicatorVisible` を効率的に管理するためのヘルパクラスです。`networkActivityIndicatorVisible` をスタッカブルに共有します。

Abstruct
========

`NSObject+NetworkActivityIndicator.h` を import し、NSObject カテゴリに追加される networkActivityIndicator プロパティを使用してください。この networkActivityIndicator プロパティは、オブジェクト単位に networkActivityIndicator をオンにした回数をカウントし、networkActivityIndicator を共有したすべてのオブジェクトがオフにするまで networkActivityIndicatorVisible にします。

また、UIApplicationDidEnterBackgroundNotification が通知されたタイミングで networkActivityIndicator を共有したオブジェクトから dealloc されたオブジェクトを取り除き、networkActivityIndicator がオフにならない事象を自動的に解決します。

Example
=======

UIWebViewDelegate プロトコルを実装したクラスから使用する場合は以下のように networkActivityIndicator を制御してください。

```objc
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    webView.networkActivityIndicator = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    webView.networkActivityIndicator = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    webView.networkActivityIndicator = NO;
}
```

NSObject (NetworkActivityIndicator) Category
============================================

### networkActivityIndicator property

networkActivityIndicator を制御します。

#### prototype

```objc
@property (nonatomic) BOOL networkActivityIndicator;
```

### enableNetworkActivityIndicator method

networkActivityIndicator を表示します。既に表示している場合何もしません。

`object.networkActivityIndicator = YES` と等価です。

#### prototype

```objc
- (void)enableNetworkActivityIndicator;
```

### disableNetworkActivityIndicator method

networkActivityIndicator を可能なら非表示にします。`enableNetworkActivityIndicator` が複数回呼び出されていた場合、呼び出しカウンタが0になるまで非表示にしません。また、他のオブジェクトにより networkActivityIndicator が使用中の場合、すべてのオブジェクトが `disableNetworkActivityIndicator` を呼び出すまで非表示にしません。

`object.networkActivityIndicator = NO` と等価です。

#### prototype

```objc
- (void)disableNetworkActivityIndicator;
```

### forceDisableNetworkActivityIndicator method

networkActivityIndicator を強制的に非表示にします。`enableNetworkActivityIndicator` が複数回呼び出されていた場合、呼び出しカウンタを無視して非表示にします。他のオブジェクトにより networkActivityIndicator が使用中の場合は非表示にしません。

#### prototype

```objc
- (void)forceDisableNetworkActivityIndicator;
```

### setNetworkActivityIndicator:force: method

`enableNetworkActivityIndicator` `disableNetworkActivityIndicator` `forceDisableNetworkActivityIndicator` と同じ機能を実行します。

#### prototype

```objc
- (void)setNetworkActivityIndicator:(BOOL)networkActivityIndicator force:(BOOL)force;
```
