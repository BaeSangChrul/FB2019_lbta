
import UIKit
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String> {
    override func setupViews() {
        backgroundColor = .yellow
        
    }
}


class PhotosGridController: LBTAListController<PhotoGridCell,String>{

}

struct PhotoGridPreview:PreviewProvider {
    static var previews: some View{
        Text("Grid preview")
    }
    
    struct ContainerView:UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>) -> UIViewController {
            return PhotosGridController()
        }
        
        func updateUIViewController(_ uiViewController: PhotoGridPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PhotoGridPreview.ContainerView>){
        }
        
        
        
        
    }
}
