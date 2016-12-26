//
//  ViewController.m
//  JavaScriptCoreStudyTest
//
//  Created by byn on 2016/12/23.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "ViewController.h"
#import "MyPoint.h"
#import "MyButton.h"

#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()

@property (nonatomic, weak) id weakMyButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    JSContext *context = [[JSContext alloc] init];
    context = [[JSContext alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"factorial" ofType:@"js"];
    NSString *factorialScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"factorialScript : %@",factorialScript);
    [context evaluateScript:factorialScript];
    JSValue *function = context[@"factorial"];
    NSLog(@"function: %@",function);
    JSValue *result = [function callWithArguments:@[@5]];
    NSLog(@"factorial(5) = %d", [result toInt32]);
    
    context[@"useBlock"] = ^(NSString *word) {
        NSLog(@"useBlock : %@",word);
    };
    
    context[@"log"] = ^(NSString *log) {
        NSLog(@"%@",log);
    };
    
    JSValue *useBlockInJS = context[@"useBlockInJS"];
    [useBlockInJS callWithArguments:@[@"useBlockInJS"]];
    
    NSString *geometryScriptPath = [[NSBundle mainBundle] pathForResource:@"geometry" ofType:@"js"];
    NSString *geometryScript = [NSString stringWithContentsOfFile:geometryScriptPath encoding:NSUTF8StringEncoding error:nil];
    [context evaluateScript:geometryScript];
    
    MyPoint *point1 = [[MyPoint alloc] initWithX:10.0 y:50.0];
    MyPoint *point2 = [[MyPoint alloc] initWithX:13.0 y:53.0];
    
    JSValue *euclideanDistanceFunction = context[@"euclideanDistance"];
    JSValue *euclideanDistanceResult = [euclideanDistanceFunction callWithArguments:@[point1,point2]];
    NSLog(@"euclideanDistanceResult : %f",[euclideanDistanceResult toDouble]);
    //如果想在js中使用整个类，只需要把类赋给context，如下：
    context[@"MyPoint"] = [MyPoint class];
    
    JSValue *midpointFunction = context[@"midpoint"];
    JSValue *jsResult = [midpointFunction callWithArguments:@[point1, point2]];
    MyPoint *midpoint = [jsResult toObject];
    NSLog(@"midpoint's x: %f, midpoint's y: %f",midpoint.x,midpoint.y);
    
    NSString *clickHandlerPath = [[NSBundle mainBundle] pathForResource:@"clickhandler" ofType:@"js"];
    NSString *clickHandlerScript = [NSString stringWithContentsOfFile:clickHandlerPath encoding:NSUTF8StringEncoding error:nil];
    [context evaluateScript:clickHandlerScript];
    
        //id __weak weakMyButton = nil;
    
    {
        JSValue *clickHandlerFunction = context[@"ClickHandler"];
        MyButton *button = [[MyButton alloc] init];
        button.context = context;
        _weakMyButton = button;
        NSLog(@"weakMyButton in range: %@",_weakMyButton);
        NSLog(@"jscontext virtualMachine: %@",context.virtualMachine);
        [button configureOnClickHandler:[clickHandlerFunction callWithArguments:@[button,^{
            NSLog(@"clicked");
        }]]];
        
    }
    
    NSLog(@"weakMyButton out of range: %@",_weakMyButton);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self checkButton];
    });
}

- (void)checkButton {
    NSLog(@"weakMyButton in checkButton: %@",_weakMyButton);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








































@end
