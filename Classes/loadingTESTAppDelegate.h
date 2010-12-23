//
//  loadingTESTAppDelegate.h
//  loadingTEST
//
//  Created by moeZ on 12/23/10.
//  Copyright 2010 w00ty Lab. All rights reserved.
//  You're free to use the following code. Just say "hi" to me if you do

#import <UIKit/UIKit.h>

@class loadingTESTViewController;

@interface loadingTESTAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    loadingTESTViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet loadingTESTViewController *viewController;

@end

