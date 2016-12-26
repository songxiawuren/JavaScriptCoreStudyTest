//
//  MyButton.h
//  JavaScriptCoreStudyTest
//
//  Created by byn on 2016/12/24.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface MyButton : UIButton

@property (nonatomic,weak) JSContext *context;
@property (nonatomic, strong) JSManagedValue *onClickHandler;
    //@property (nonatomic, strong) JSValue *onClickHandler;

- (void)configureOnClickHandler:(JSValue *)onClickHandler;

@end
