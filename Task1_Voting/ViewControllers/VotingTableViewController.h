//
//  VotingTableViewController.h
//  ImaTakovaGlasuvane
//
//  Created by A-Team Intern on 12.04.21.
//

#import "PartyViewController.h"

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VotingTableViewController : UITableViewController <PartyViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *languageSettingsButtonItem;
- (IBAction)languageSwitchButtonTap:(id)sender;
- (void)voteForPartyWithNumber:(int)partyNumber;
@end

NS_ASSUME_NONNULL_END
