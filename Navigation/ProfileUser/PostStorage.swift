//
//  PostStorage.swift
//  Navigation
//
//  Created by Kirill Komov on 18.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

struct PostStorage {
    
    static let postArray = [
        PostVK(author: "_k_real_", description: "King Kong is better then me! Today is a good day, the best day in my life, the day of the travel, sun, sea", image: "Kirill", filter: .chrome, likes: 350, views: 500),
        PostVK(author: "Eri4ka", description: "Black sea - my favourite sea", image: "Erika", filter: .colorInvert, likes: 1200, views: 1600),
        PostVK(author: "_slim_shevy_", description: "I believe I can fly I believe I can touch the sky, I think about it every night and day. Spread my wings and fly away. I believe I can soar. I see me running through that open door. I believe I can fly", image: "Evelina", filter: .bloom(intensity: 0.5), likes: 600, views: 850),
        PostVK(author: "_eldar_ado_", description: "School...soon", image: "Eldar", filter: .motionBlur(radius: 1.2), likes: 370, views: 500)
   ]
}
