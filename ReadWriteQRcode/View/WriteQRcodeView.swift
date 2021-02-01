//
//  WriteQRcodeView.swift
//  ReadWriteQRcode
//
//  Created by Miguel Ferrer Fornali on 1/2/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct WriteQRcodeView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var showQRcode = false
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: self.$username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Password", text: self.$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
                Image(uiImage: generateQRcode(text: "\(username)\n\(password)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
            }
        }
        .navigationBarTitle("Write QR code")
    }
    
    func generateQRcode(text:String)->UIImage {
        let data = Data(text.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let img = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: img)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct WriteQRcodeView_Previews: PreviewProvider {
    static var previews: some View {
        WriteQRcodeView()
    }
}
