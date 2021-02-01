//
//  ContentView.swift
//  ReadWriteQRcode
//
//  Created by Miguel Ferrer Fornali on 1/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    NavigationLink(destination: WriteQRcodeView()) {
                        Text("Write QR Code")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: ReadQRcodeView()) {
                        Text("Read QR Code")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
            .navigationBarTitle("Read/Write QRcodes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
