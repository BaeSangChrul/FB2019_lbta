
import UIKit
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String> {
    override func setupViews() {
        backgroundColor = .yellow
        
    }
}


class PhotosGridController: LBTAListController<PhotoGridCell,String>{
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        
        self.items = ["1","2","3"]
    }
    
    

}

struct PhotoGridPreview:PreviewProvider {
    static var previews: some View{
        ContainerView()
    }
    
    struct ContainerView:UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) -> UIViewController {
            return PhotosGridController()
        }
        
        func updateUIViewController(_ uiViewController: PhotoGridPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>){
        }
        
        
        
        
    }
}
