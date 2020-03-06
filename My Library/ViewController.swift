
import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arr = [Book]()
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        // Do any additional setup after loading the view.
        
        self.title = "Books"
        
        fetchBooks()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? TableViewCell
        cell?.lblTitle.text = arr[indexPath.row].name
        cell?.lblSubtitle.text = arr[indexPath.row].country
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        newViewController.book = arr[indexPath.row]
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func fetchBooks() {
        let request = AF.request("https://anapioficeandfire.com/api/books/")
        request.responseDecodable(of: [Book].self) { (response) in
            guard let books = response.value else { return }
            self.arr.append(contentsOf: books)
            self.tblView.reloadData()
        }
    }
}

struct Book: Decodable {

    let isbn: String
    let name: String
    let numberOfPages: Int
    let publisher: String
    let country: String
    let mediaType: String
    let released: String
    
    enum CodingKeys: String, CodingKey {
        case isbn
        case name
        case numberOfPages
        case publisher
        case country
        case mediaType
        case released
    }
}
