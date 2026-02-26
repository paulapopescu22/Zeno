import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

   @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var submitButon: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
    fatalError()
    }
    
   
    func resetForm(){
        
        emailError.text = "Required"
        passwordError.text = "Required"
        
        emailError.isHidden = false
        passwordError.isHidden = false
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let emailnew = email.text{
          
            if let errorMessage = invalidEmail(emailnew){
                emailError.text = errorMessage
                emailError.isHidden = false
                
            }
            else{
                emailError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidEmail(_ value: String) -> String?{
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value){
            return "Invalid Email Address"
            
        }
        return nil
    }
    @IBAction func passwordChanged(_ sender: Any) {
        if let passwordn = password.text{
            if let errorMessage = invalidPassword(passwordn){
                passwordError.text = errorMessage
                passwordError.isHidden = false
            }
            else{
                passwordError.isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidPassword(_ value: String) -> String?{
        if value.count < 8 {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value){
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value){
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value){
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool{
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool{
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool{
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    func checkForValidForm(){
        if emailError.isHidden && passwordError.isHidden {
            submitButon.isEnabled = true
        }
        else{
            submitButon.isEnabled = false
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        resetForm()
        validateFields()
    }
    
  
    @IBAction func forgotPassButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "forgotPassSegue")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    @IBAction func createAccount(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    func validateFields() {
        if email.text?.isEmpty == true{
            print("No email text")
            return
        }
        if password.text?.isEmpty == true{
            print("No password")
            return
        }
        
        login()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            guard self != nil else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
            }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid as Any)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
    
   
}
