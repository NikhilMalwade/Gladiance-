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

//MARK: Node Config Model


struct nodeConfigModel : Decodable {
    let node_id : String?
    let config_version : String?
    let info : Info?
    let devices : [Devices]?
    let serviceices : [Serviceices]?

    enum CodingKeys: String, CodingKey {

        case node_id = "node_id"
        case config_version = "config_version"
        case info = "info"
        case devices = "devices"
        case serviceices = "Serviceices"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        node_id = try values.decodeIfPresent(String.self, forKey: .node_id)
        config_version = try values.decodeIfPresent(String.self, forKey: .config_version)
        info = try values.decodeIfPresent(Info.self, forKey: .info)
        devices = try values.decodeIfPresent([Devices].self, forKey: .devices)
        serviceices = try values.decodeIfPresent([Serviceices].self, forKey: .serviceices)
    }

}


struct Info : Decodable {
    let name : String?
    let fw_version : String?
    let type : String?
    let model : String?
    let project_name : String?
    let platform : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case fw_version = "fw_version"
        case type = "type"
        case model = "Model"
        case project_name = "project_name"
        case platform = "platform"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        fw_version = try values.decodeIfPresent(String.self, forKey: .fw_version)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        model = try values.decodeIfPresent(String.self, forKey: .model)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        platform = try values.decodeIfPresent(String.self, forKey: .platform)
    }

}

struct Devices : Decodable {
    let name : String?
    let type : String?
    let model : String?
    let attributes : [Attributes]?
    let primary : String?
    let params : [Params]?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case type = "type"
        case model = "Model"
        case attributes = "attributes"
        case primary = "primary"
        case params = "params"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        model = try values.decodeIfPresent(String.self, forKey: .model)
        attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
        primary = try values.decodeIfPresent(String.self, forKey: .primary)
        params = try values.decodeIfPresent([Params].self, forKey: .params)
    }

}

struct Serviceices : Decodable {
    let name : String?
    let type : String?
    let params : [Params]?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case type = "type"
        case params = "params"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        params = try values.decodeIfPresent([Params].self, forKey: .params)
    }

}

struct Attributes : Decodable {
    let name : String?
    let value : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case value = "value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }

}


struct Params : Decodable {
    let name : String?
    let type : String?
    let data_type : String?
    let properties : [String]?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case type = "type"
        case data_type = "data_type"
        case properties = "properties"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        data_type = try values.decodeIfPresent(String.self, forKey: .data_type)
        properties = try values.decodeIfPresent([String].self, forKey: .properties)
    }

}

//MARK: SceneListModel Model

struct SceneListModel : Decodable {
    let successful : Bool?
    let message : String?
    let tag : String?
    let tagType : String?
    let processToken : String?
    let objectTag : [ObjectTag]?

    enum CodingKeys: String, CodingKey {

        case successful = "Successful"
        case message = "Message"
        case tag = "Tag"
        case tagType = "TagType"
        case processToken = "ProcessToken"
        case objectTag = "ObjectTag"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        tag = try values.decodeIfPresent(String.self, forKey: .tag)
        tagType = try values.decodeIfPresent(String.self, forKey: .tagType)
        processToken = try values.decodeIfPresent(String.self, forKey: .processToken)
        objectTag = try values.decodeIfPresent([ObjectTag].self, forKey: .objectTag)
    }

}

struct ObjectTag : Decodable {
    let ref : Int?
    let name : String?
    let gAAProjectRef : Int?
    let code : String?
    let isSystemDefinedScene : Int?
    let gAAProjectSpaceTypeRef : Int?
    let gAAProjectSpaceTypeName : String?
    let gAAProjectName : String?
    let configurations : [Configurations]?

    enum CodingKeys: String, CodingKey {

        case ref = "Ref"
        case name = "Name"
        case gAAProjectRef = "GAAProjectRef"
        case code = "Code"
        case isSystemDefinedScene = "IsSystemDefinedScene"
        case gAAProjectSpaceTypeRef = "GAAProjectSpaceTypeRef"
        case gAAProjectSpaceTypeName = "GAAProjectSpaceTypeName"
        case gAAProjectName = "GAAProjectName"
        case configurations = "Configurations"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ref = try values.decodeIfPresent(Int.self, forKey: .ref)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        gAAProjectRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectRef)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        isSystemDefinedScene = try values.decodeIfPresent(Int.self, forKey: .isSystemDefinedScene)
        gAAProjectSpaceTypeRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeRef)
        gAAProjectSpaceTypeName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeName)
        gAAProjectName = try values.decodeIfPresent(String.self, forKey: .gAAProjectName)
        configurations = try values.decodeIfPresent([Configurations].self, forKey: .configurations)
    }

}

struct Configurations : Decodable {
    let gAAProjectSceneRef : Int?
    let gAAProjectSpaceTypePlannedDeviceConnectionRef : Int?
    let nodeConfigParamName : String?
    let value : String?
    let nodeConfigDeviceName : String?
    let gAAProjectSceneName : String?
    let gAAProjectSceneCode : String?
    let gAAProjectSpaceTypeRef : Int?
    let gAAProjectSpaceTypeName : String?
    let gAAProjectSpaceTypeAreaRef : Int?
    let gAAProjectSpaceTypeAreaName : String?
    let gAAProjectSpaceTypePlannedDeviceRef : Int?
    let gAAProjectSpaceTypePlannedDeviceName : String?
    let label : String?
    let outputDriverChannelRef : Int?
    let outputDriverChannelName : String?
    let gAAProjectRef : Int?
    let gAAProjectName : String?

    enum CodingKeys: String, CodingKey {

        case gAAProjectSceneRef = "GAAProjectSceneRef"
        case gAAProjectSpaceTypePlannedDeviceConnectionRef = "GAAProjectSpaceTypePlannedDeviceConnectionRef"
        case nodeConfigParamName = "NodeConfigParamName"
        case value = "Value"
        case nodeConfigDeviceName = "NodeConfigDeviceName"
        case gAAProjectSceneName = "GAAProjectSceneName"
        case gAAProjectSceneCode = "GAAProjectSceneCode"
        case gAAProjectSpaceTypeRef = "GAAProjectSpaceTypeRef"
        case gAAProjectSpaceTypeName = "GAAProjectSpaceTypeName"
        case gAAProjectSpaceTypeAreaRef = "GAAProjectSpaceTypeAreaRef"
        case gAAProjectSpaceTypeAreaName = "GAAProjectSpaceTypeAreaName"
        case gAAProjectSpaceTypePlannedDeviceRef = "GAAProjectSpaceTypePlannedDeviceRef"
        case gAAProjectSpaceTypePlannedDeviceName = "GAAProjectSpaceTypePlannedDeviceName"
        case label = "Label"
        case outputDriverChannelRef = "OutputDriverChannelRef"
        case outputDriverChannelName = "OutputDriverChannelName"
        case gAAProjectRef = "GAAProjectRef"
        case gAAProjectName = "GAAProjectName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gAAProjectSceneRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSceneRef)
        gAAProjectSpaceTypePlannedDeviceConnectionRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypePlannedDeviceConnectionRef)
        nodeConfigParamName = try values.decodeIfPresent(String.self, forKey: .nodeConfigParamName)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        nodeConfigDeviceName = try values.decodeIfPresent(String.self, forKey: .nodeConfigDeviceName)
        gAAProjectSceneName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSceneName)
        gAAProjectSceneCode = try values.decodeIfPresent(String.self, forKey: .gAAProjectSceneCode)
        gAAProjectSpaceTypeRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeRef)
        gAAProjectSpaceTypeName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeName)
        gAAProjectSpaceTypeAreaRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeAreaRef)
        gAAProjectSpaceTypeAreaName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeAreaName)
        gAAProjectSpaceTypePlannedDeviceRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypePlannedDeviceRef)
        gAAProjectSpaceTypePlannedDeviceName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypePlannedDeviceName)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        outputDriverChannelRef = try values.decodeIfPresent(Int.self, forKey: .outputDriverChannelRef)
        outputDriverChannelName = try values.decodeIfPresent(String.self, forKey: .outputDriverChannelName)
        gAAProjectRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectRef)
        gAAProjectName = try values.decodeIfPresent(String.self, forKey: .gAAProjectName)
    }

}


//MARK: schedulelist Model

struct schedulelistModel : Decodable {
    let successful : Bool?
    let message : String?
    let tag : String?
    let tagType : String?
    let processToken : String?
    let objectTag : [schedulelistObjectTag]?

    enum CodingKeys: String, CodingKey {

        case successful = "Successful"
        case message = "Message"
        case tag = "Tag"
        case tagType = "TagType"
        case processToken = "ProcessToken"
        case objectTag = "ObjectTag"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        successful = try values.decodeIfPresent(Bool.self, forKey: .successful)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        tag = try values.decodeIfPresent(String.self, forKey: .tag)
        tagType = try values.decodeIfPresent(String.self, forKey: .tagType)
        processToken = try values.decodeIfPresent(String.self, forKey: .processToken)
        objectTag = try values.decodeIfPresent([schedulelistObjectTag].self, forKey: .objectTag)
    }

}

struct schedulelistObjectTag : Decodable {
    let ref : Int?
    let name : String?
    let gAAProjectSpaceTypeRef : Int?
    let code : String?
    let isSystemDefinedSchedule : Int?
    let gAAProjectSpaceTypeName : String?
    let gAAProjectRef : Int?
    let gAAProjectName : String?
    let configurations : [schedulelistConfigurations]?
    let triggers : [Triggers]?

    enum CodingKeys: String, CodingKey {

        case ref = "Ref"
        case name = "Name"
        case gAAProjectSpaceTypeRef = "GAAProjectSpaceTypeRef"
        case code = "Code"
        case isSystemDefinedSchedule = "IsSystemDefinedSchedule"
        case gAAProjectSpaceTypeName = "GAAProjectSpaceTypeName"
        case gAAProjectRef = "GAAProjectRef"
        case gAAProjectName = "GAAProjectName"
        case configurations = "Configurations"
        case triggers = "Triggers"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ref = try values.decodeIfPresent(Int.self, forKey: .ref)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        gAAProjectSpaceTypeRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeRef)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        isSystemDefinedSchedule = try values.decodeIfPresent(Int.self, forKey: .isSystemDefinedSchedule)
        gAAProjectSpaceTypeName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeName)
        gAAProjectRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectRef)
        gAAProjectName = try values.decodeIfPresent(String.self, forKey: .gAAProjectName)
        configurations = try values.decodeIfPresent([schedulelistConfigurations].self, forKey: .configurations)
        triggers = try values.decodeIfPresent([Triggers].self, forKey: .triggers)
    }

}

struct schedulelistConfigurations : Decodable {
    let gAAProjectNodeScheduleRef : Int?
    let gAAProjectSpaceTypeRef : Int?
    let gAAProjectSpaceTypePlannedDeviceConnectionRef : Int?
    let nodeConfigParamName : String?
    let value : String?
    let nodeConfigDeviceName : String?
    let ref : Int?
    let gAAProjectNodeScheduleName : String?
    let gAAProjectNodeScheduleCode : String?
    let gAAProjectSpaceTypeName : String?
    let gAAProjectSpaceTypeAreaRef : Int?
    let gAAProjectSpaceTypeAreaName : String?
    let gAAProjectSpaceTypePlannedDeviceRef : Int?
    let gAAProjectSpaceTypePlannedDeviceName : String?
    let label : String?
    let outputDriverChannelRef : Int?
    let outputDriverChannelName : String?
    let gAAProjectRef : Int?
    let gAAProjectName : String?

    enum CodingKeys: String, CodingKey {

        case gAAProjectNodeScheduleRef = "GAAProjectNodeScheduleRef"
        case gAAProjectSpaceTypeRef = "GAAProjectSpaceTypeRef"
        case gAAProjectSpaceTypePlannedDeviceConnectionRef = "GAAProjectSpaceTypePlannedDeviceConnectionRef"
        case nodeConfigParamName = "NodeConfigParamName"
        case value = "Value"
        case nodeConfigDeviceName = "NodeConfigDeviceName"
        case ref = "Ref"
        case gAAProjectNodeScheduleName = "GAAProjectNodeScheduleName"
        case gAAProjectNodeScheduleCode = "GAAProjectNodeScheduleCode"
        case gAAProjectSpaceTypeName = "GAAProjectSpaceTypeName"
        case gAAProjectSpaceTypeAreaRef = "GAAProjectSpaceTypeAreaRef"
        case gAAProjectSpaceTypeAreaName = "GAAProjectSpaceTypeAreaName"
        case gAAProjectSpaceTypePlannedDeviceRef = "GAAProjectSpaceTypePlannedDeviceRef"
        case gAAProjectSpaceTypePlannedDeviceName = "GAAProjectSpaceTypePlannedDeviceName"
        case label = "Label"
        case outputDriverChannelRef = "OutputDriverChannelRef"
        case outputDriverChannelName = "OutputDriverChannelName"
        case gAAProjectRef = "GAAProjectRef"
        case gAAProjectName = "GAAProjectName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gAAProjectNodeScheduleRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectNodeScheduleRef)
        gAAProjectSpaceTypeRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeRef)
        gAAProjectSpaceTypePlannedDeviceConnectionRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypePlannedDeviceConnectionRef)
        nodeConfigParamName = try values.decodeIfPresent(String.self, forKey: .nodeConfigParamName)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        nodeConfigDeviceName = try values.decodeIfPresent(String.self, forKey: .nodeConfigDeviceName)
        ref = try values.decodeIfPresent(Int.self, forKey: .ref)
        gAAProjectNodeScheduleName = try values.decodeIfPresent(String.self, forKey: .gAAProjectNodeScheduleName)
        gAAProjectNodeScheduleCode = try values.decodeIfPresent(String.self, forKey: .gAAProjectNodeScheduleCode)
        gAAProjectSpaceTypeName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeName)
        gAAProjectSpaceTypeAreaRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypeAreaRef)
        gAAProjectSpaceTypeAreaName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypeAreaName)
        gAAProjectSpaceTypePlannedDeviceRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectSpaceTypePlannedDeviceRef)
        gAAProjectSpaceTypePlannedDeviceName = try values.decodeIfPresent(String.self, forKey: .gAAProjectSpaceTypePlannedDeviceName)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        outputDriverChannelRef = try values.decodeIfPresent(Int.self, forKey: .outputDriverChannelRef)
        outputDriverChannelName = try values.decodeIfPresent(String.self, forKey: .outputDriverChannelName)
        gAAProjectRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectRef)
        gAAProjectName = try values.decodeIfPresent(String.self, forKey: .gAAProjectName)
    }

}

struct Triggers : Decodable {
    let gAAProjectNodeScheduleRef : Int?
    let monday : Int?
    let tuesday : Int?
    let wednesday : Int?
    let thursday : Int?
    let friday : Int?
    let saturday : Int?
    let sunday : Int?
    let hour : Int?
    let minute : Int?
    let second : Int?
    let dayOfMonth : Int?
    let january : Int?
    let february : Int?
    let march : Int?
    let april : Int?
    let may : Int?
    let june : Int?
    let july : Int?
    let august : Int?
    let september : Int?
    let october : Int?
    let november : Int?
    let december : Int?
    let year : Int?
    let repeatEveryYear : Int?
    let d : Int?
    let m : Int?
    let dd : Int?
    let mm : String?
    let yy : Int?
    let r : Int?
    let representativeString : String?
    let entryIndex : Int?
    let gAAProjectNodeScheduleName : String?
    let gAAProjectNodeScheduleCode : String?
    let gAAProjectRef : Int?
    let gAAProjectName : String?

    enum CodingKeys: String, CodingKey {

        case gAAProjectNodeScheduleRef = "GAAProjectNodeScheduleRef"
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
        case hour = "Hour"
        case minute = "Minute"
        case second = "Second"
        case dayOfMonth = "DayOfMonth"
        case january = "January"
        case february = "February"
        case march = "March"
        case april = "April"
        case may = "May"
        case june = "June"
        case july = "July"
        case august = "August"
        case september = "September"
        case october = "October"
        case november = "November"
        case december = "December"
        case year = "Year"
        case repeatEveryYear = "RepeatEveryYear"
        case d = "d"
        case m = "m"
        case dd = "dd"
        case mm = "mm"
        case yy = "yy"
        case r = "r"
        case representativeString = "RepresentativeString"
        case entryIndex = "EntryIndex"
        case gAAProjectNodeScheduleName = "GAAProjectNodeScheduleName"
        case gAAProjectNodeScheduleCode = "GAAProjectNodeScheduleCode"
        case gAAProjectRef = "GAAProjectRef"
        case gAAProjectName = "GAAProjectName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gAAProjectNodeScheduleRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectNodeScheduleRef)
        monday = try values.decodeIfPresent(Int.self, forKey: .monday)
        tuesday = try values.decodeIfPresent(Int.self, forKey: .tuesday)
        wednesday = try values.decodeIfPresent(Int.self, forKey: .wednesday)
        thursday = try values.decodeIfPresent(Int.self, forKey: .thursday)
        friday = try values.decodeIfPresent(Int.self, forKey: .friday)
        saturday = try values.decodeIfPresent(Int.self, forKey: .saturday)
        sunday = try values.decodeIfPresent(Int.self, forKey: .sunday)
        hour = try values.decodeIfPresent(Int.self, forKey: .hour)
        minute = try values.decodeIfPresent(Int.self, forKey: .minute)
        second = try values.decodeIfPresent(Int.self, forKey: .second)
        dayOfMonth = try values.decodeIfPresent(Int.self, forKey: .dayOfMonth)
        january = try values.decodeIfPresent(Int.self, forKey: .january)
        february = try values.decodeIfPresent(Int.self, forKey: .february)
        march = try values.decodeIfPresent(Int.self, forKey: .march)
        april = try values.decodeIfPresent(Int.self, forKey: .april)
        may = try values.decodeIfPresent(Int.self, forKey: .may)
        june = try values.decodeIfPresent(Int.self, forKey: .june)
        july = try values.decodeIfPresent(Int.self, forKey: .july)
        august = try values.decodeIfPresent(Int.self, forKey: .august)
        september = try values.decodeIfPresent(Int.self, forKey: .september)
        october = try values.decodeIfPresent(Int.self, forKey: .october)
        november = try values.decodeIfPresent(Int.self, forKey: .november)
        december = try values.decodeIfPresent(Int.self, forKey: .december)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
        repeatEveryYear = try values.decodeIfPresent(Int.self, forKey: .repeatEveryYear)
        d = try values.decodeIfPresent(Int.self, forKey: .d)
        m = try values.decodeIfPresent(Int.self, forKey: .m)
        dd = try values.decodeIfPresent(Int.self, forKey: .dd)
        mm = try values.decodeIfPresent(String.self, forKey: .mm)
        yy = try values.decodeIfPresent(Int.self, forKey: .yy)
        r = try values.decodeIfPresent(Int.self, forKey: .r)
        representativeString = try values.decodeIfPresent(String.self, forKey: .representativeString)
        entryIndex = try values.decodeIfPresent(Int.self, forKey: .entryIndex)
        gAAProjectNodeScheduleName = try values.decodeIfPresent(String.self, forKey: .gAAProjectNodeScheduleName)
        gAAProjectNodeScheduleCode = try values.decodeIfPresent(String.self, forKey: .gAAProjectNodeScheduleCode)
        gAAProjectRef = try values.decodeIfPresent(Int.self, forKey: .gAAProjectRef)
        gAAProjectName = try values.decodeIfPresent(String.self, forKey: .gAAProjectName)
    }

}
