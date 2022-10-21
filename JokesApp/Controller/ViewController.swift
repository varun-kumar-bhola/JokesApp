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
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var barLabel: UILabel = {
        let label = UILabel()
       // label.font = .textStyle9
        label.textColor = .white
        label.text = "Jokes"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    private lazy var tabBar: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var jokesTable: UITableView = {
        let table = UITableView()
        
        return table
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        jokesTable.estimatedRowHeight = 100
//        jokesTable.rowHeight = UITableView.automaticDimension
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.global().asyncAfter(qos: .background).async {
//            // self.BackgroundActivity()
//            self.jokesViewModel.getAllJokesData()
//            DispatchQueue.main.async {
//                print("Hello")
//                self.jokesTable.reloadData()
//            }
//        }
        Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
      
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//
//        }
        jokesTable.delegate = self
        jokesTable.dataSource = self
        jokesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tabBar)
        self.tabBar.addSubview(self.barLabel)
        self.view.addSubview(self.imageContainerView)
        self.imageContainerView.addSubview(jokesTable)
        setupLayout()
        // Do any additional setup after loading the view.
    }
    @objc func update() {
        self.jokesViewModel.getAllJokesData()
        self.jokesTable.reloadData()
    }
    private func setupLayout(){
        self.tabBar.snp.makeConstraints { make in
            make.topMargin.equalTo(10)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(50)
        }
        self.barLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(35)
        }
        self.imageContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.tabBar.snp.bottom)
            make.leading.trailing.width.equalToSuperview()
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
        return jokesViewModel.arrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = jokesViewModel.arrUser[indexPath.row]
        cell.textLabel?.text = model
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//                return UITableView.automaticDimension
//            } else {
                return 100
   //         }
        //return UITableView.automaticDimension
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return UITableView.automaticDimension
//        } else {
//            return 40
//        }
//    }
    
}
