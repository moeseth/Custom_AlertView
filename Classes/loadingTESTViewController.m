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
	
	//Loader UIButton
	
	ShowLoader = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[ShowLoader addTarget:self action:@selector(ShowActivityIndicator:) forControlEvents:UIControlEventTouchDown];
	[ShowLoader setTitle:@"Show Loader" forState:UIControlStateNormal];
	ShowLoader.frame = CGRectMake(80, 120, 160, 40);
	[self.view addSubview:ShowAlert];
	[self.view addSubview:ShowLoader];

}

- (IBAction) COMEON: (id) sender {
	
	//Call Things from Activity View
	
	[[activity currentIndicator] displayCompleted:@"You Got it!"];
}

//Show Loader

- (IBAction) ShowActivityIndicator: (id) sender {
	
	//Replace You Got it with Spinner
	
	[[activity currentIndicator] displayCompleted:@""];
	[[activity currentIndicator] showSpinner];
}


- (void)dealloc {
    [super dealloc];
}

@end
