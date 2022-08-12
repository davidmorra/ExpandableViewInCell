//
//  ViewController.swift
//  ExpandableCells
//
//  Created by Davit on 19.07.22.
//

import UIKit

protocol TournamentDetailCellProtocol {
    
}

class ViewController: UIViewController {

    let cells: [UITableViewCell] = []
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tournament"
        
        setupTableView()
    }
        
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        tableView.register(SendRequestCell.self,forCellReuseIdentifier: "SendRequestCell")
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = ExpandableInfoCell(.collapsed)
            return cell

        case 1: let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
            return cell

        case 2: let cell = tableView.dequeueReusableCell(withIdentifier: "SendRequestCell") as! SendRequestCell
            return cell

        case 3: let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
            return cell
            
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
