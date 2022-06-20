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
        AppList(vm.venues) { item in
            ItemView(item: item)
        }
    }

    private func ItemView(item: VenueItem) -> some View {
        HStack {
            Image(systemName: .locationCircleFill)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
            Text(item.name)
        }
                .padding()
    }

    func onContentAppear() {
        vm.currentLocationRetriever.start()
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
