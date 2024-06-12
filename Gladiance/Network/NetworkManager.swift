//
//  NetworkManager.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 07/05/24.
//

import Foundation

enum ApiNodes:String {
    case ProdBaseURL = "https://api.gladiance.one/gladiancecloud-web-api/mobileapp/"
    case TestBaseURL = "https://enscloud.in/gladiancedev-gladiance-web-api/"
    
    case loginuser = "loginuser"
    case loginlandingpagedata = "loginlandingpagedata/"
    case NodeBaseUrl = "https://api.gladiance.one/gladiancecloud-web-api/"
}

let baseURL = ApiNodes.ProdBaseURL


