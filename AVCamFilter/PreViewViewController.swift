//
//  PreViewViewController.swift
//  AVCamFilter
//
//  Created by Yeji Chun on 2020/02/17.
//  Copyright © 2020 Apple. All rights reserved.
//


// 나머지 필터를 찾을 수 없음'
import UIKit
import PixelEditor
import PixelEngine

class PreViewViewController: UIViewController {
    
    var image : UIImage!

    @IBOutlet weak var imageView: UIImageView!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            imageView.image = self.image
            //imageView.image = self.image
            
        

            // Do any additional setup after loading the view.
        }
        
        @IBAction func ReturntoCamera(_ sender: Any) {
        }
        
        @IBAction func Edit(_ sender: Any) {
            let controller = PixelEditViewController.init(image: image)
            
            let nav = UINavigationController(rootViewController: controller)

            present(nav, animated: true, completion: nil)
        }
        
        @IBAction func SavePhoto(_ sender: Any) {
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
//    extension PreViewViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//      }
//
//      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        let image = info[.originalImage] as! UIImage
//
//        picker.dismiss(animated: true, completion: nil)
//
//        let controller = PixelEditViewController.init(
//          image: image
//        )
//
//        controller.delegate = self
//
//        navigationController?.pushViewController(controller, animated: true)
//
//      }
//    }

    extension PreViewViewController : PixelEditViewControllerDelegate {
        func pixelEditViewController(_ controller: PixelEditViewController, didEndEditing editingStack: EditingStack) {

            self.navigationController?.popToViewController(self, animated: true)
            let stackimage = editingStack.makeRenderer().render(resolution: .full)
            self.imageView.image = stackimage
        }
        
        
        func pixelEditViewControllerDidCancelEditing(in controller: PixelEditViewController) {
            self.navigationController?.popToViewController(self, animated: true)
        }
    }
