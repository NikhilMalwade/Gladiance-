//
//  Model.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 07/05/24.
//

import Foundation


struct UserDataModel : Codable {
    let successful : Bool?
    let message : String?
    let loginToken : String?
    let userTypes : [String]?
    let userDisplayName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case successful = "Successful"
        case message = "Message"
        case loginToken = "LoginToken"
        case userTypes = "UserTypes"
        case userDisplayName = "UserDisplayName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        loginToken = try values.decodeIfPresent(String.self, forKey: .loginToken)
        userTypes = try values.decodeIfPresent([String].self, forKey: .userTypes)
        userDisplayName = try values.decodeIfPresent(String.self, forKey: .userDisplayName)
    }
    
}
//MARK: Login Landing Data Model
public struct LoginLandingData : Decodable {
    let successful : Bool?
    let message : String?
    let data : Data?
    
    enum CodingKeys: String, CodingKey {
        
        case successful = "Successful"
        case message = "Message"
        case data = "Data"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
    }
    
}

public struct Data : Decodable {
    let version : String?
    let projects : [Projects]?
    let spaces : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case version = "Version"
        case projects = "Projects"
        case spaces = "Spaces"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        projects = try values.decodeIfPresent([Projects].self, forKey: .projects)
        spaces = try values.decodeIfPresent([String].self, forKey: .spaces)
    }
    
}


public struct Projects : Decodable {
    let gAAProjectRef : Int?
    let gAAProjectName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case gAAProjectRef = "GAAProjectRef"
        case gAAProjectName = "GAAProjectName"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gAAProjectRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectRef)
        gAAProjectName = try values.decodeIfPresent(String.self, forKey: .gAAProjectName)
    }
    
}


//MARK: Product Landing Data Model


struct ProductLandingModel : Decodable {
    let successful : Bool?
    let message : String?
    let data : ProductDataModel?

    enum CodingKeys: String, CodingKey {

        case successful = "Successful"
        case message = "Message"
        case data = "Data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(ProductDataModel.self, forKey: .data)
    }

}

struct ProductDataModel : Decodable {
    let version : String?
    let gAAProjectRef : Int?
    let gAAProjectName : String?
    let spaceGroups : [ProductSpaceGroups]?

    enum CodingKeys: String, CodingKey {

        case version = "Version"
        case gAAProjectRef = "GAAProjectRef"
        case gAAProjectName = "GAAProjectName"
        case spaceGroups = "SpaceGroups"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        gAAProjectRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectRef)
        gAAProjectName = try values.decodeIfPresent(String.self, forKey: .gAAProjectName)
        spaceGroups = try values.decodeIfPresent([ProductSpaceGroups].self, forKey: .spaceGroups)
    }

}

struct ProductSpaceGroups : Decodable {
    let gAAProjectSpaceGroupRef : Int?
    let gAAProjectSpaceGroupName : String?
    let displayOrder : Int?

    enum CodingKeys: String, CodingKey {

        case gAAProjectSpaceGroupRef = "GAAProjectSpaceGroupRef"
        case gAAProjectSpaceGroupName = "GAAProjectSpaceGroupName"
        case displayOrder = "DisplayOrder"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gAAProjectSpaceGroupRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceGroupRef)
        gAAProjectSpaceGroupName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceGroupName)
        displayOrder = try values.decodeIfPresent(Int.self, forKey: .displayOrder)
    }

}

//MARK: Space Group Landing Model

struct SpaceGroupLandingModel : Decodable {
    let successful : Bool?
    let message : String?
    let data : DataModelSpaceGroup?
    
    enum CodingKeys: String, CodingKey {
        
        case successful = "Successful"
        case message = "Message"
        case data = "Data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(DataModelSpaceGroup.self, forKey: .data)
    }
    
}

struct DataModelSpaceGroup : Decodable {
    let version : String?
    let gAAProjectSpaceGroupRef : Int?
    let gAAProjectSpaceGroupName : String?
    let spaces : [Spaces]?
    
    enum CodingKeys: String, CodingKey {
        
        case version = "Version"
        case gAAProjectSpaceGroupRef = "GAAProjectSpaceGroupRef"
        case gAAProjectSpaceGroupName = "GAAProjectSpaceGroupName"
        case spaces = "Spaces"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        gAAProjectSpaceGroupRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceGroupRef)
        gAAProjectSpaceGroupName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceGroupName)
        spaces = try values.decodeIfPresent([Spaces].self, forKey: .spaces)
    }
    
}

struct Spaces : Decodable {
    let gAAProjectSpaceRef : Int?
    let gAAProjectSpaceName : String?
    let gAAProjectSpaceTypeRef : Int?
    let gAAProjectSpaceTypeName : String?
    let displayOrder : Int?
    let description : String?
    
    enum CodingKeys: String, CodingKey {
        
        case gAAProjectSpaceRef = "GAAProjectSpaceRef"
        case gAAProjectSpaceName = "GAAProjectSpaceName"
        case gAAProjectSpaceTypeRef = "GAAProjectSpaceTypeRef"
        case gAAProjectSpaceTypeName = "GAAProjectSpaceTypeName"
        case displayOrder = "DisplayOrder"
        case description = "Description"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gAAProjectSpaceRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceRef)
        gAAProjectSpaceName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceName)
        gAAProjectSpaceTypeRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeRef)
        gAAProjectSpaceTypeName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeName)
        displayOrder = try values.decodeIfPresent(Int.self, forKey: .displayOrder)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }
    
}

//MARK: Space Group Landing Model


struct SpaceLandingModel : Decodable {
    let successful : Bool?
    let message : String?
    let data : DataModelSpace?

    enum CodingKeys: String, CodingKey {

        case successful = "Successful"
        case message = "Message"
        case data = "Data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(DataModelSpace.self, forKey: .data)
    }

}

struct DataModelSpace : Codable {
    let version : String?
    let gAAProjectSpaceRef : Int?
    let gAAProjectSpaceName : String?
    let gAAProjectSpaceTypeRef : Int?
    let gAAProjectSpaceTypeName : String?
    let areas : [Areas]?

    enum CodingKeys: String, CodingKey {

        case version = "Version"
        case gAAProjectSpaceRef = "GAAProjectSpaceRef"
        case gAAProjectSpaceName = "GAAProjectSpaceName"
        case gAAProjectSpaceTypeRef = "GAAProjectSpaceTypeRef"
        case gAAProjectSpaceTypeName = "GAAProjectSpaceTypeName"
        case areas = "Areas"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        gAAProjectSpaceRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceRef)
        gAAProjectSpaceName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceName)
        gAAProjectSpaceTypeRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeRef)
        gAAProjectSpaceTypeName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeName)
        areas = try values.decodeIfPresent([Areas].self, forKey: .areas)
    }
}


struct Areas : Codable {
    let gAAProjectSpaceTypeAreaRef : Int?
    let gAAProjectSpaceTypeAreaName : String?
    let wifiSSID : String?
    let wifiPassword : String?

    enum CodingKeys: String, CodingKey {

        case gAAProjectSpaceTypeAreaRef = "GAAProjectSpaceTypeAreaRef"
        case gAAProjectSpaceTypeAreaName = "GAAProjectSpaceTypeAreaName"
        case wifiSSID = "WifiSSID"
        case wifiPassword = "WifiPassword"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gAAProjectSpaceTypeAreaRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeAreaRef)
        gAAProjectSpaceTypeAreaName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeAreaName)
        wifiSSID = try values.decodeIfPresent(String.self, forKey: .wifiSSID)
        wifiPassword = try values.decodeIfPresent(String.self, forKey: .wifiPassword)
    }

}


//MARK: areaLandingModel


struct areaLandingModel : Decodable {
    let successful : Bool?
    let message : String?
    let data : areaLandingDataModel?

    enum CodingKeys: String, CodingKey {

        case successful = "Successful"
        case message = "Message"
        case data = "Data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(areaLandingDataModel.self, forKey: .data)
    }

}


struct areaLandingDataModel : Decodable {
    let version : String?
    let gAAProjectSpaceRef : Int?
    let gAAProjectSpaceName : String?
    let gAAProjectSpaceTypeAreaRef : Int?
    let gAAProjectSpaceTypeAreaName : String?
    let wifiSSID : String?
    let wifiPassword : String?
    let guestControls : [GuestControls]?

    enum CodingKeys: String, CodingKey {

        case version = "Version"
        case gAAProjectSpaceRef = "GAAProjectSpaceRef"
        case gAAProjectSpaceName = "GAAProjectSpaceName"
        case gAAProjectSpaceTypeAreaRef = "GAAProjectSpaceTypeAreaRef"
        case gAAProjectSpaceTypeAreaName = "GAAProjectSpaceTypeAreaName"
        case wifiSSID = "WifiSSID"
        case wifiPassword = "WifiPassword"
        case guestControls = "GuestControls"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        gAAProjectSpaceRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceRef)
        gAAProjectSpaceName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceName)
        gAAProjectSpaceTypeAreaRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeAreaRef)
        gAAProjectSpaceTypeAreaName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeAreaName)
        wifiSSID = try values.decodeIfPresent(String.self, forKey: .wifiSSID)
        wifiPassword = try values.decodeIfPresent(String.self, forKey: .wifiPassword)
        guestControls = try values.decodeIfPresent([GuestControls].self, forKey: .guestControls)
    }

}

struct GuestControls : Decodable {
    let controlTypeRef : Int?
    let controlTypeName : String?
    let controls : [Controls]?

    enum CodingKeys: String, CodingKey {

        case controlTypeRef = "ControlTypeRef"
        case controlTypeName = "ControlTypeName"
        case controls = "Controls"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        controlTypeRef = try values.decodeIfPresent(Int.self, forKey: .controlTypeRef)
        controlTypeName = try values.decodeIfPresent(String.self, forKey: .controlTypeName)
        controls = try values.decodeIfPresent([Controls].self, forKey: .controls)
    }

}


struct Controls : Decodable {
    let label : String?
    let nodeId : String?
    let internalDeviceName : String?
    let displayOrder : Int?
    let gAAProjectSpaceTypePlannedDeviceRef : Int?
    let gAAProjectSpaceTypePlannedDeviceName : String?

    enum CodingKeys: String, CodingKey {

        case label = "Label"
        case nodeId = "NodeId"
        case internalDeviceName = "InternalDeviceName"
        case displayOrder = "DisplayOrder"
        case gAAProjectSpaceTypePlannedDeviceRef = "GAAProjectSpaceTypePlannedDeviceRef"
        case gAAProjectSpaceTypePlannedDeviceName = "GAAProjectSpaceTypePlannedDeviceName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        internalDeviceName = try values.decodeIfPresent(String.self, forKey: .internalDeviceName)
        displayOrder = try values.decodeIfPresent(Int.self, forKey: .displayOrder)
        gAAProjectSpaceTypePlannedDeviceRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypePlannedDeviceRef)
        gAAProjectSpaceTypePlannedDeviceName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypePlannedDeviceName)
    }

}
