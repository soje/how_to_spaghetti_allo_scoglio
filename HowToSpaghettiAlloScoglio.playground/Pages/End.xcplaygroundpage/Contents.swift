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
    @State private var quote5Pos:[String:CGFloat] = ["x": CGFloat(0), "y": CGFloat(0)]
    @State private var quote6Pos:[String:CGFloat] = ["x": CGFloat(0), "y": CGFloat(700)]
    @State private var player:AVAudioPlayer!
    @State private var playAudio = false
    
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
            
            Image(uiImage: UIImage(named: "quote-5")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 600)
                .offset(x:quote5Pos["x"]!, y:quote5Pos["y"]!)
                .animation(
                    .easeOut(duration: 1.5).delay(7)
                )
            
            Image(uiImage: UIImage(named: "quote-6")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 600)
                .offset(x:quote6Pos["x"]!, y:quote6Pos["y"]!)
                .animation(
                    .easeOut(duration: 1.5).delay(7)
                )
            
        }.frame(width: mainViewDim["x"], height: mainViewDim["y"])
        .gesture(TapGesture().onEnded{
                CanaimageDim = 225
                quote5Pos["y"] = 200
                quote6Pos["y"] = 345
                
            // SOUND
            if(!playAudio){
                let oceanSound = Bundle.main.path(forResource: "page-four-sound", ofType: "mp3")
                player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: oceanSound!))
                player.prepareToPlay()
                player.volume = 70
                player.play()
                playAudio = true
                }
            
        })
        
    }
}
    
PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
