import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }


    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AthleteFormViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow, segue.identifier == PropertyKeys.editAthleteSegue {
            destination.athlete = athletes[indexPath.row]
        }
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        guard let athleteAddSource = unwindSegue.source as? AthleteFormViewController, let newAthlete = athleteAddSource.athlete else {return}
        if let indexPath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indexPath.row)
            athletes.insert(newAthlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            athletes.append(newAthlete)
        }
    }
 

}
