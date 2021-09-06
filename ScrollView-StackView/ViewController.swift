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
        setupStackView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // scrollView.contentSize(stackViewのサイズ)がscrollView本体のサイズを超えたらスクロール
        // stackView.width : scrollView.widthAnchorに合わせている
        // stackView.width : stackViewの持つ高さ(itemViewの高さの合計 + spacing)
        scrollView.frame = view.frame
        scrollView.contentSize = CGSize(width: stackView.frame.size.width, height: stackView.frame.size.height)
        
        // StackViewの横幅はScrollViewに合わせる
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0).isActive = true
        
        // 以下、コンテンツビューに高さを与える
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        
        itemView2.translatesAutoresizingMaskIntoConstraints = false
        itemView2.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        
        itemView3.translatesAutoresizingMaskIntoConstraints = false
        itemView3.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
        
        itemView4.translatesAutoresizingMaskIntoConstraints = false
        itemView4.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    }

    private func setupStackView() {
        stackView.addArrangedSubview(itemView)
        stackView.addArrangedSubview(itemView2)
        stackView.addArrangedSubview(itemView3)
        stackView.addArrangedSubview(itemView4)
    }
    
}
