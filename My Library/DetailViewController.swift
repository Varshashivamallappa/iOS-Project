
import UIKit

class DetailViewController: UIViewController {

    var book: Book!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblPro: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        self.title = book.name
        
        self.lblDate.text = book.released
        self.lblName.text = book.name
        self.lblPro.text = book.publisher
        self.lblDirector.text = "\(book.numberOfPages)"
        self.lblCountry.text = book.country
    }
}
