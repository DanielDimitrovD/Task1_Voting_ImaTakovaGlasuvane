//
//  VotingTableViewCell.h
//  ImaTakovaGlasuvane
//
//  Created by A-Team Intern on 13.04.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VotingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *partyImage;
@property (weak, nonatomic) IBOutlet UILabel *partyNumber;
@property (weak, nonatomic) IBOutlet UILabel *partyName;

@end

NS_ASSUME_NONNULL_END
