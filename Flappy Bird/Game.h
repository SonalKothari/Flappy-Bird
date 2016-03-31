//
//  Game.h
//  Flappy Bird
//
//  Created by Mehta on 29/01/16.
//  Copyright © 2016 Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int RandomTopTunnelPosition_temp;
NSInteger Score;
NSTimer * BirdMovement;
NSTimer * TunnelMovement;
NSInteger HighScoreNumber;


@interface Game : UIViewController{

IBOutlet UIButton *StartGame;
IBOutlet UIImageView *Bird;
IBOutlet UIImageView *TunnelUp;
IBOutlet UIImageView *TunnelDown;
IBOutlet UIImageView *TopBoundary;
IBOutlet UIImageView *BottomBoundary;
IBOutlet UIButton *Exit;
IBOutlet UILabel *ScoreLabel;
}
- (IBAction)StartGame:(id)sender;

-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)StopGame;
-(void)ScoreCount;

@end


