//
//  ReadQRcodeView.swift
//  ReadWriteQRcode
//
//  Created by Miguel Ferrer Fornali on 1/2/21.
//

import SwiftUI
import CodeScanner

struct ReadQRcodeView: View {
    
    @State private var showScanner = false
    @State private var result = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    showScanner = true
                }, label: {
                    Text("Scan QR code")
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                Text(self.result)
                    .font(.title3)
                    .padding()
            }.sheet(isPresented: self.$showScanner, content: {
                CodeScannerView(codeTypes: [.qr]) { result in //.code128 para admitir codigo de barras
                    switch result {
                    case .success(let codigo):
                        self.result = codigo
                        self.showScanner = false
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            })
        }
        .navigationTitle("Read QR code")
    }
}

struct ReadQRcodeView_Previews: PreviewProvider {
    static var previews: some View {
        ReadQRcodeView()
    }
}
