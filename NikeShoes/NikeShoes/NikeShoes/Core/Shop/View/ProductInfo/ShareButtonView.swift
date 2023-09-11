//
//  ShareView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/11/23.
//

import SwiftUI
import UIKit

struct ShareButtonView: View {
  var body: some View {
      Button {
          buttonAction("https://www.nike.com/kr/t/%2525EC%252597%252590%2525EC%252596%2525B4-%2525ED%25258F%2525AC%2525EC%25258A%2525A4-1-07-%2525EB%252582%2525A8%2525EC%252584%2525B1-%2525EC%25258B%2525A0%2525EB%2525B0%25259C-TttlGpDb/CW2288-111?turntoflow=review&writeReview=true&turntoReviewSource=inline&turntoCampaign=AppPDP", .share)
      } label: {
          HStack {
              Spacer()
              
              Text("\(Image(systemName: "square.and.arrow.up")) 공유")
                  .foregroundColor(.black)
                  .padding(.vertical, 28)
              
              Spacer()
          }
      }
  }
  
  private enum Coordinator {
    static func topViewController(
      _ viewController: UIViewController? = nil
    ) -> UIViewController? {
      let vc = viewController ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
      
      if let navigationController = vc as? UINavigationController {
        return topViewController(navigationController.topViewController)
      } else if let tabBarController = vc as? UITabBarController {
        return tabBarController.presentedViewController != nil ?
        topViewController(
          tabBarController.presentedViewController
        ) : topViewController(
          tabBarController.selectedViewController
        )
      } else if let presentedViewController = vc?.presentedViewController {
        return topViewController(presentedViewController)
      }
      return vc
    }
  }
  
  private enum Method: String {
    case share
    case link
  }
  
  private func buttonAction(_ stringToURL: String, _ method: Method) {
    let shareURL: URL = URL(string: stringToURL)!
    
    if method == .share {
      let activityViewController = UIActivityViewController(activityItems: [shareURL], applicationActivities: nil)
      let viewController = Coordinator.topViewController()
      activityViewController.popoverPresentationController?.sourceView = viewController?.view
      viewController?.present(activityViewController, animated: true, completion: nil)
    } else {
      UIApplication.shared.open(URL(string: stringToURL)!)
    }
  }
}

#Preview {
    ShareButtonView()
}
