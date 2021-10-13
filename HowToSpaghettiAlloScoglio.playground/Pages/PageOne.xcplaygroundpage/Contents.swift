import UIKit
import SwiftUI
import PlaygroundSupport
import AVKit
import CoreGraphics

struct ContentView: View {
    
    @State private var mainViewDim = ["x": CGFloat(600), "y": CGFloat(450)]
    @State private var varchetellaDim = CGFloat(300)
    @State private var navicellaDim = CGFloat(0)
    
    @State private var cloudOnePos = ["x": CGFloat(270), "y": CGFloat(-300)]
    @State private var cloudTwoPos = ["x": CGFloat(100), "y": CGFloat(-370)]
    @State private var cloudThreePos = ["x": CGFloat(440), "y": CGFloat(-370)]
    
    @State private var navicellaPos = ["x": CGFloat(900), "y": CGFloat(100)]
    @State private var boatPos = ["x": CGFloat(-150), "y": CGFloat(280)]
    @State private var pirateOnePos = CGFloat(-45)
    @State private var pirateTwoPos = CGFloat(-45)
    @State private var pirateThreePos = CGFloat(-65)
    
    @State private var animDurationShip = Double(1)
    @State private var animDurationNavicella = Double(0.8)
    
    @State private var player: AVAudioPlayer!
    @State private var animation = 1

    var body: some View {
        GeometryReader { gp in
            // main container
            ZStack(alignment: .bottomLeading){
                
                // Faraglioni
                Image(uiImage: UIImage(named: "faraglioni.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, alignment: .topLeading)
                    .offset(x:370, y:-175)
                
                // Cloud 1
                Image(uiImage: UIImage(named: "cloud-1.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, alignment: .topLeading)
                    .offset(x: cloudOnePos["x"]!, y: cloudOnePos["y"]!)
                
                // Cloud 2
                Image(uiImage: UIImage(named: "cloud-2.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, alignment: .topLeading)
                    .offset(x:cloudTwoPos["x"]!, y:cloudTwoPos["y"]!)
                
                // Cloud 3
                Image(uiImage: UIImage(named: "cloud-2.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, alignment: .topLeading)
                    .offset(x:cloudThreePos["x"]!, y:cloudThreePos["y"]!)
                
                // Sea
                Image(uiImage: UIImage(named: "sea.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 602, alignment: .bottomLeading)
                    .offset(x:0, y:0)
                    .gesture(TapGesture().onEnded {
                        
                        //Lettore audio per i suoni
                        //let oceanSound = Bundle.main.path(forResource: "ocean", ofType: "mp3")
                        //player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: oceanSound!))
                        //player.prepareToPlay()
                        //player.play()
                        
      //                  boatPos["x"] = CGFloat(180)
                    })
                
                // Container for pirates and ship
                ZStack(alignment: .bottomLeading){
                    
                    Image(uiImage: UIImage(named: "pirate-3.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: 145, y: -45)
                        .gesture(TapGesture().onEnded {
    //                        navicellaPos["x"] = CGFloat(400)
    //                        navicellaDim = CGFloat(250)
                        })
                        .animation(
                            .linear(duration: 1)
                        )
                    
                    Image(uiImage: UIImage(named: "pirate-1.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: 180, y: -45)
                        .gesture(TapGesture().onEnded {
    //                        navicellaPos["x"] = CGFloat(400)
    //                        navicellaDim = CGFloat(250)
                        })
                        .animation(
                            .linear(duration: 1)
                        )
                    
                    Image(uiImage: UIImage(named: "pirate-2.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47)
                        .offset(x: 65, y: -65)
                        .gesture(TapGesture().onEnded {
    //                        navicellaPos["x"] = CGFloat(400)
    //                        navicellaDim = CGFloat(250)
                        })
                        .animation(
                            .linear(duration: 1)
                        )
                    
                    Image(uiImage: UIImage(named: "ship.png")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: varchetellaDim)
                        .gesture(TapGesture().onEnded {
    //                        navicellaPos["x"] = CGFloat(400)
    //                        navicellaDim = CGFloat(250)
                        })
                    
                }
                .position( x: boatPos["x"]!, y:boatPos["y"]! )
                .animation(
                    .linear(duration: animDurationShip)
                )
                
                // ufo
                Image(uiImage: UIImage(named: "navicella.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: navicellaDim, alignment: .topLeading)
                    .position(x: navicellaPos["x"]!, y: navicellaPos["y"]! )
                    .gesture(TapGesture().onEnded {
                        
                    })
                    .animation(
                        .linear(duration: animDurationNavicella)
                    )
                
                HStack(alignment: .bottom) {
                    
                    Spacer()
                        .frame(width: mainViewDim["x"], height: mainViewDim["y"])
                        .gesture(TapGesture().onEnded {
                            //nave che entra
                            print("evento animazione")
                            if(animation == 1){
                                print("anim1")
                                boatPos["x"] = CGFloat(180)
                            //pirati che zompettano
                            }else if(animation == 2){
                                print("anim2")
                                navicellaPos["x"] = CGFloat(400)
                                navicellaDim = CGFloat(250)
                            //alieni che arrivano
                            }else {
                                print("error")
                            }
                            
                            animation += 1
                            
                        })
                    
                }.frame(width: mainViewDim["x"], height: mainViewDim["y"])
                
            }
            .frame(width: mainViewDim["x"], height: mainViewDim["y"])
            .background(Color.init(red: 157/255, green: 220/255, blue: 249/255))
            
        }
        .frame(width: mainViewDim["x"], height: mainViewDim["y"])
        .onTapGesture {
            //nave che entra
            print("evento animazione")
            if(animation == 1){
                print("anim1")
                boatPos["x"] = CGFloat(180)
            //pirati che zompettano
            }else if(animation == 2){
                print("anim2")
                navicellaPos["x"] = CGFloat(400)
                navicellaDim = CGFloat(250)
            //alieni che arrivano
            }else {
                print("error")
            }
            
            animation += 1
        }
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
