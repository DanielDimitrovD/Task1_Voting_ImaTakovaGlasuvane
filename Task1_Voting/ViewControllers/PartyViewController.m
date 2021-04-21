//
//  PartyViewController.m
//  Task1_Voting
//
//  Created by A-Team Intern on 15.04.21.
//

#import "VotingTableViewController.h"
#import "PartyViewController.h"
#import "LanguageDictionary.h"

@interface PartyViewController ()
@property(strong, nonatomic) NSString *partyName;
@property(strong, nonatomic) UIImage *partyImage;
@property(assign, nonatomic) int partyNumber;
@end

@implementation PartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.partyImageView.image = self.partyImage;
    self.partyNameLabel.text = self.partyName;
    self.partyNumberLabel.text = [NSString stringWithFormat:@"%d", self.partyNumber];

    LanguageDictionary *sharedLanguageDictionary = [LanguageDictionary sharedLanguageDictionary];
        
    NSString *voteButtonText = [sharedLanguageDictionary stringForKey:@"Vote"];
    NSString *backButtonText = [sharedLanguageDictionary stringForKey:@"Back"];
        
    [self.voteButton setTitle:voteButtonText forState:UIControlStateNormal];
    [self.backButton setTitle:backButtonText forState:UIControlStateNormal];
}

+ (instancetype)viewControllerWithPartyName:(NSString *)partyName andNumber:(int)partyNumber {
   
    NSString *partyNumberString = [NSString stringWithFormat:@"%d", partyNumber];
    
    UIImage *uiPartyImage = [UIImage imageNamed:partyNumberString];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PartyViewController *partyViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"PartyViewControllerID"];
    
    partyViewController.partyName = partyName;
    partyViewController.partyImage = uiPartyImage;
    partyViewController.partyNumber = partyNumber;

    return partyViewController;
}

- (IBAction)backButtonTap:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)voteButtonTap:(UIButton *)sender {
    
    [self.partyViewControllerDelegate didVoteForPartyWithNumber:self.partyNumber];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
