//
//  main.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/12.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([DKAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
