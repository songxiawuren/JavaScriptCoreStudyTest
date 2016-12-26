//
//  MyPoint.h
//  JavaScriptCoreStudyTest
//
//  Created by byn on 2016/12/23.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class MyPoint;
@protocol MyPointExports <JSExport>

@property double x;
@property double y;

- (NSString *)description;

+ (MyPoint *)makePointWithX:(double)x y:(double)y;

@end

@interface MyPoint : NSObject <MyPointExports>

- (instancetype)initWithX:(double)x y:(double)y;

@end
