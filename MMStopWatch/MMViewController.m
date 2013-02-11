//
//  MMViewController.m
//  MMStopWatch
//
//  Created by Dexter Teng on 2/8/13.
//  Copyright (c) 2013 Dexter Teng. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor blackColor]];
	// Do any additional setup after loading the view, typically from a nib.
    paused = false;
    
    
}

-(void)updateTimer
{
    NSDate *currentDate = [NSDate date];
    timeInterval = [currentDate timeIntervalSinceDate:initDate];
    timeInterval += totalTimeInterval;
    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss:SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    myScreen.text = timeString;
    derpy--;
    myScreen.shadowOffset = CGSizeMake(0, derpy);
    if (derpy == -10)
    {
        derpy = 200;
    }
    
}

-(IBAction)startpause:(id)sender
{
    derpy = 100;
    if (paused == false)
    {
        initDate = [NSDate date];
        myScreen.shadowColor = [UIColor lightGrayColor];
        myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/50.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        
        paused = true;
    } else
    {
        [self updateTimer];
        [myTimer invalidate];
        myTimer = nil;
        totalTimeInterval = timeInterval;
        paused = false;
    }
    
}

-(IBAction)reset:(id)sender
{
    initDate = [NSDate date];
    myScreen.text = @"00:00:00:000";
    totalTimeInterval = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
