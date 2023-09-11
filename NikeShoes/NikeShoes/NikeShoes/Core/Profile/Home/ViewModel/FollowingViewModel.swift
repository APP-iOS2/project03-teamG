//
//  FollowingViewModel.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/11.
//

import Foundation
import NikeShoesCore

final class FollowingViewModel: ObservableObject {
    @Published var followingData: [Following] = Following.sample
    
    func modifyFollowing(with id: UUID) {
        let index = followingData.firstIndex { Following in
            Following.id == id
        }
        
        guard let index else {
            return
        }
        
        var chagedData = followingData[index]
        chagedData.isChecked = !chagedData.isChecked
        
        followingData[index] = chagedData
        
        print("\(followingData)")
    }
}
