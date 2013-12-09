//
//  ADBAppDelegate.m
//  ADBStateMachine
//
//  Created by Alberto De Bortoli on 09/12/2013.
//  Copyright (c) 2013 Alberto De Bortoli. All rights reserved.
//

#import "ADBAppDelegate.h"

#import "ADBStateMachine.h"

@implementation ADBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    ADBStateMachine *stateMachine = [[ADBStateMachine alloc] initWithInitialState:@"Idle"];
    
    ADBStateMachineTransition *t1 = [[ADBStateMachineTransition alloc] initWithEvent:@"e1"
                                                                           fromState:@"Idle"
                                                                             toState:@"Start"
                                                                            preBlock:^{
                                                                                NSLog(@"Gonna move from Idle to Start!");
                                                                            } postBlock:^{
                                                                                NSLog(@"Just moved from Idle to Start!");
                                                                            }];

    ADBStateMachineTransition *t2 = [[ADBStateMachineTransition alloc] initWithEvent:@"e2"
                                                                           fromState:@"Start"
                                                                             toState:@"Idle"
                                                                            preBlock:^{
                                                                                NSLog(@"Gonna move from Start to Idle!");
                                                                            } postBlock:^{
                                                                                NSLog(@"Just moved from Start to Idle!");
                                                                            }];

    ADBStateMachineTransition *t3 = [[ADBStateMachineTransition alloc] initWithEvent:@"e3"
                                                                           fromState:@"Start"
                                                                             toState:@"Running"
                                                                            preBlock:^{
                                                                                NSLog(@"Gonna move from Start to Running!");
                                                                            } postBlock:^{
                                                                                NSLog(@"Just moved from Start to Running!");
                                                                            }];

    ADBStateMachineTransition *t4 = [[ADBStateMachineTransition alloc] initWithEvent:@"e2"
                                                                           fromState:@"Running"
                                                                             toState:@"Idle"
                                                                            preBlock:^{
                                                                                NSLog(@"Gonna move from Running to Idle!");
                                                                            } postBlock:^{
                                                                                NSLog(@"Just moved from Running to Idle!");
                                                                            }];
    
    [stateMachine addTransition:t1];
    [stateMachine addTransition:t2];
    [stateMachine addTransition:t3];
    [stateMachine addTransition:t4];
    
    [stateMachine processEvent:@"e1"];
    [stateMachine processEvent:@"e2"];
    [stateMachine processEvent:@"e1"];
    [stateMachine processEvent:@"e2"];
    [stateMachine processEvent:@"e1"];
    [stateMachine processEvent:@"e3"];
    [stateMachine processEvent:@"e1"];
    [stateMachine processEvent:@"e2"];
    
    return YES;
}

@end