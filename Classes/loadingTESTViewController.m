//
//  loadingTESTViewController.m
//  loadingTEST
//
//  Created by moeZ on 12/23/10.
//  Copyright 2010 w00ty Lab. All rights reserved.
//  You're free to use the following code. Just say "hi" to me if you do

#import "loadingTESTViewController.h"
#import "activity.h"

@implementation loadingTESTViewController

- (void) viewDidLoad {
	
	//Create UIButton Programmatically
	
	ShowAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[ShowAlert addTarget:self action:@selector(COMEON:) forControlEvents:UIControlEventTouchDown];
	[ShowAlert setTitle:@"Load Alert" forState:UIControlStateNormal];
	ShowAlert.frame = CGRectMake(80, 50, 160, 40);
	
	[self.view addSubview:ShowAlert];

}

- (IBAction) COMEON: (id) sender {
	
	//Call Things from Activity View
	
	[[activity currentIndicator] displayCompleted:@"You Got it!"];
}

- (void)dealloc {
    [super dealloc];
}

@end
