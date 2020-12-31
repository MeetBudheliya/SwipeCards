//
//  ViewController.swift
//  SwipeCards
//
//  Created by MAC on 30/12/20.
//

import UIKit
import VerticalCardSwiper
class ViewController: UIViewController,VerticalCardSwiperDatasource{
    private var cardSwiper: VerticalCardSwiper!
    /// Indicates if side swiping on cards is enabled. Set to false if you don't want side swiping. Default is `true`.
    @IBInspectable public var isSideSwipingEnabled: Bool = true
    /// Allows you to enable/disable the stacking effect. Default is `true` (enabled).
    @IBInspectable public var isStackingEnabled: Bool = true
    /// The transform animation that is shown on the top card when scrolling through the cards. Default is 0.05.
    @IBInspectable public var firstItemTransform: CGFloat = 0.05
    /// The inset (spacing) at the top for the cards. Default is 40.
    @IBInspectable public var topInset: CGFloat = 40
    /// The inset (spacing) at each side of the cards. Default is 20.
    @IBInspectable public var sideInset: CGFloat = 20
    /// Sets how much of the next card should be visible. Default is 50.
    @IBInspectable public var visibleNextCardHeight: CGFloat = 50
    /// Vertical spacing between the focussed card and the bottom (next) card. Default is 40.
    @IBInspectable public var cardSpacing: CGFloat = 40
    /// Allows you to set the view to Stack at the Top or at the Bottom. Default is true.
    @IBInspectable public var isStackOnBottom: Bool = true
    /// Sets how many cards of the stack are visible in the background
    @IBInspectable public var stackedCardsCount: Int = 1
    /**
     Returns an array of indexes (as Int) that are currently visible in the `VerticalCardSwiperView`.
     This includes cards that are stacked (behind the focussed card).
    */
    public var indexesForVisibleCards: [Int] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardSwiper = VerticalCardSwiper(frame: self.view.bounds)
               view.addSubview(cardSwiper)
        cardSwiper.datasource = self
        cardSwiper.delegate = self
        cardSwiper.register(nib: UINib(nibName: "ExampleCell", bundle: nil), forCellWithReuseIdentifier: "ExampleCell")
        
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return 100
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
   let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: index) as! CardCell
      
        return cardCell
    }
    
    
}
public enum SwipeDirection: Int {
    case Left
    case Right
    case None
}

extension ViewController :  VerticalCardSwiperDelegate{
    
    private func willSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
       
           // called right before the card animates off the screen (optional).
       }

    private func didSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {

           // handle swipe gestures (optional).
       }
       
       func didCancelSwipe(card: CardCell, index: Int) {
           
           // Called when a card swipe is cancelled (when the threshold wasn't reached)
       }
       
       func sizeForItem(verticalCardSwiperView: VerticalCardSwiperView, index: Int) -> CGSize {
       
           // Allows you to return custom card sizes (optional).
           return CGSize(width: verticalCardSwiperView.frame.width * 0.75, height: verticalCardSwiperView.frame.height * 0.75)
       }
       
       func didScroll(verticalCardSwiperView: VerticalCardSwiperView) {
       
           // Tells the delegate when the user scrolls through the cards (optional).
       }
       
       func didEndScroll(verticalCardSwiperView: VerticalCardSwiperView) {
       
           // Tells the delegate when scrolling through the cards came to an end (optional).
       }
       
    private func didDragCard(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
       
           // Called when the user starts dragging a card to the side (optional).
       }
       
       func didTapCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int) {
       
           // Tells the delegate when the user taps a card (optional).
       }
       
       func didHoldCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int, state: UIGestureRecognizer.State) {
       
           // Tells the delegate when the user holds a card (optional).
       }
}
class ExampleCell: CardCell {
    
}
