//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics

struct ContentView: View {
    
    // Grandezza del canvas generale, non toccate
    @State private var mainViewDim = ["x": CGFloat(600), "y": CGFloat(450)]
    @State private var CanaimageDim =  CGFloat(-225)
    @State private var player: AVAudioPlayer!
    
    // Questa è la vista
    var body: some View {
        
        // Container generale non toccate
        // Tutti i Widget che vengono inseriti nello zstack
        // sono visualizzati uno sull'altro, il primo si trova nell'ultimo piano
        // l'ultimo si trova in primo piano
        ZStack{
            
            // Esempio di dichiarazione di immagine
            Image(uiImage: UIImage(named: "CANNAVACCIUOLO")!)
                .resizable()
                .frame(width: 600, height: 920)
                .offset(x:0, y:CanaimageDim)
                .animation(
                    .linear(duration: 15)
                )
                .gesture(TapGesture().onEnded{
                    CanaimageDim = CGFloat(225)
                    let oceanSound = Bundle.main.path(forResource: "ADDIOS2", ofType: "mp3")
                    player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: oceanSound!))
                    player.prepareToPlay()
                    player.play()
                })
            // Esempio di Testo
            // Text("Hello Playground!")
            
        }.frame(width: mainViewDim["x"], height: mainViewDim["y"])
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
