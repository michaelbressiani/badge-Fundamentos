//
//  ListCredCardsViewController.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class ListCredCardsViewController: UIViewController {
    
    @IBOutlet weak var listCredCardsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        listCredCardsTableView.delegate = self
        listCredCardsTableView.dataSource = self
        listCredCardsTableView.register(CredCardsTableViewCell.nib(), forCellReuseIdentifier: CredCardsTableViewCell.identifier)
    }
}

extension ListCredCardsViewController: UITableViewDelegate {
    
}

extension ListCredCardsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
//        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CredCardsTableViewCell.identifier, for: indexPath) as? CredCardsTableViewCell
//        cell?.setupCell(person: viewModel.getPerson(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
}
