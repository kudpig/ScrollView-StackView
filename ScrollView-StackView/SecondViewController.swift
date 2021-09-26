//
//  Table-ScrollViewController.swift
//  ScrollView-StackView
//
//  Created by Shinichiro Kudo on 2021/09/23.
//

import UIKit

final class SecondViewController: UIViewController {
    
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
    
    private let searchFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "sample"
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        setupScrollView()
        setupStackView()
        setupContentsViewConstraint()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // サイズ確認用
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let safeAreaTop = self.view.safeAreaInsets.top
        print(safeAreaTop)
        let safeAreaBottom = self.view.safeAreaInsets.bottom
        print(safeAreaBottom)
        
        /*
         safeAreaInsets
         | device | top | bottom |
         
         8    : 64.0, 0.0
         8Plus: 64.0, 0.0
         11   : 92.0, 34.0
         11pro: 88.0, 34.0
         11ProMax : 88.0, 34.0
         12 : 91.0, 34.0
         12pro : 91.0, 34.0
         12ProMax : 91.0, 34.0
         12mini: 94.0, 34.0
         13 : 91.0, 34.0
         13pro : 91.0, 34.0
         13ProMax : 91.0, 34.0
         13mini   : 94.0, 34.0
         SE2  : 64.0, 0.0
         iPod touch(7th) : 64.0, 0.0
         
         */
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        NSLayoutConstraint.activate([stackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
                                     stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)])
        
        stackView.addArrangedSubview(searchFieldView)
        stackView.addArrangedSubview(tableView)
    }
    
    private func setupContentsViewConstraint() {
        
        let searchFieldViewHeight = 100.0
        
        searchFieldView.translatesAutoresizingMaskIntoConstraints = false
        searchFieldView.heightAnchor.constraint(equalToConstant: searchFieldViewHeight).isActive = true
        
        let deviceSizeheight = DeviceSize.screenHeight()
        let navBarHeight = DeviceSize.navBarHeight(navigationController: UINavigationController())
        let safeAreaTop = 91.0
        let safeAreaBottom = 34.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // 画面のサイズからsearchFieldViewとセーフエリア＆ナビゲーションバーの高さを引いた余りにしたい
        tableView.heightAnchor.constraint(equalToConstant: deviceSizeheight - searchFieldViewHeight - navBarHeight - safeAreaTop - safeAreaBottom).isActive = true
    }

}

extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration() // iOS14~
        content.text = "Favorites"
        cell.contentConfiguration = content
        
        //cell.textLabel?.text = "sample"
        return cell
    }
}

extension SecondViewController: UITableViewDelegate {
    // didselect
}

