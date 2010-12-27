//
//  activity.h
//  loadingTEST
//
//  Created by moeZ on 12/23/10.
//  Copyright 2010 w00ty Lab. All rights reserved.
//  You're free to use the following code. Just say "hi" to me if you do

#import <UIKit/UIKit.h>

@interface activity : UIView {
	UILabel *centerMsg;
	UILabel *subMsg;
	UIActivityIndicatorView *spinner;
}

@property (nonatomic, retain) UILabel *centerMsg;
@property (nonatomic, retain) UILabel *subMsg;


+ (activity *) currentIndicator;

- (void)show;
- (void)hideAfterDelay;
- (void)hide;
- (void)hidden;
- (void)displayActivity:(NSString *)m;
- (void)displayCompleted:(NSString *)m;
- (void)setCenterMessage:(NSString *)message;
- (void)setSubMessage:(NSString *)message;
- (void)showSpinner;

@end
