//
//  PostStorage.swift
//  Navigation
//
//  Created by Kirill Komov on 29.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

struct Posts {
    let author: String
    let description: String
    let image: String
    let filter: ColorFilter
    let likes: Int
    let views: Int
}


struct PostStorage {
     static let postArray = [
        Posts(author: "_k_real_", description: "King Kong is better then me! Today is a good day, the best day in my life, the day of the travel, sun, sea", image: "Kirill", filter: .chrome, likes: 350, views: 500),
        Posts(author: "Eri4ka", description: "Black sea - my favourite sea", image: "Erika", filter: .colorInvert, likes: 1200, views: 1600),
        Posts(author: "_slim_shevy_", description: "I believe I can fly I believe I can touch the sky, I think about it every night and day. Spread my wings and fly away. I believe I can soar. I see me running through that open door. I believe I can fly", image: "Evelina", filter: .bloom(intensity: 0.5), likes: 600, views: 850),
        Posts(author: "_eldar_ado_", description: "School...soon", image: "Eldar", filter: .motionBlur(radius: 1.2), likes: 370, views: 500)
    ]
}



