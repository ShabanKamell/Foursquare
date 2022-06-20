//
//  App.swift
//  App
//
//  Created by Shaban Kamel on 08/01/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

struct App: View {
    var body: some View {
        NavigationView {
            SplashScreen.build()
        }
    }
}

class App_Previews: PreviewProvider {
    static var previews: some View {
        App()
    }
}