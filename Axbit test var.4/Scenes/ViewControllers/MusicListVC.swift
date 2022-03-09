//
//  MusicListVC.swift
//  Axbit test var.4
//
//  Created by 111 on 09.03.2022.
//

import UIKit

class MusicListVC: UIViewController {

    //MARK: - Properties

    var urlString: String?
    var randomData: [String]? = ["one", "two"]

    //MARK: - Outlets

    @IBOutlet weak var musicListForPickedArtist: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK: - Extensions

extension MusicListVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let musicListCell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell", for: indexPath) as! MusicListCell
        musicListCell.label.text = randomData?[indexPath.row]

        return musicListCell
    }
}
