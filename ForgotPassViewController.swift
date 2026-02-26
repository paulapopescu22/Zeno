import UIKit
import Firebase

class ForgotPassViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func forgotPassButton(_ sender: Any) {
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: emailField.text!) { (error) in
            if let error = error {
                let alert = UIAlertController (title: "Error", message:error.localizedDescription ,preferredStyle: .alert )
                self.present(alert, animated: true,completion: nil)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action)->Void in print("Ok button tapped")})
                alert.addAction(ok)
                let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in print("Cancel button taped")}
                alert.addAction(cancel)
                return
            }
            let alert = UIAlertController(title: "Reset Password", message: "A password reset email has been sent!", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action)->Void in print("Ok button tapped")})
            alert.addAction(ok)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in print("Cancel button taped")}
            alert.addAction(cancel)
        }
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
