//
//  VotingTableViewCell.h
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VotingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *partyImage;
@property (weak, nonatomic) IBOutlet UILabel *partyNumber;
@property (weak, nonatomic) IBOutlet UILabel *partyName;
@property (weak, nonatomic) IBOutlet UILabel *partyVotes;

-(void)blink;
@end

NS_ASSUME_NONNULL_END
