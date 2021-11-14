//
//  ViewController.swift
//  Assignment3_Riddhi
//
//  Created by Riddhi Kaila on 14/11/21.
//

import UIKit

class ViewController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource,
                      AddingImageProtocol {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return manager.getAllImages().count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return manager.getAllImages()[row].name
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let imageurl = URL(string: manager.getAllImages()[row].imageurl)
            load(url: imageurl!)
        }

    @IBOutlet weak var imageSlider: UIImageView!
    @IBOutlet weak var imagePicker: UIPickerView!
    
    var manager: ImageManager = ImageManager()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let aVC = segue.destination as! addImageViewController
            aVC.delegate = self
        }

    func controllerDidFinishWithNewImage(Il: ImageInfo) {
        manager.addNewImage(ni: Il)
           imagePicker.reloadAllComponents()
           let imageurl = URL(string: manager.getAllImages()[0].imageurl)
           load(url: imageurl!)
       }
       
       func controllerDidCancel() {
           
       }
    
    func load(url: URL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageSlider.image = image
                        }
                    }
                }
            }
        }

}

