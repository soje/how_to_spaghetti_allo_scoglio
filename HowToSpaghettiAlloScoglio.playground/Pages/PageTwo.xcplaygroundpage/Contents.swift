//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics

struct ContentView: View {
    
    // Grandezza del canvas generale, non toccate
    @State private var mainViewDim = ["x": CGFloat(600), "y": CGFloat(450)]
    
    // Questa è la vista
    var body: some View {
        
        // Container generale non toccate
        // Tutti i Widget che vengono inseriti nello zstack
        // sono visualizzati uno sull'altro, il primo si trova nell'ultimo piano
        // l'ultimo si trova in primo piano
        ZStack(alignment: .bottomLeading) {
            
            // Esempio di dichiarazione di immagine
            /*Image(uiImage: UIImage(named: "faraglioni.png")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, alignment: .topLeading)
                .offset(x:370, y:-175)
            */
            
            // Esempio di Testo
            // Text("Hello Playground!")
            
            
            
        }.frame(width: mainViewDim["x"], height: mainViewDim["y"])
        
    }
}
//: [Next](@next)
