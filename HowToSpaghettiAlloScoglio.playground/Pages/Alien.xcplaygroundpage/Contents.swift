//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics

struct ContentView: View {
    
    // Grandezza del canvas generale, non toccate
    @State private var mainViewDim = ["x": CGFloat(600), "y": CGFloat(450)]
    @State private var GreenPos = ["x": CGFloat(-110), "y": CGFloat(45)]
    @State private var YellowPos = ["x": CGFloat(-180), "y": CGFloat(100)]
    @State private var BluePos = ["x": CGFloat(-110), "y": CGFloat(145)]
    @State private var PirateOnePos = ["x": CGFloat(105), "y": CGFloat(40)]
    @State private var PirateTwoPos = ["x": CGFloat(190), "y": CGFloat(100)]
    @State private var PirateThreePos = ["x": CGFloat(100), "y": CGFloat(145)]
    @State private var SalsaPos = ["x": CGFloat(-150), "y": CGFloat(-900)]
    @State private var QuestionPos = ["x": CGFloat(600), "y": CGFloat(450)]
    @State private var SalsaSeaPos = ["x": CGFloat(0), "y": CGFloat(400)]
    @State private var Pirate1DPos = ["x": CGFloat(360), "y": CGFloat(70)]
    @State private var Alien2DPos = ["x": CGFloat(-360), "y": CGFloat(100)]
    @State private var Alien3DPos = ["x": CGFloat(360), "y": CGFloat(150)]
    @State private var Pirate2DPos = ["x": CGFloat(360), "y": CGFloat(30)]
    @State private var opacityQuestion: Double = 0
    @State private var opacityQuote3: Double = 1
    @State private var opacityQuote4: Double = 1
    @State private var Quote4Pos = ["x": CGFloat(0), "y": CGFloat(-100)]
    @State private var player: AVAudioPlayer!


    
    // Questa è la vista
    var body: some View {
        
        GeometryReader { gp in
            
            // Container generale non toccate
            // Tutti i Widget che vengono inseriti nello zstack
            // sono visualizzati uno sull'altro, il primo si trova nell'ultimo piano
            // l'ultimo si trova in primo piano
            ZStack {
                
                // Background ship
                Image(uiImage: UIImage(named: "background-ship.jpg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 660, alignment: .topLeading)
                    .offset(x:0, y:0)
                
                // Green alien
                Image(uiImage: UIImage(named: "alien-1.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, alignment: .topLeading)
                    .offset(x: GreenPos["x"]!, y: GreenPos["y"]!)
                    .animation(
                        .linear(duration: 0.1)
                        .repeatCount(49)
                    )
                
                // Yellow alien
                Image(uiImage: UIImage(named: "alien-2.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, alignment: .topLeading)
                    .offset(x: YellowPos["x"]!, y: YellowPos["y"]!)
                    .animation(
                        .linear(duration: 0.1)
                        .repeatCount(49)
                    )
                
                // Blue alien
                Image(uiImage: UIImage(named: "alien-3.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, alignment: .topLeading)
                    .offset(x: BluePos["x"]!, y: BluePos["y"]!)
                    .animation(
                        .linear(duration: 0.1)
                        .repeatCount(49)
                    )
                
                // Pirate 1
                Image(uiImage: UIImage(named: "pirate-3.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .frame(width: 83, alignment: .topLeading)
                    .offset(x: PirateOnePos["x"]!, y: PirateOnePos["y"]!)
                    .animation(
                        .linear(duration: 0.6)
                        .repeatCount(9)
                    )

                // Pirate 2
                Image(uiImage: UIImage(named: "pirate-1.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .frame(width: 83, alignment: .topLeading)
                    .offset(x: PirateTwoPos["x"]!, y: PirateTwoPos["y"]!)
                    .animation(
                        .linear(duration: 0.5)
                        .repeatCount(11)
                    )
                
                // Pirate 3
                Image(uiImage: UIImage(named: "pirate-2.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .frame(width: 83, alignment: .topLeading)
                    .offset(x: PirateThreePos["x"]!, y: PirateThreePos["y"]!)
                    .animation(
                        .linear(duration: 0.4)
                        .repeatCount(11)
                    )
                
                // Salsa
                Image(uiImage: UIImage(named: "souce_1.png")!)
                    .resizable()
                    .frame(width: 220, height: 1350)
                    .offset(x: SalsaPos["x"]!, y: SalsaPos["y"]!)
                    .animation(
                        .linear(duration: 3).delay(7)
                        )
                
                // Question mark
                Image(uiImage: UIImage(named: "question-mark.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600, alignment: .topLeading)
                    .offset(x:0, y:0)
                    .opacity(opacityQuestion)
                    .animation(
                        .linear(duration: 0.2).delay(8)
                        )
                
            
            ZStack {
                // Salsa Sea
                Image(uiImage: UIImage(named: "salsa_2.png")!)
                    .resizable()
                    .frame(width: 600, height: 330)
                    .offset(x: SalsaSeaPos["x"]!, y: SalsaSeaPos["y"]!)
                    .animation(
                        .linear(duration: 3).delay(9)
                        )
                
                // Pirate 2 dead
                Image(uiImage: UIImage(named: "pirate-2d.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .frame(width: 100, alignment: .topLeading)
                    .offset(x: Pirate2DPos["x"]!, y: Pirate2DPos["y"]!)
                    .animation(
                        .linear(duration: 8).delay(14)
                        )
                
                // Pirate 1 dead
                Image(uiImage: UIImage(named: "pirate-1d.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, alignment: .topLeading)
                    .offset(x: Pirate1DPos["x"]!, y: Pirate1DPos["y"]!)
                    .animation(
                        .linear(duration: 9).delay(13)
                        )
                
                // Alien 2 dead
                Image(uiImage: UIImage(named: "alien-2d.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, alignment: .topLeading)
                    .offset(x: Alien2DPos["x"]!, y: Alien2DPos["y"]!)
                    .animation(
                        .linear(duration: 9).delay(14)
                        )
                
                // Alien 3 dead
                Image(uiImage: UIImage(named: "alien-3d.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, alignment: .topLeading)
                    .offset(x: Alien3DPos["x"]!, y: Alien3DPos["y"]!)
                    .animation(
                        .linear(duration: 7).delay(16)
                        )

                // Quote 4
                Image(uiImage: UIImage(named: "quote-4.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600, alignment: .topLeading)
                    .offset(x: Quote4Pos["x"]!, y: Quote4Pos["y"]!)
                    .opacity(opacityQuote4)
                    .animation(
                        .easeInOut(duration: 2).delay(5)
                        )
                
                // Quote 3
                Image(uiImage: UIImage(named: "quote-3.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600, alignment: .topLeading)
                    .offset(x:0, y:0)
                    .opacity(opacityQuote3)
                    .animation(
                        .easeOut(duration: 1).delay(5)
                        )
                

            }
                
                
                // Esempio di Testo
                // Text("Hello Playground!")
                
                
                
            }.frame(width: mainViewDim["x"], height: mainViewDim["y"])
            
        }.gesture(TapGesture().onEnded{
            
            let fightSound = Bundle.main.path(forResource: "fight-sound", ofType: "mp3")
            player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: fightSound!))
            player.prepareToPlay()
            player.volume = 70
            player.play()
            
            GreenPos["x"] = CGFloat(-100)
            YellowPos["x"] = CGFloat(-190)
            BluePos["x"] = CGFloat(-100)
            PirateOnePos["x"] = CGFloat(115)
            PirateTwoPos["x"] = CGFloat(180)
            PirateThreePos["x"] = CGFloat(110)
            SalsaPos["y"] = CGFloat(0)
            SalsaSeaPos["y"] = CGFloat(115)
            Pirate1DPos["x"] = CGFloat(-350)
            Pirate2DPos["x"] = CGFloat(-350)
            Alien2DPos["x"] = CGFloat(350)
            Alien3DPos["x"] = CGFloat(-350)
            opacityQuestion = 1
            opacityQuote3 = 0
            Quote4Pos["y"] = CGFloat(3)
            
        })
        .frame(width: mainViewDim["x"], height: mainViewDim["y"])
        
        

    
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
