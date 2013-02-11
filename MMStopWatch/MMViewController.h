//
//  MMViewController.h
//  MMStopWatch
//
//  Created by Dexter Teng on 2/8/13.
//  Copyright (c) 2013 Dexter Teng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMViewController : UIViewController
{
    IBOutlet UILabel *myScreen;
    NSTimer *myTimer;
    NSDate *initDate;
    NSTimeInterval totalTimeInterval;
    NSTimeInterval timeInterval;
    bool paused;
    int derpy;
}
-(IBAction)startpause:(id)sender;
-(IBAction)reset:(id)sender;
-(void)updateTimer;
@end
