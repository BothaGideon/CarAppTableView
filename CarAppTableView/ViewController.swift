import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    
    var data = dataSourceProvider()
    var carBrands = [CarBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Cars"
        
        carBrands = data.generateData() ?? []
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        carBrands.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carBrands[section].carModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        cell.textLabel?.text = carBrands[indexPath.section].carModels?[indexPath.row].modelName
        cell.imageView?.image = UIImage(named: carBrands[indexPath.section].carModels?[indexPath.row].modelName ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        view.backgroundColor = UIColor(red: 0.29, green: 0.00, blue: 0.51, alpha: 1.00)
        
        let customLabel = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        customLabel.text = carBrands[section].brandName
        customLabel.textColor = .white
        
        view.addSubview(customLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let indexPath = tableView.indexPathForSelectedRow,
            let car = carBrands[indexPath.section].carModels?[indexPath.row] else { return }
        
        let viewController = segue.destination as? CarDetailDrillDownViewController
        viewController?.selectedCar = car
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

