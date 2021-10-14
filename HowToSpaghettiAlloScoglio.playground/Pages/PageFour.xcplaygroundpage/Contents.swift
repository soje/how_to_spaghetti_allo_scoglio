//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics

struct ContentView: View {
    
    // Grandezza del canvas generale, non toccate
    @State private var mainViewDim:[String:CGFloat] = ["x": 600, "y": 450]
    @State private var CanaimageDim:CGFloat = -225
    @State private var player:AVAudioPlayer!
    
    // Questa è la vista
    var body: some View {
        
        ZStack{
            
            Image(uiImage: UIImage(named: "background-kitchen")!)
                .resizable()
                .frame(width: 600, height: 920)
                .offset(x:0, y:CanaimageDim)
                .animation(
                    .linear(duration: 15)
                )
                .gesture(TapGesture().onEnded{
                    CanaimageDim = 225

                    // SOUND 
                    /*
                    let oceanSound = Bundle.main.path(forResource: "ADDIOS2", ofType: "mp3")
                    player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: oceanSound!))
                    player.prepareToPlay()
                    player.play()
 */
                
                })
            
        }.frame(width: mainViewDim["x"], height: mainViewDim["y"])
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
