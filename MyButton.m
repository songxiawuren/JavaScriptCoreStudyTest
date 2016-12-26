//
//  MyButton.m
//  JavaScriptCoreStudyTest
//
//  Created by byn on 2016/12/24.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (void)configureOnClickHandler:(JSValue *)onClickHandler {
        //_onClickHandler = onClickHandler;
    _onClickHandler = [JSManagedValue managedValueWithValue:onClickHandler];
    [_context.virtualMachine addManagedReference:_onClickHandler withOwner:self];
    
    NSLog(@"context virtual machine in MyButton: %@",_context.virtualMachine);
}

@end
