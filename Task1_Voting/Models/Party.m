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

@end

@implementation Party

- (instancetype) initWithName:(NSString*)name image:(UIImage*)image andNumber:(int)number {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.image = image;
        self.number = number;
        self.partyVotes = 0;
    }
    
    return self;
}

+ (instancetype) partyWithName:(NSString*)name imageName:(NSString*)imageName andNumber:(int)number {
    UIImage* image = [UIImage imageNamed:imageName];
    
    Party* party = [[Party alloc] initWithName:name image:image andNumber:number];
    
    return party;
}

@end
