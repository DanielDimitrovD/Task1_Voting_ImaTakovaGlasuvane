//
//  Party.h
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIImage;

@interface Party : NSObject

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) UIImage* image;
@property(readonly) int number;
@property(readonly, nonatomic) int partyVotes;

+(instancetype) partyWithName:(NSString*)name imageName:(NSString*)imageName partyVotes:(int)partyVotes andNumber:(int)number;
-(void)didReceiveVote;

@end
NS_ASSUME_NONNULL_END
