import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private let movies = ["Thor", "Blade Runner", "Batman vs Superman", "Justice League", "wonderwoman", "Dark Tower", "Star Wars"]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        
        if(cell == nil){
        cell = UITableViewCell(
        style: UITableViewCellStyle.default,reuseIdentifier:
        simpleTableIdentifier)
        
    }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if (indexPath.row < 4) {
            cell?.detailTextLabel?.text = "Superhero Movie"
        } else {
            cell?.detailTextLabel?.text = "Sci-Fi Movie"
        }
        
        cell?.textLabel?.text = movies[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int
    {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = movies[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(
            title: "Row Selected",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Yes I Did!",
            style: .default,
            handler: nil)
        
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}


















