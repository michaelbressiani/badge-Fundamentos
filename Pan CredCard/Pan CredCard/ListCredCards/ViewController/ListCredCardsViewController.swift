//
//  ListCredCardsViewController.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class ListCredCardsViewController: UIViewController {
    
    @IBOutlet weak var listCredCardsTableView: UITableView!

    private var viewModel: ListCredCardsViewModel?
    private var secureStorageCard: SecureStorageCard = SecureStorageCard()
    private var cardEmpty: Card = Card(id: 0, name: "", alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor.systemBackground
        navigationItem.backButtonTitle = ""
        self.viewModel = ListCredCardsViewModel(viewController: self)
        viewModel?.delegate = self
        viewModel?.fetchCardsAlamofire()
    }
    
    private func configTableView() {
        listCredCardsTableView.separatorStyle = .none
        listCredCardsTableView.delegate = self
        listCredCardsTableView.dataSource = self
        listCredCardsTableView.register(CredCardsTableViewCell.nib(), forCellReuseIdentifier: CredCardsTableViewCell.identifier)
        listCredCardsTableView.reloadData()
    }
}

extension ListCredCardsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CredCardsTableViewCell.identifier, for: indexPath) as? CredCardsTableViewCell
        cell?.setupCell(card: viewModel?.getCardList(indexPath: indexPath) ?? cardEmpty)
        viewModel?.accessibilityCell(cell: cell ?? UITableViewCell(), indexPath: indexPath)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        secureStorageCard.saveCardToKeychain(card: viewModel?.getCardList(indexPath: indexPath) ?? cardEmpty)
        viewModel?.navegationToDetailsCard(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ListCredCardsViewController: CardsViewModelProtocol {
    func errorRequest() {
    }
    
    func successRequest() {
        configTableView()
    }
}
