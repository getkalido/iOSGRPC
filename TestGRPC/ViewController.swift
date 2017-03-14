//
//  ViewController.swift
//  TestGRPC
//
//  Created by Theo Crous on 2017/03/02.
//  Copyright © 2017 Kalido. All rights reserved.
//

import UIKit

import kalido


extension KLDIdentifier {
    convenience init(id: Int64, version: UInt32) {
        self.init()
        self.id_p = id
        self.version = version
    }
}

class ViewController: UIViewController {
    let GRPC_BIND_ADDR = "grpc.kalido-api.com:20103"
    let GRPC_BIND_TOKEN = "KL-4b344ac2-face-42d6-8d1ef-321dd8c31405"
    
    private var service : KLDService!
    private var writer : GRXBufferedPipe!
    private var call : GRPCProtoCall!
    
    
    func nearby() {
        // Listen on nearby
        let options = KLDOptions()
        options.pageSize = 10
        options.pageNumber = 0
        //options.pageItemsArray.add(KLDIdentifier(id: 1116, version: 8888))
        //options.pageItemsArray.add(KLDIdentifier(id: 259107, version: 36604011))
        //options.pageItemsArray.add(KLDIdentifier(id: 777, version: 339852222))
        
        
        
        let xdate = CACurrentMediaTime()
        //- (GRPCProtoCall *)RPCTostreamNearbyWithRequest:(KLDOptions *)request eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler;
        let request = service.rpcTostreamNearby(withRequest: options) { (done: Bool, stream: KLDStream?, error: Error?) in
            if let error = error {
                print ("ERROR : \n \(error)\n")
            } else if let stream = stream {
                print("STREAM RECEIVED : \(stream.actionsArray_Count) items")
                for a in stream.actionsArray as NSArray as! [KLDAction] {
                    print("\n")
                    print("-- action : \(a.action.rawValue)")
                    print("  -- item : \(a.item.debugDescription)")
                    if a.action == KLDAction_ActionType.insert || a.action ==  KLDAction_ActionType.update {
                        if let nearby = try! a.payload.unpackMessageClass(KLDNearby.self) as? KLDNearby {
                            print("  -- unpk : \(nearby)")
                        }
                        
                    }
                }
                
                
                
                
                let ydate = CACurrentMediaTime()
                print ("TIME : \( ((ydate - xdate)*1000) )")
            }
            print()
        }
        
        request.requestHeaders["token"] = GRPC_BIND_TOKEN
        request.start()
    }
    
    
    
    
    func binearby() {
        // Listen on nearby
        let options = KLDOptions()
        options.pageSize = 10
        options.pageNumber = 0
        //options.pageItemsArray.add(KLDIdentifier(id: 1116, version: 8888))
        //options.pageItemsArray.add(KLDIdentifier(id: 259107, version: 36604011))
        //options.pageItemsArray.add(KLDIdentifier(id: 777, version: 339852222))
        
        
        
        //- (GRPCProtoCall *)RPCTostreamNearbyWithRequest:(KLDOptions *)request eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler;
        //- (GRPCProtoCall *)RPCToduplexStreamNearbyWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, KLDStream *_Nullable response, NSError *_Nullable error))eventHandler;

        //rpcToduplexstreamNearby WithRequestsWriter
        let xdate = CACurrentMediaTime()
        //let request = service.rpcTostreamNearby(withRequest: options) { (done: Bool, stream: KLDStream?, error: Error?) in
        
        
        
        /*
        
        
        call = service.RPCToduplexStreamNearbyWithRequestsWriter(withRequestsWriter: writer) { (done: Bool, stream: KLDStream?, error: Error?) in
            if let error = error {
                print ("ERROR : \n \(error)\n")
            } else if let stream = stream {
                print("STREAM RECEIVED : \(stream.actionsArray_Count) items")
                for a in stream.actionsArray as NSArray as! [KLDAction] {
                    print("\n")
                    print("-- action : \(a.action.rawValue)")
                    print("  -- item : \(a.item.debugDescription)")
                    if a.action == KLDAction_ActionType.insert || a.action ==  KLDAction_ActionType.update {
                        if let nearby = try! a.payload.unpackMessageClass(KLDNearby.self) as? KLDNearby {
                            print("  -- unpk : \(nearby)")
                        }
                        
                    }
                }
                
                
                
                
                let ydate = CACurrentMediaTime()
                print ("TIME : \( ((ydate - xdate)*1000) )")
            }
            print()
        }

        call.requestHeaders["token"] = GRPC_BIND_TOKEN
        call.start()*/
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    func authenticate() {
        // Authenticate
        let auth = KLDAuth()
        auth.token = GRPC_BIND_TOKEN
        //auth.deviceId = ""
        
        let xdate = CACurrentMediaTime()
        service.auth(withRequest: auth) { (status: KLDStatus?, error: Error?) in
            if let error = error {
                print ("ERROR : \n \(error)\n")
            } else if let status = status {
                print("STATUS : \(status)\n")
                let ydate = CACurrentMediaTime()
                print ("TIME : \( ((ydate - xdate)*1000) )")
                
                
                self.binearby()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GRPCCall.useInsecureConnections(forHost: GRPC_BIND_ADDR)
        service = KLDService(host: GRPC_BIND_ADDR)
        writer = GRXBufferedPipe()

        
        authenticate()
    }
}
