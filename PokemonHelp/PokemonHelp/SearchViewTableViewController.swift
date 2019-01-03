//
//  SearchViewTableViewController.swift
//  PokemonHelp
//
//  Created by Smith, Sam on 12/28/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class SearchViewTableViewController: UITableViewController, UISearchBarDelegate {
    var varieties: [String] = []
    var results: [String] = []
    var types: [PokemonVarieties] = []
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        for type in PokemonVarieties.allCases {
            varieties.append(type.rawValue)
            types.append(type)
        }
        
        results = varieties
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)

        // Configure the cell...
        if indexPath.row < results.count {
            let item = results[indexPath.row]
            cell.textLabel?.text = item
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard case segue.identifier = "DetailSegue", let dest = segue.destination as? DetailViewController else { return }
        let indexPath = tableView.indexPathForSelectedRow!
        guard let id = varieties.firstIndex(of: results[indexPath.row]) else { return }
        dest.pokemon = Pokemon(name: types[id])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        results = varieties.filter {
            $0.hasPrefix(searchText)
        }
        
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
