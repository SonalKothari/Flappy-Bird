//
//  Game.m
//  Flappy Bird
//
//  Created by Mehta on 29/01/16.
//  Copyright © 2016 Mehta. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

- (void)viewDidLoad {
    [super viewDidLoad];
    TunnelDown.hidden=YES;
    TunnelUp.hidden=YES;
    Exit.hidden=YES;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)StartGame:(id)sender {
    StartGame.hidden=YES;
    [self PlaceTunnels];
    TunnelUp.hidden=NO;
    TunnelDown.hidden=NO;
    
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    Score = 0;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BirdFlight = 23;
}

-(void)BirdMoving{
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    BirdFlight = BirdFlight - 5;
    if (BirdFlight<-15) {
        BirdFlight=-15;
    }
    if (BirdFlight>0) {
        Bird.image = [UIImage imageNamed:@"Bird Up.png"];
    }
    if (BirdFlight<0) {
        Bird.image = [UIImage imageNamed:@"Bird Down.png"];
    }
    
}

-(void)PlaceTunnels{
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 725;
    TunnelUp.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelDown.center = CGPointMake(340, RandomBottomTunnelPosition);
}

-(void)TunnelMoving{
    TunnelUp.center = CGPointMake(TunnelUp.center.x - 1, TunnelUp.center.y);
    TunnelDown.center = CGPointMake(TunnelDown.center.x - 1, TunnelDown.center.y);
    if (TunnelUp.center.x < -15) {
        [self PlaceTunnels];
    }
    if (CGRectIntersectsRect(Bird.frame, TunnelUp.frame)) {
            [self StopGame];
        }
    if (CGRectIntersectsRect(Bird.frame, TunnelDown.frame)) {
        [self StopGame];
    }
    if (CGRectIntersectsRect(Bird.frame, TopBoundary.frame)) {
        [self StopGame];
    }
    if (CGRectIntersectsRect(Bird.frame, BottomBoundary.frame)) {
        [self StopGame];
    }
    [self ScoreCount];
    
}

-(void)StopGame{
    [BirdMovement invalidate];
    [TunnelMovement invalidate];
    Exit.hidden=NO;
    
    
     if (Score > HighScoreNumber) {
         [[NSUserDefaults standardUserDefaults] setInteger:Score forKey:@"HighScoreSaved"];
    }
    
}

-(void)ScoreCount{
    if (TunnelUp.center.x == 10) {
        Score = Score +1;
        ScoreLabel.text = [NSString stringWithFormat:@"%li", Score];
    }
}
@end
