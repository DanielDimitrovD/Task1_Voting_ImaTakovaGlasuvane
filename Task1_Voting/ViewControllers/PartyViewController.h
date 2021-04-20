//
//  PartyViewController.h
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import <UIKit/UIKit.h>

@class PartyViewController;

@protocol PartyViewControllerDelegate <NSObject>
- (void)didVoteForPartyWithNumber:(int)partyNumber;
@end

NS_ASSUME_NONNULL_BEGIN

@interface PartyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *partyImageView;
@property (weak, nonatomic) IBOutlet UILabel *partyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *partyNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *voteButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

// delegate a property
@property (nonatomic, weak) id <PartyViewControllerDelegate> partyViewControllerDelegate;

-(IBAction)voteButtonTap:(UIButton *)sender;

-(IBAction)backButtonTap:(UIButton *)sender;

+(instancetype)viewControllerWithPartyName:(NSString *)partyName andNumber:(int)partyNumber;
@end

NS_ASSUME_NONNULL_END
