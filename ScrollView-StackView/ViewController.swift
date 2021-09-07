//
//  ViewController.swift
//  ScrollView-StackView
//
//  Created by Shinichiro Kudo on 2021/09/06.
//

import UIKit

final class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private let itemView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let itemView2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    private let itemView3: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    private let itemView4: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        setupScrollView()
        setupStackView()
        setupContentsViewConstraint()
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // scrollViewのサイズは画面いっぱいにする
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
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
        
        stackView.addArrangedSubview(itemView)
        stackView.addArrangedSubview(itemView2)
        stackView.addArrangedSubview(itemView3)
        stackView.addArrangedSubview(itemView4)
    }
    
    private func setupContentsViewConstraint() {
        
        // stackViewが持つコンテンツにそれぞれ高さの制約を与える
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        
        itemView2.translatesAutoresizingMaskIntoConstraints = false
        itemView2.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        
        itemView3.translatesAutoresizingMaskIntoConstraints = false
        itemView3.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
        
        itemView4.translatesAutoresizingMaskIntoConstraints = false
        itemView4.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    }
    
}
