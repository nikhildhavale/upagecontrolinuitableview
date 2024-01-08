//
//  SwiftUIView.swift
//  CheckPage
//
//  Created by nikhil on 05/01/24.
//

import SwiftUI

struct SwiftUIView: View {
    let pageControl = PageControl()

    var body: some View {
        List{
            Section{
                HStack{
                    Spacer()
                    TabView{
                        ForEach(pageControl.array, id:\.self)
                        { text in
                            Image(text).frame(height: 200).aspectRatio(1, contentMode: .fit).clipped().scaledToFill()
                        }
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                        .indexViewStyle(PageIndexViewStyle()).frame(height: 300)
                    Spacer()

                }
               
            }
            ForEach(pageControl.array, id:\.self)
            { text in
                Section{
                    Text(text)
                }

            }
        }
       
       
    }
}
class PageControl:ObservableObject
{
    let array = ["gallery_1","gallery_2","gallery_3","gallery_4","gallery_5"]
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
class SwiftUIHostingController:UIHostingController<SwiftUIView>
{
    static func getHostingController() -> SwiftUIHostingController
    {
        let swiftUIView =  SwiftUIView()
        let controller = SwiftUIHostingController(rootView: swiftUIView)
        return controller
    }
}
