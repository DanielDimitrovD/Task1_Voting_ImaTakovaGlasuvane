//
//  PartyViewController.h
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PartyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *partyImage;
@property (weak, nonatomic) IBOutlet UILabel *partyName;

+(instancetype)partyViewControllerWith:(UIImageView *)partyImage andPartyName:(UILabel *)partyName;
@end

NS_ASSUME_NONNULL_END
