//
//  ViewController.m
//  Flappy Bird
//
//  Created by Mehta on 29/01/16.
//  Copyright © 2016 Mehta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];    HighScoreLabel.text = [NSString stringWithFormat:@"High Score : %li", HighScore];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
