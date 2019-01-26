//
//  PlacesServicesTests.swift
//  AAPPTests
//
//  Created by Arthur Castro on 26/01/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//


import XCTest



fileprivate let requestHandlerMockupJson = """
{"html_attributions":[],"results":[{"geometry":{"location":{"lat":-33.8585683,"lng":151.2100387},"viewport":{"northeast":{"lat":-33.85722262010728,"lng":151.2112398798927},"southwest":{"lat":-33.85992227989272,"lng":151.2085402201073}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/bar-71.png","id":"8e980ad0c819c33cdb1cea31e72d654ca61a7065","name":"Cruise Bar, Restaurant & Events","opening_hours":{"open_now":false},"photos":[{"height":1134,"html_attributions":["<a href=\"https://maps.google.com/maps/contrib/112582655193348962755/photos\">A Google User</a>"],"photo_reference":"CmRaAAAAIHwuStkLE48mIKe_aPydzCPZOTIj6Ab2MjEilW5uKRVdZ43_AHFNn2imqOiTneReheeWvP9-Ci_VGn6UW-UQMygiIl7Bp--PH4fZbe_JJRgsUCnjpOKwsPX1HV5mGRN3EhCrzCnHIWA6w6iBKokA_4ASGhRHAJCnF6LbqLdnabSmh8LiUgi6Aw","width":2048}],"place_id":"ChIJi6C1MxquEmsR9-c-3O48ykI","plus_code":{"compound_code":"46R6+H2 The Rocks, New South Wales","global_code":"4RRH46R6+H2"},"price_level":2,"rating":4,"reference":"ChIJi6C1MxquEmsR9-c-3O48ykI","scope":"GOOGLE","types":["bar","restaurant","point_of_interest","food","establishment"],"user_ratings_total":711,"vicinity":"Level 1, 2 and 3, Overseas Passenger Terminal, Circular Quay West, NSW 2000, Circular Quay W, The Rocks"},{"geometry":{"location":{"lat":-33.8675921,"lng":151.2015849},"viewport":{"northeast":{"lat":-33.86624227010728,"lng":151.2029347298927},"southwest":{"lat":-33.86894192989272,"lng":151.2002350701073}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png","id":"a97f9fb468bcd26b68a23072a55af82d4b325e0d","name":"Australian Cruise Group","opening_hours":{"open_now":true},"photos":[{"height":417,"html_attributions":["<a href=\"https://maps.google.com/maps/contrib/110751364053842618118/photos\">Australian Cruise Group</a>"],"photo_reference":"CmRaAAAAPsfF36lbw1FrOeVMM3T6hnqG7tVJlyoE5eHWerOflcHQfsDVuUgxcUcNKGjPuraYVHma7RQarnCUHkB1n9iomw1styvc6dpRVN3V9ctzMZRJ-WMAue3CvswbwxaWNO1xEhB63kNoBQtCMxcWouTqb1BJGhQe-faYClwzZTQNdTMIaW_1C3YwFg","width":1334}],"place_id":"ChIJrTLr-GyuEmsRBfy61i59si0","plus_code":{"compound_code":"46J2+XJ Sydney, New South Wales","global_code":"4RRH46J2+XJ"},"rating":4.6,"reference":"ChIJrTLr-GyuEmsRBfy61i59si0","scope":"GOOGLE","types":["travel_agency","restaurant","point_of_interest","food","establishment"],"user_ratings_total":164,"vicinity":"32 The Promenade King Street Wharf 5, Sydney"},{"geometry":{"location":{"lat":-33.8675829,"lng":151.2016025},"viewport":{"northeast":{"lat":-33.86623307010728,"lng":151.2029523298927},"southwest":{"lat":-33.86893272989272,"lng":151.2002526701073}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png","id":"ce4ffe228ab7ad49bb050defe68b3d28cc879c4a","name":"Sydney Showboats","opening_hours":{"open_now":true},"photos":[{"height":3024,"html_attributions":["<a href=\"https://maps.google.com/maps/contrib/101220276595662877555/photos\">Milan Peyrac</a>"],"photo_reference":"CmRaAAAA82DRgQklyUP_GwNAy6-kcX9ErtEwt6Kau2gGJYWzusmG9vR-X624Tjx-qLjQjVMiw2zthidd2yjqMmQOEi9-AKkC4okme5dsOQOpbFpYF5bca8ZZ1jLcEt2nAYxQf41pEhC0QYO87K4uYl_RFOXWzR5aGhQlnkF82VdIlE_LF-4BDaX-2dvr0A","width":4032}],"place_id":"ChIJjRuIiTiuEmsRCHhYnrWiSok","plus_code":{"compound_code":"46J2+XJ Sydney, New South Wales","global_code":"4RRH46J2+XJ"},"rating":4.1,"reference":"ChIJjRuIiTiuEmsRCHhYnrWiSok","scope":"GOOGLE","types":["travel_agency","restaurant","point_of_interest","food","establishment"],"user_ratings_total":64,"vicinity":"32 The Promenade, King Street Wharf 5, Sydney"}],"status":"OK"}
"""


class PlacesServicesTest: XCTestCase {
    
    
    
    
    
    func testBrotherHoodRequesting(){
        RequestHandlerMockup.mockup = requestHandlerMockupJson
        PlacesServices.shared.requester = RequestHandlerMockup.self
        let _pin1 = Pin(name: "Cruise Bar, Restaurant & Events", latitude: -33.8585683, longitude: 151.2100387)
        let _pin2 = Pin(name: "Australian Cruise Group", latitude: -33.8675921, longitude: 151.2015849)
        let _pin3 = Pin(name: "Sydney Showboats", latitude: -33.8675829, longitude: 151.2016025)
        let arrayPins = [_pin1,_pin2,_pin3]
        PlacesServices.brotherHoods { (pins) in
            XCTAssertEqual(arrayPins, pins)
        }
        
    }
    
    
    
}
