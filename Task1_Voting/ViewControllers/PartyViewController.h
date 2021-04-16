//
//  PartyViewController.h
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PartyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *partyImageView;
@property (weak, nonatomic) IBOutlet UILabel *partyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *partyNumberLabel;
@property (strong, nonatomic) VotingTableViewController *parentVotingTableViewController;

-(IBAction)voteButtonTap:(UIButton *)sender;

-(IBAction)backButtonTap:(UIButton *)sender;

+(instancetype)viewControllerWithPartyName:(NSString *)partyName parentTableViewController:(VotingTableViewController *)parentController andNumber:(int)partyNumber;
@end

NS_ASSUME_NONNULL_END
