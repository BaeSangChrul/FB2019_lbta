




import UIKit
import LBTATools

class PostCell: LBTAListCell<String> {
    let imageView = UIImageView(backgroundColor: .red)
    let nameLabel = UILabel(text:"Name Label")
    let dateLabel = UILabel(text:"Friday at 11:11Am")
    let postTextLabel = UILabel(text: "Here is my post text")
    
//    let imageViewGrid = UIView(backgroundColor: .yellow)
    
    let photoGridController = PhotosGridController()
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(hstack(imageView.withWidth(40).withWidth(40),stack(nameLabel,dateLabel),spacing:8).padLeft(12).padRight(12).padTop(12),postTextLabel,photoGridController.view,spacing:8)
    }
}
class StoryHeader: UICollectionReusableView {
    
    let storiesController = StoryesController(scrollDirection: .horizontal)
    
    override init(frame:CGRect){
        super.init(frame:frame)
        backgroundColor = .yellow
        
        stack(storiesController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class StoryPhotoCell: LBTAListCell<String> {
    
    override var item:String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text:"Lee Ji Eun",font:.boldSystemFont(ofSize: 14),textColor: .white)
    
    override func setupViews() {
        imageView.layer.cornerRadius = 10
        
        stack(imageView)
        
        setupGradientLayer()
        
        stack(UIView(),nameLabel).withMargins(.allSides(8))
    }
    
    let gradientLayer = CAGradientLayer()
    
    fileprivate func setupGradientLayer() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        gradientLayer.locations = [0.7,1.1]
        layer.cornerRadius = 10
        layer.addSublayer(gradientLayer)
        clipsToBounds = true
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
}

class StoryesController: LBTAListController<StoryPhotoCell,String>,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height - 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = ["story photo1","story photo2","story photo3","story photo4","story photo5"]
    }
        
}
    

class MainController: LBTAListHeaderController<PostCell,String,StoryHeader>,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 23, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        self.items = ["hello","world","1","2"]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
}
import SwiftUI
struct MainPreview:PreviewProvider {
    static var previews: some View {
//        Text("main preview1234")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView:UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
        }
    }
    
}
