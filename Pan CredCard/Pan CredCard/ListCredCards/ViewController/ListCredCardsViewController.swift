//
//  ListCredCardsViewController.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class ListCredCardsViewController: UIViewController {
    
    @IBOutlet weak var listCredCardsTableView: UITableView!
    
    var viewModel: CardsViewModel = CardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor.systemBackground
        navigationItem.backButtonTitle = ""
        viewModel.delegate = self
        viewModel.fetchCardsAlamofire()
    }
    
    func configTableView() {
        listCredCardsTableView.separatorStyle = .none
        listCredCardsTableView.delegate = self
        listCredCardsTableView.dataSource = self
        listCredCardsTableView.register(CredCardsTableViewCell.nib(), forCellReuseIdentifier: CredCardsTableViewCell.identifier)
        listCredCardsTableView.reloadData()
    }
}

extension ListCredCardsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CredCardsTableViewCell.identifier, for: indexPath) as? CredCardsTableViewCell
        cell?.setupCell(card: viewModel.getCardList(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vcString = UIStoryboard(name: String(describing: DetailsCardViewController.self), bundle: nil).instantiateViewController(identifier: "DetailsCardViewController") { coder -> DetailsCardViewController? in
            return DetailsCardViewController(coder: coder, cardName: self.viewModel.getCardName(indexPath: indexPath), card: self.viewModel.getCardList(indexPath: indexPath) )
        }
        
        self.navigationController?.pushViewController(vcString, animated: true)
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
