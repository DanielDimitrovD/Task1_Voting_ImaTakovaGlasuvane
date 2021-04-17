//
//  Party.m
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import "Party.h"
#import <UIKit/UIKit.h>

@interface Party ()
    
@property(assign) int number;
@property(assign) int partyVotes;

@end

@implementation Party

- (instancetype)initWithName:(NSString*)name image:(UIImage*)image partyVotes:(int)partyVotes andNumber:(int)number {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.image = image;
        self.number = number;
        self.partyVotes = partyVotes;
    }
    
    return self;
}

+ (instancetype)partyWithName:(NSString*)name imageName:(NSString*)imageName partyVotes:(int)partyVotes andNumber:(int)number {
    UIImage* image = [UIImage imageNamed:imageName];
    
    Party* party = [[Party alloc] initWithName:name image:image partyVotes:partyVotes andNumber:number];
    
    return party;
}

- (void)didReceiveVote {
    self.partyVotes += 1;
}

@end
