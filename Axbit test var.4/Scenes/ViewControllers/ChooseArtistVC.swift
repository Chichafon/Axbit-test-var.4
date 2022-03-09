//
//  ChooseArtistVC.swift
//  Axbit test var.4
//
//  Created by 111 on 09.03.2022.
//

import UIKit

class ChooseArtistVC: UIViewController {

    //MARK: - Properties

    var data: [String]?
    var chooseArtistURLString: String?

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        data = WelcomeVC.names
    }
}

//MARK: - Extensions

extension ChooseArtistVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseArtistCell",
                                                       for: indexPath) as? ChooseArtistCell else { return UITableViewCell() }
        cell.label.text = data?[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MusicListVC") as? MusicListVC else { return }
        vc.urlName = data?[indexPath.row]

        present(vc, animated: true, completion: nil)
    }
}
