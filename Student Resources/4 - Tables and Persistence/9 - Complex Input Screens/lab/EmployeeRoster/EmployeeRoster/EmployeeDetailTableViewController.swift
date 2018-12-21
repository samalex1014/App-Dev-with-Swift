
import UIKit

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeDelegate {
    var isEditingBirthday = false {
        didSet{
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    var employeeType: EmployeeType?
    func debug(_ message: String) {
        print(message)
    }
    
    struct PropertyKeys {
        static let unwindToListIndentifier = "UnwindToListSegue"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dobLabel.text = dateFormatter.string(from: employee.dateOfBirth)
            dobLabel.textColor = .black
            dobDatePicker.date = employee.dateOfBirth
            employeeTypeLabel.text = employee.employeeType.description()
            employeeTypeLabel.textColor = .black
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 2 {
            return 44.0
        } else if isEditingBirthday {
            return 46.0
        } else {
            return 0.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            isEditingBirthday = !isEditingBirthday
            dobLabel.text = formatDate(date: dobDatePicker.date)
            dobLabel.textColor = .black
            
        }
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return dateFormatter.string(from: date)
    }
    
    func didSelect(employeeType: EmployeeType) {
        employeeTypeLabel.text = employeeType.description()
        employeeTypeLabel.textColor = .black
        self.employeeType = employeeType
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let name = nameTextField.text {
            if let type = self.employeeType {
                employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: type)
            } else {
                employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: .exempt)
            }
            performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
        performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EmployeeTypeSegue", let destination = segue.destination as? EmployeeTypeTableViewController else { return }
        
        destination.delegate = self
    }
    
    // MARK: - Text Field Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dobLabel.text = formatDate(date: sender.date)
    }
    
}
