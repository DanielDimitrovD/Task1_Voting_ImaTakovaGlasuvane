//
//  PartyViewController.m
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import "PartyViewController.h"

@interface PartyViewController ()

@end

@implementation PartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (instancetype)partyViewControllerWith:(UIImageView *)partyImage andPartyName:(UILabel *)partyName {
    
    PartyViewController *p = [[PartyViewController alloc] init];
    
    if (self) {
        p.partyImage = partyImage;
        p.partyName = partyName;
    }

    return p;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
