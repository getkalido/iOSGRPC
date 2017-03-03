//
//  ViewController.swift
//  TestGRPC
//
//  Created by Theo Crous on 2017/03/02.
//  Copyright © 2017 Kalido. All rights reserved.
//

import UIKit

import kalido

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let RemoteHost = "grpc-test.sandbox.googleapis.com"
        
        let request = KALFetchOptions()
        request.limit = 20

        //request.responseSize = 10
        //request.fillUsername = true
        //request.fillOauthScope = true
        
    
        // Example gRPC call using a generated proto client library:
        let service = KALKalidoService(host: RemoteHost)
        
        
        
        /*
        
        service.unaryCallWithRequest(request) { response, error in
            if let response = response {
                NSLog("1. Finished successfully with response:\n\(response)")
            } else {
                NSLog("1. Finished with error: \(error!)")
            }
        }*/
        
        /*
        // Same but manipulating headers:
        var RPC : GRPCProtoCall! // Needed to convince Swift to capture by reference (__block)
        RPC = service.RPCToUnaryCallWithRequest(request) { response, error in
            if let response = response {
                NSLog("2. Finished successfully with response:\n\(response)")
            } else {
                NSLog("2. Finished with error: \(error!)")
            }
            NSLog("2. Response headers: \(RPC.responseHeaders)")
            NSLog("2. Response trailers: \(RPC.responseTrailers)")
        }
        
        // TODO(jcanizales): Revert to using subscript syntax once XCode 8 is released.
        RPC.requestHeaders.setObject("My value", forKey: "My-Header")
        
        RPC.start()
        
        
        // Same example call using the generic gRPC client library:
        let method = GRPCProtoMethod(package: "grpc.testing", service: "TestService", method: "UnaryCall")
        
        let requestsWriter = GRXWriter(value: request.data())
        
        let call = GRPCCall(host: RemoteHost, path: method.HTTPPath, requestsWriter: requestsWriter)
        
        call.requestHeaders.setObject("My value", forKey: "My-Header")
        
        call.startWithWriteable(GRXWriteable { response, error in
            if let response = response as? NSData {
                NSLog("3. Received response:\n\(try! RMTSimpleResponse(data: response))")
            } else {
                NSLog("3. Finished with error: \(error!)")
            }
            NSLog("3. Response headers: \(call.responseHeaders)")
            NSLog("3. Response trailers: \(call.responseTrailers)")
        })
 
 */
    }
}
