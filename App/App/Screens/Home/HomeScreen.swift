//
//  HomeScreen.swift
//  EcommerceTemplate
//
//  Created by Shaban on 03/01/2022.
//  Copyright © 2022 Shaban. All rights reserved.
//

import SwiftUI

struct HomeScreen: AppScreen {
    @ObservedObject var vm: HomeVM

    var bodyContent: some View {
        Text("Home")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension HomeScreen {
    static func build() -> some View {
        let vm = HomeVM(
                dataManager: DataManager.build(),
                requester: AsyncMan()
        )
        return HomeScreen(vm: vm)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen.build()
    }
}
