//
//  GPXParser.m
//  GPX Framework
//
//  Created by NextBusinessSystem on 12/04/06.
//  Copyright (c) 2012 NextBusinessSystem Co., Ltd. All rights reserved.
//

#import "GPXParser.h"
#import "GPXConst.h"
#import "GPXElementSubclass.h"
#import "GPXRoot.h"
#import "TBXML.h"

@implementation GPXParser


#pragma mark - Instance

+ (GPXRoot *)parseGPXAtURL:(NSURL *)url error:(NSError **)error
{
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return  [self parseGPXWithData:data error:error];
}

+ (GPXRoot *)parseGPXAtPath:(NSString *)path error:(NSError **)error
{
    NSURL *url = [NSURL fileURLWithPath:path];
    return [GPXParser parseGPXAtURL:url error:error];
}

+ (GPXRoot *)parseGPXWithString:(NSString*)string error:(NSError **)error
{
    TBXML *xml = [[TBXML alloc] initWithXMLString:string error:error];
    if (xml.rootXMLElement) {
        return [[GPXRoot alloc] initWithXMLElement:xml.rootXMLElement parent:nil];
    }
    
    return nil;
}

+ (GPXRoot *)parseGPXWithData:(NSData*)data error:(NSError **)error
{
    TBXML *xml = [[TBXML alloc] initWithXMLData:data error:error];
    if (xml.rootXMLElement) {
        return [[GPXRoot alloc] initWithXMLElement:xml.rootXMLElement parent:nil];
    }
    
    return nil;
}

@end
