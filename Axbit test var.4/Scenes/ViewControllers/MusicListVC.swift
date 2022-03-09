//
//  MusicListVC.swift
//  Axbit test var.4
//
//  Created by 111 on 09.03.2022.
//

import UIKit

class MusicListVC: UIViewController {

    //MARK: - Properties

    let networkDataFetcher = NetworkDataFeature()
    var artistMusicList: DataModel? = nil
    var urlName: String?

    //MARK: - Outlets

    @IBOutlet weak var musicListForPickedArtist: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://itunes.apple.com/search?term=\(urlName ?? "1")&media=music&limit=15"

        // Call method fetchData for download data

        networkDataFetcher.fetchData(urlString: urlString) { (musicList) in
            guard let artistMusicList = musicList else { return }
            self.artistMusicList = artistMusicList
            self.musicListForPickedArtist.reloadData()
        }
    }
}

//MARK: - Extensions

extension MusicListVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (artistMusicList?.resultCount) ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let musicListCell = musicListForPickedArtist.dequeueReusableCell(withIdentifier: "MusicListCell",
                                                                         for: indexPath) as! MusicListCell
        let trackName = artistMusicList?.results[indexPath.row]
        let trackImage = artistMusicList?.results[indexPath.row]

        musicListCell.label.text = trackName?.trackName ?? "nil"
        musicListCell.musicCellImage.loadFrom(URLAddress: trackImage?.artworkUrl100 ?? "gear")

        return musicListCell
    }
}
