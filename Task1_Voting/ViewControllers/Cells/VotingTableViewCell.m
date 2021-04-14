//
//  VotingTableViewCell.m
//  ImaTakovaGlasuvane
//
//  Created by A-Team Intern on 13.04.21.
//

#import "VotingTableViewCell.h"

@implementation VotingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    if (self.selected) {
        NSLog(@"Selected a party");
    }
    
}

@end
