//
//  loadingTESTViewController.h
//  loadingTEST
//
//  Created by moeZ on 12/23/10.
//  Copyright 2010 w00ty Lab. All rights reserved.
//  You're free to use the following code. Just say "hi" to me if you do

#import <UIKit/UIKit.h>
#import "activity.h"

@interface loadingTESTViewController : UIViewController {
	UIButton *ShowAlert;
	UIButton *ShowLoader;
}

- (IBAction) COMEON: (id) sender;

- (IBAction) ShowActivityIndicator: (id) sender;

@end

