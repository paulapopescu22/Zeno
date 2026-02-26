import UIKit

class ViewController: UIViewController {

    private let isUserLoggedIn = true
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    var menuOut = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func menuButton(_ sender: Any) {
    
    if menuOut == false{
            leading.constant = 150
            trailing.constant = -150
            menuOut = true
        }else{
            leading.constant = 0
            trailing.constant = 0
            menuOut = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
        {
            (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
       
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
