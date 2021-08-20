import UIKit

class CarDetailDrillDownViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    fileprivate let imageStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    var data = dataSourceProvider()
    var selectedCar: CarModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = selectedCar?.modelName
        imageView.image = UIImage(named: selectedCar?.modelName ?? "")
    }
}

extension CarDetailDrillDownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 6
        case 1:
            return 1
        default:
            return selectedCar?.reviews?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
            let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
            
            label.font = label.font.withSize(13)
            
            if row == 0 {
                cell.textLabel?.text = "Color:"
                label.text = selectedCar?.colour
            } else if row == 1 {
                cell.textLabel?.text = "Year:"
                label.text = selectedCar?.yearManufactured
            } else if row == 2 {
                cell.textLabel?.text = "Engine:"
                label.text = selectedCar?.engine
            } else if row == 3 {
                cell.textLabel?.text = "Fuel Type:"
                label.text = selectedCar?.fuelType
            } else if row == 4 {
                cell.textLabel?.text = "Body Type:"
                label.text = selectedCar?.bodyType
            } else if row == 5 {
                cell.textLabel?.text = "Transmission:"
                label.text = selectedCar?.transmission
            }
            cell.accessoryView = label
            return cell
        } else if section == 1 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "Images", for: indexPath)
            
            imageStackView.heightAnchor.constraint(equalToConstant: cell.frame.height).isActive = true
            imageStackView.widthAnchor.constraint(equalToConstant: cell.frame.width - 40).isActive = true
            
            cell.addSubview(imageStackView)
            
            let imageView1 = UIImageView(image: UIImage(named: selectedCar?.modelName ?? ""))
            let imageView2 = UIImageView(image: UIImage(named: selectedCar?.modelName ?? ""))
            let imageView3 = UIImageView(image: UIImage(named: selectedCar?.modelName ?? ""))
            let imageView4 = UIImageView(image: UIImage(named: selectedCar?.modelName ?? ""))
            
            imageView1.contentMode = .scaleAspectFill
            imageView2.contentMode = .scaleAspectFill
            imageView3.contentMode = .scaleAspectFill
            imageView4.contentMode = .scaleAspectFill
            
            imageView1.clipsToBounds = true
            imageView2.clipsToBounds = true
            imageView3.clipsToBounds = true
            imageView4.clipsToBounds = true
            
            imageStackView.addArrangedSubview(imageView1)
            imageStackView.addArrangedSubview(imageView2)
            imageStackView.addArrangedSubview(imageView3)
            imageStackView.addArrangedSubview(imageView4)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Reviews", for: indexPath)
            
            let rating = selectedCar?.reviews?[row].rating ?? 0
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            cell.textLabel?.text = selectedCar?.reviews?[row].name ?? ""
            cell.detailTextLabel?.numberOfLines = 2
            cell.detailTextLabel?.text = selectedCar?.reviews?[row].description ?? ""
            cell.imageView?.image = UIImage(systemName: "\(rating).circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        selectedCar?.reviews?.isEmpty == false ? 3 : 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section != 2 || (section == 2 && selectedCar?.reviews?.isEmpty == false) else { return nil }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        view.backgroundColor = UIColor(red: 0.29, green: 0.00, blue: 0.51, alpha: 1.00)
        
        let customLabel = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        switch section {
        case 0:
            customLabel.text = "Details"
        case 1:
            customLabel.text = "Gallery"
        default:
            customLabel.text = "Reviews"
        }

        customLabel.textColor = .white
        
        view.addSubview(customLabel)
        return view
    }
}

