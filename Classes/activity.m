//
//  activity.m
//  loadingTEST
//
//  Created by moeZ on 12/23/10.
//  Copyright 2010 w00ty Lab. All rights reserved.
//  You're free to use the following code. Just say "hi" to me if you do

#import "activity.h"
#import <QuartzCore/QuartzCore.h>

@implementation activity
@synthesize centerMsg, subMsg;

static activity *currentIndicator = nil;

+ (activity *)currentIndicator
{
	if (currentIndicator == nil)
	{
		UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
		
		CGFloat width = 160;
		CGFloat height = 160;
		CGRect centeredFrame = CGRectMake(round(keyWindow.bounds.size.width/2 - width/2),
										  round(keyWindow.bounds.size.height/2 - height/2),
										  width,
										  height);
		
		currentIndicator = [[activity alloc] initWithFrame:centeredFrame];
		
		currentIndicator.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
		currentIndicator.opaque = NO;
		currentIndicator.alpha = 0;
		
		currentIndicator.layer.cornerRadius = 10;
		
		currentIndicator.userInteractionEnabled = NO;
		currentIndicator.autoresizesSubviews = YES;
		
		currentIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |  UIViewAutoresizingFlexibleTopMargin |  UIViewAutoresizingFlexibleBottomMargin;

	}
	
	return currentIndicator;
}

#pragma mark -

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
	
	[centerMsg release];
	[subMsg release];
	
	[super dealloc];
}

#pragma mark Creating Message

- (void)show
{	
	if ([self superview] != [[UIApplication sharedApplication] keyWindow]) 
		[[[UIApplication sharedApplication] keyWindow] addSubview:self];
	
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hide) object:nil];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	
	self.alpha = 1;
	
	[UIView commitAnimations];
}

- (void)hideAfterDelay
{
	[self performSelector:@selector(hide) withObject:nil afterDelay:1.5];
}

- (void)hide
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.7];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(hidden)];
	
	self.alpha = 0;
	
	[UIView commitAnimations];
}

- (void)persist
{	
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hide) object:nil];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:0.1];
	
	self.alpha = 1;
	
	[UIView commitAnimations];
}

- (void)hidden
{
	if (currentIndicator.alpha > 0)
		return;
	
	[currentIndicator removeFromSuperview];
	currentIndicator = nil;
}

- (void)displayActivity:(NSString *)m
{		
	[self setSubMessage:m];
	
	[centerMsg removeFromSuperview];
	centerMsg = nil;
	
	if ([self superview] == nil)
		[self show];
	else
		[self persist];
}

- (void)displayCompleted:(NSString *)m
{	
	[self setCenterMessage:@"☞ ☺"];
	[self setSubMessage:m];
	
	
	if ([self superview] == nil)
		[self show];
	else
		[self persist];
	
	[self hideAfterDelay];
}

- (void)setCenterMessage:(NSString *)message
{	
	if (message == nil && centerMsg != nil)
		self.centerMsg = nil;
	
	else if (message != nil)
	{
		if (centerMsg == nil)
		{
			self.centerMsg = [[[UILabel alloc] initWithFrame:CGRectMake(12,round(self.bounds.size.height/2-50/2),self.bounds.size.width-24,50)] autorelease];
			centerMsg.backgroundColor = [UIColor clearColor];
			centerMsg.opaque = NO;
			centerMsg.textColor = [UIColor yellowColor];
			centerMsg.font = [UIFont boldSystemFontOfSize:50];
			centerMsg.textAlignment = UITextAlignmentCenter;
			centerMsg.shadowColor = [UIColor darkGrayColor];
			centerMsg.shadowOffset = CGSizeMake(1,1);
			centerMsg.adjustsFontSizeToFitWidth = YES;
			
			[self addSubview:centerMsg];
		}
		
		centerMsg.text = message;
	}
}

- (void)setSubMessage:(NSString *)message
{	
	if (message == nil && subMsg != nil)
		self.subMsg = nil;
	
	else if (message != nil)
	{
		if (subMsg == nil)
		{
			self.subMsg = [[[UILabel alloc] initWithFrame:CGRectMake(12,self.bounds.size.height-45,self.bounds.size.width-24,30)] autorelease];
			subMsg.backgroundColor = [UIColor clearColor];
			subMsg.opaque = YES;
			subMsg.textColor = [UIColor whiteColor];
			subMsg.font = [UIFont boldSystemFontOfSize:20];
			subMsg.textAlignment = UITextAlignmentCenter;
			subMsg.shadowColor = [UIColor darkGrayColor];
			subMsg.shadowOffset = CGSizeMake(1,1);
			subMsg.adjustsFontSizeToFitWidth = YES;
			
			[self addSubview:subMsg];
		}
		subMsg.text = message;
	}
}

@end
