//
//  MyPoint.m
//  JavaScriptCoreStudyTest
//
//  Created by byn on 2016/12/23.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "MyPoint.h"

@interface MyPoint()

- (void)myPrivateMethod; // not visible to JavaScript code.

@end

@implementation MyPoint

@synthesize x = _x;
@synthesize y = _y;

- (instancetype)initWithX:(double)x y:(double)y {
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
    }
    return self;
}

+ (MyPoint *)makePointWithX:(double)x y:(double)y {
    MyPoint *point = [[MyPoint alloc] init];
    point.x = x;
    point.y = y;
    NSLog(@"makePointWithX");
    return point;
}

- (void)myPrivateMethod {
    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"description, x:%f,y:%f",self.x,self.y];
}

@end
