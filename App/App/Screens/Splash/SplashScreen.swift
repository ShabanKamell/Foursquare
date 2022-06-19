//
//  HomeScreen.swift
//  EcommerceTemplate
//
//  Created by Shaban on 03/01/2022.
//  Copyright © 2022 Shaban. All rights reserved.
//

import SwiftUI

struct SplashScreen: AppScreen {
    @ObservedObject var vm: SplashVM
    @State private var showHome: Bool = false

    var bodyContent: some View {
        Group {
            Text(Strings.appName)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            NavigationLink(
                    isActive: $showHome,
                    destination: { HomeScreen.build() }) {
                EmptyView()
            }
        }
    }

    func onContentAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showHome = true
        }
    }
}

extension SplashScreen {
    static func build() -> some View {
        let vm = SplashVM(
                dataManager: DataManager.build(),
                requester: AsyncMan()
        )
        return SplashScreen(vm: vm)
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen.build()
    }
}
