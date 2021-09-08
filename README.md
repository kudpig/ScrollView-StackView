# ScrollView-StackView

## What
ScrollViewとStackViewをベースとしたレイアウトを組む

## Why
### この構成にすることで、改修のしやすいレイアウトを実現できる

StackView(.Fill, .EqualSpacing)は`保持する全てのコンテンツビューに明示的に高さ(or横幅)の制約を与えることで、それらの合計がStackView本体の高さ(or横幅)となる`という仕様がある。
この仕様を活用し、StackViewの四隅をScrollViewのContentsLayoutGuideに揃えることで、スクロールの高さを動的にすることが可能となる（StackViewの高さを決めなくても制約エラーとならない）

最初からこの構成でレイアウトを組んでおくことで、後付けでScrollViewを一番下に配置するときに煩雑な処理を回避することができる
(後からコンテンツを追加したい、小さな端末ではみ出る、といったケース)

## コード

### ScrollView

```swift
private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.backgroundColor = .clear
         
    return scrollView
}()

private func setupScrollView() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
        
    // scrollViewのサイズは画面いっぱいにする
    NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                 scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                 scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
}
```

### StackView

```swift
private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.backgroundColor = .clear
    stackView.axis = .vertical
    stackView.distribution = .fill
    return stackView
}()

private func setupStackView() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
        
    let contentLayoutGuide = scrollView.contentLayoutGuide
    let frameLayoutGuide = scrollView.frameLayoutGuide
        
    // stackView.widthはframeLayoutGuideに合わせる
    // 四隅はそれぞれcontentLayoutGuideに合わせる
    NSLayoutConstraint.activate([stackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
                                 stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
                                 stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
                                 stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
                                 stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)])
    
    // コンテンツを追加する場合は、必ずどこかで高さの制約を与える
    stackView.addArrangedSubview(hogehogeView)
}
```
