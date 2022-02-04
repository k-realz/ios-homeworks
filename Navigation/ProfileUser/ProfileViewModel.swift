//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Kirill Komov on 15.01.2022.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class ProfileViewModel: TableViewModelType {

    let postArray = PostStorage.postArray
   
    var numberOfRows: Int {
        return postArray.count
    }
    
    var pushPhotos: (() -> Void)?
    
    let profileHeaderView = ProfileHeaderView()
    
}
