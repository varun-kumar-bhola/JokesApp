//
//  ViewController.swift
//  JokesApp
//
//  Created by Mac on 21/10/22.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    var jokesViewModel = JokesViewModel()
    private lazy var imageContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var jokesTable: UITableView = {
        let table = UITableView()
        
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        jokesViewModel.getAllJokesData()
        jokesTable.delegate = self
        jokesTable.dataSource = self
        jokesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.imageContainerView)
        self.imageContainerView.addSubview(jokesTable)
        setupLayout()
        // Do any additional setup after loading the view.
    }

    private func setupLayout(){
        self.imageContainerView.snp.makeConstraints { make in
            make.leading.trailing.top.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        self.jokesTable.snp.makeConstraints { make in
            make.top.leading.equalTo(10)
            make.trailing.bottom.equalTo(-10)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Jokes"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
