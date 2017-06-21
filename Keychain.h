//
//  Keychain.h
//  KeychainDemo
//
//  Created by Mahaboobsab Nadaf on 25/05/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Keychain : NSObject
{
    NSString * service;
    NSString * group;
}
-(id) initWithService:(NSString *) service_ withGroup:(NSString*)group_;

-(BOOL) insert:(NSString *)key : (NSData *)data;
-(BOOL) update:(NSString*)key :(NSData*) data;
-(BOOL) remove: (NSString*)key;
-(NSData*) find:(NSString*)key;
@end
