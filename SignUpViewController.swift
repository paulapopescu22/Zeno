import UIKit
import FirebaseAuth
import Photos
import Firebase
import FirebaseStorage
//import FirebaseUI

class SignUpViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
   
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var Account: UIButton!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tapToChangeProfileButton: UIButton!
    
    var imagePickerController = UIImagePickerController()
    override func viewDidLoad() {
        
        super.viewDidLoad()
    imagePickerController.delegate = self
   // checkPermissions()
        
        
        
       /* let imageTap = UITapGestureRecognizer(target:self, action: #selector(openImagePicker))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imageTap)
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
        tapToChangeProfileButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        */
    
}
    
/*
    @IBAction func uploadPhotoTapped(_ sender: Any){
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    

    func checkPermissions(){
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized{
            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in ()
        })
        }
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            
        }else{
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }
    func requestAuthorizationHandler(status: PHAuthorizationStatus){
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized{
            print("We have access to photos")
        }else{
            print("We don't have access to photos")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL{
            print(url)
         //   uploadToCloud(fileURL: url)
        }
        imagePickerController.dismiss(animated: true, completion: nil)
    }
  */
  /*  func uploadToCloud(fileURL: URL){
        let storage = Storage.storage()
        
        let data = Data()
        
        let storageRef = storage.reference()
        
        let localFule = fileURL
        
        let photoRef = storageRef.child("UploadPhotoOne")
        
        let uploadTask = photoRef.putFile(from: localFule, metadata: nil){(metadata, err) in
            guard metadata != nil else{
                print(err?.localizedDescription)
                return
            }
            print("Photo Upload")
        }
    }*/
    @IBAction func signUpTapped(_ sender: Any) {
        
       if email.text?.isEmpty == true{
            print("No text in email field")
            return
        }
        if password.text?.isEmpty == true{
            print("No text is password field")
            return
        }
     signUP()
    }
    
    @IBAction func alreadyHaveAccount(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
   
    
    
 
    func signUP(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (authResult, error) in
            guard let user = authResult?.user, error == nil else{
                print("Error \(String(describing: error?.localizedDescription) )")
                return
      }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let vc = storyboard.instantiateViewController(withIdentifier: "login")
              vc.modalPresentationStyle = .overFullScreen
              self.present(vc, animated: true)
    }
  }
}
