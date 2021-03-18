//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit
import Anchorage

class SearchViewController: UIViewController {

    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.automaticallyShowsCancelButton = false
        searchController.searchBar.searchTextField
            .backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
        searchController.searchBar.searchTextField.textAlignment = .center
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false

        let searchBarContainer = SearchBarContainerView(customSearchBar: searchController.searchBar)
        navigationItem.titleView = searchBarContainer


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
