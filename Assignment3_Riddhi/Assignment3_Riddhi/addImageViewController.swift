//
//  addImageViewController.swift
//  Assignment3_Riddhi
//
//  Created by Riddhi Kaila on 14/11/21.
//

import UIKit

protocol AddingImageProtocol {
    func controllerDidFinishWithNewImage(Il: ImageInfo)
    
    func controllerDidCancel()
}

class addImageViewController: UIViewController {

    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var imageURL: UITextField!
    
    var delegate: AddingImageProtocol?

    
    @IBAction func cancelPressed(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        if let name = imageName.text {
                    if let url = imageURL.text {
                        if !name.isEmpty && !url.isEmpty {
                            let new = ImageInfo(n: name, url: url)
                            delegate?.controllerDidFinishWithNewImage(Il: new)
                            dismiss(animated: true, completion: nil)
                        }
                    }
                }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
