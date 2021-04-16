//
//  VotingTableViewCell.m
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
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

-(void)blink {
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = UIColor.systemBlueColor;
        }  completion:^(BOOL finished){
            
            [UIView animateWithDuration:0.5 animations:^{
                self.backgroundColor = UIColor.clearColor;
            } completion:^(BOOL finished){
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.backgroundColor = UIColor.systemBlueColor;
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:0.5 animations:^{
                        self.backgroundColor = UIColor.clearColor;
                    }];
                }];
            }];
        }];
}
@end
