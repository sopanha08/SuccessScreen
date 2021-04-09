//
//  OnboardingViewController.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/31/21.
//

import UIKit

class OnboardingViewController: BaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            
        }
    }
    @IBOutlet weak var skipButton: UIButton!
    
    var scrollWidth: CGFloat = 0.0
    var scrollHeight: CGFloat = 0.0
    
    //data for the slides
    var titles = ["onboarding_title_1".localizedString,
                  "onboarding_title_2".localizedString,
                  "onboarding_title_3".localizedString]
    var descs = ["onboarding_description_1".localizedString,
                 "onboarding_description_2".localizedString,
                 "onboarding_description_3".localizedString]
    var imgs = ["Onboarding 1","Onboarding 2","Onboarding 3"]
    
    //get dynamic width and height of scrollview and save it
    override func viewDidLayoutSubviews() {
        scrollWidth = UIScreen.main.bounds.width
        scrollHeight = UIScreen.main.bounds.height
        if #available(iOS 14.0, *) {
            pageControl.preferredIndicatorImage = UIImage(named: "page_control_icon")
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        skipButton.setTitleColor(.init(hexString: "#B4B4B4"), for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addNextButton()
    }
    
    private func setupScrollView() {
        self.scrollView.delegate = self
        self.view.layoutIfNeeded()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        //crete the slides and add them
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame)
            
            //subviews
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            imageView.frame = CGRect(x:0,y:0,width:scrollWidth,height:scrollHeight)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
            
            let txt1 = UILabel.init(frame: CGRect(x:31,y:scrollHeight/1.8,width:scrollWidth-64,height:40))
            txt1.textAlignment = .left
            txt1.textColor = .white
            txt1.font = UIFont.boldSystemFont(ofSize: 36.0)
            txt1.text = titles[index]
            
            let txt2 = UILabel.init(frame: CGRect(x:31,y:txt1.frame.maxY+10,width:scrollWidth-80,height:70))
            txt2.textAlignment = .left
            txt2.textColor = .white
            txt2.numberOfLines = 0
            txt2.font = UIFont.systemFont(ofSize: 16.0)
            txt2.text = descs[index]
            
            slide.addSubview(imageView)
            slide.addSubview(txt2)
            slide.addSubview(txt1)
            
            scrollView.addSubview(slide)
            
        }
        
        //set width of scrollview to accomodate all the slides
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        
        //disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0
        
        //initial state
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
    }
    
    override func nextButtonDidTap() {
        //        let viewController = ActivateMobileViewController()
        //        viewController.viewModel = ActivateMobileViewModel()
        //        navigationController?.pushViewController(viewController, animated: true)
        switch pageControl.currentPage {
        case 0:
            if scrollView.contentOffset.x == 0 {
                UIView.animate(withDuration: 0.3) {
                    self.scrollView.contentOffset.x = self.scrollWidth
                }
            }
            pageControl.currentPage = 1
        case 1:
            if self.scrollView.contentOffset.x == self.scrollWidth {
                UIView.animate(withDuration: 0.3) {
                    self.scrollView.contentOffset.x = self.scrollWidth * 2
                }
            }
            pageControl.currentPage = 2
        case 2:
            let vc = WelcomeViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    @IBAction func skipButtonDidTap() {
        let vc = WelcomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //indicator
    @IBAction func pageChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    @IBAction func didTapSkip(_ sender: Any) {
        let vc = WelcomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Configure ScrollView Delegate

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
}

