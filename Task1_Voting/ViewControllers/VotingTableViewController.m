//
//  VotingTableViewController.m
//  ImaTakovaGlasuvane
//
//  Created by A-Team Intern on 12.04.21.
//

#import "VotingTableViewController.h"
#import "Party.h"
#import "VotingTableViewCell.h"
#import "PartyViewController.h"
#import "LanguageDictionary.h"

#import <AudioToolbox/AudioServices.h>

@interface VotingTableViewController ()
@property(strong, nonatomic) NSMutableArray<Party*> *partiesArray;
@property(assign, nonatomic) EnumLanguage currentLanguage;
@end

@implementation VotingTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *partiesNames = @[   @"Bulgarian National Movement",
                                 @"We, the citizens" ,
                                 @"Bulgarian National Union" ,
                                 @"Bulgarian Socialist Party" ,
                                 @"Revival",
                                 @"Alternative for Bulgarian Revival" ,
                                 @"Attack" ,
                                 @"Conservative Union of The Far Right" ,
                                 @"Movement for Rights and Freedoms",
                                 @"Bulgarian Progressive Line",
                                 @"Democratic Bulgaria" ,
                                 @"Revival of the Homeland" ,
                                 @"Movement \"Together for change\"" ,
                                 @"Bulgarian National Union",
                                 @"Nation" ,
                                 @"Moral, Initiative, Patriotism" ,
                                 @"Citizens from the Protest" ,
                                 @"Stand up! Get out!",
                                 @"People's Voice",
                                 @"Movement of the non-party candidates" ,
                                 @"Republicans for Bulgaria" ,
                                 @"The Right",
                                 @"Prosperity-Unification-Building",
                                 @"Patriotic Coalition - WILL and NFSB" ,
                                 @"Green Party of Bulgaria",
                                 @"Society for New Bulgaria" ,
                                 @"Bulgarian Union for Direct Democracy" ,
                                 @"GERB-SDS" ,
                                 @"There are such people" ,
                                 @"Direct Democracy"];
    
    self.partiesArray = [[NSMutableArray alloc] init];
    
    NSUserDefaults *votingDefaults = [NSUserDefaults standardUserDefaults];
    
    for (int i = 0; i < partiesNames.count; i++) {
        
        int votesForParty = 0;
        
        if ([votingDefaults objectForKey:partiesNames[i]] != nil) {
            votesForParty = (int)[votingDefaults integerForKey:partiesNames[i]];
        }

        Party* p = [Party partyWithName:partiesNames[i] imageName:[NSString stringWithFormat:@"%d", i + 1]
                             partyVotes:votesForParty andNumber:i + 1];
        [self.partiesArray addObject:p];
    }
    
    if ([votingDefaults objectForKey:@"Language"]) {
        
        NSUserDefaults *votingDefaults = [NSUserDefaults standardUserDefaults];
        
        EnumLanguage persistLanguage = [votingDefaults integerForKey:@"Language"];
        self.currentLanguage = persistLanguage;
        
        LanguageDictionary *sharedLanguageDictionary = [LanguageDictionary sharedLanguageDictionary];
        [sharedLanguageDictionary setLanguage:persistLanguage];
        
        self.languageSettingsButtonItem.title = [sharedLanguageDictionary stringForKey:@"Language"];
    }   else {
        self.currentLanguage = EnumLanguageEnglish;
    }
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear called");
    
    [super viewDidAppear:animated];
    
    [self showAgeConfirmationAlert];
}

- (void)showAgeConfirmationAlert{

    LanguageDictionary *sharedLanguageDictionary = [LanguageDictionary sharedLanguageDictionary];
    
    NSString *legalVotingConfirmationAlertTitle =
    [sharedLanguageDictionary stringForKey:@"Legal voting confirmation"];
    
    NSString *legalVotingConfirmationAlertMessage =
    [sharedLanguageDictionary stringForKey:@"Confirm that you are atleast 18 years old to vote!"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:legalVotingConfirmationAlertTitle                                     message:legalVotingConfirmationAlertMessage
                               preferredStyle:UIAlertControllerStyleAlert];
    
    NSString *acceptActionTitle = [sharedLanguageDictionary stringForKey:@"Accept"];
        
    UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:acceptActionTitle
    style:UIAlertActionStyleDefault
    handler:^(UIAlertAction *action) {}];
    
    NSString *declineActionTitle = [sharedLanguageDictionary stringForKey:@"Decline"];
    
    UIAlertAction *declineAction = [UIAlertAction actionWithTitle:declineActionTitle
    style:UIAlertActionStyleDestructive
    handler:^(UIAlertAction *action) {
        exit(0);
    }];

    [alert addAction:acceptAction];
    [alert addAction:declineAction];

    [self presentViewController:alert animated:NO completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.partiesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VotingTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"party_cell_id" forIndexPath:indexPath];
    
    Party* currentParty = self.partiesArray[indexPath.row];
    
    cell.partyImage.image = currentParty.image;
    cell.partyNumber.text = [NSString stringWithFormat:@"%d", currentParty.number];
    cell.partyName.text = [self didReceiveTranslation:currentParty.name];
    cell.partyVotes.text = [NSString stringWithFormat:@"%d", currentParty.partyVotes];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectedVotingPartyName = self.partiesArray[indexPath.item].name;
    
    int selectedVotingPartyNumber = self.partiesArray[indexPath.item].number;
    
    NSString *corruptedPartyName = @"Има такъв народ";
    int corruptedPartyNumber = 29;
    double voteProbability = ((double) arc4random() / UINT32_MAX);
  
    if (![selectedVotingPartyName isEqual:corruptedPartyName]) {

        // direct vote goes to ImaTakuvNarod
       
        if ([self isDirectVoteForImaTakuvNarod:voteProbability]) {
            NSLog(@"Direct vote for Ima Takuv Narod");
            
            [self voteForPartyWithNumber:corruptedPartyNumber];
            
        } else if ([self isHighlightedPosibility:voteProbability]) {
            NSLog(@"Scroll to Ima Takuv Narod");

            [self scrollToImaTakuvNarod:tableView];
        } else {
           
            //NSLog(@"%@", [NSString stringWithFormat:@"Voting for the selected party %@", selectedVotingPartyName]);
            
            selectedVotingPartyName = [self didReceiveTranslation:selectedVotingPartyName];
            
            // Open PartyView
            PartyViewController *partyViewController = [PartyViewController viewControllerWithPartyName:selectedVotingPartyName andNumber:selectedVotingPartyNumber];
            
            partyViewController.partyViewControllerDelegate = self;
    
            [self presentViewController:partyViewController animated:YES completion:nil];
        }
    } else {
        NSLog(@"Vote for Ima Takuv Narod");
    
        selectedVotingPartyName = [self didReceiveTranslation:selectedVotingPartyName];
        
        PartyViewController *partyViewController = [PartyViewController viewControllerWithPartyName:selectedVotingPartyName andNumber:selectedVotingPartyNumber];
        
        partyViewController.partyViewControllerDelegate = self;
        
        [self presentViewController:partyViewController animated:YES completion:nil];
    }
}

- (NSString *)didReceiveTranslation:(NSString *)partyName {
    
    LanguageDictionary *sharedLanguageDictionary = [LanguageDictionary sharedLanguageDictionary];
  
    return [sharedLanguageDictionary stringForKey:partyName];
}

- (void)voteForPartyWithNumber:(int)partyNumber {
    int partyNumberIndexInArray = partyNumber - 1;
    
    [self.partiesArray[partyNumberIndexInArray] didReceiveVote];
    [self.tableView reloadData];
    
    NSUserDefaults *votingDefaults = [NSUserDefaults standardUserDefaults];
    
    [votingDefaults setInteger:self.partiesArray[partyNumberIndexInArray].partyVotes forKey:self.partiesArray[partyNumberIndexInArray].name];
}

- (IBAction)languageSwitchButtonTap:(id)sender {
    NSLog(@"User wants to switch language");
    
    LanguageDictionary *sharedLanguageDictionary = [LanguageDictionary sharedLanguageDictionary];
    
    NSString *languageSwitchAlertTitle = [sharedLanguageDictionary stringForKey:@"Change language"];
    NSString *languageSwitchAlertMessage = [sharedLanguageDictionary
                                            stringForKey:@"Please choose a language from the options"];
    
    UIAlertController *languageSwitchAlert = [UIAlertController alertControllerWithTitle:languageSwitchAlertTitle message:languageSwitchAlertMessage preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSString *changeToEnglishActionTitle = @"English";
    
    UIAlertAction *changeToEnglishAction = [UIAlertAction actionWithTitle:changeToEnglishActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self setLanguage:EnumLanguageEnglish];
    }];
    
    NSString *changeToBulgarianActionTitle = @"Български";
    
    UIAlertAction *changeToBulgarianAction = [UIAlertAction actionWithTitle:changeToBulgarianActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self setLanguage:EnumLanguageBulgarian];
        
    }];
    
    NSString *changeToTurkishActionTitle = @"Türk";
    
    UIAlertAction *changeToTurkishAction = [UIAlertAction actionWithTitle:changeToTurkishActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self setLanguage:EnumLanguageTurkish];
    }];
    
    NSString *backToPartyListActionTitle = [sharedLanguageDictionary stringForKey:@"Back"];
    
    UIAlertAction *backToPartyListAction = [UIAlertAction actionWithTitle:backToPartyListActionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [languageSwitchAlert addAction:changeToEnglishAction];
    [languageSwitchAlert addAction:changeToBulgarianAction];
    [languageSwitchAlert addAction:changeToTurkishAction];
    [languageSwitchAlert addAction:backToPartyListAction];
    
    [self presentViewController:languageSwitchAlert animated:YES completion:nil];
}

- (void)setLanguage:(EnumLanguage)language {
    self.currentLanguage = language;
   
    
    NSUserDefaults *votingDefaults = [NSUserDefaults standardUserDefaults];
    
    [votingDefaults setInteger:language forKey:@"Language"];
    
    LanguageDictionary *sharedLanguageDictionary = [LanguageDictionary sharedLanguageDictionary];
    [sharedLanguageDictionary setLanguage:language];
    
    self.languageSettingsButtonItem.title = [sharedLanguageDictionary stringForKey:@"Language"];
    [self.tableView reloadData];
}

- (BOOL)isHighlightedPosibility:(double)voteProbability {
//    NSLog(@"Chance for highlight: %.2f", chanceForHighlight);
    double highlightPossibilityUpperBound = 0.35;
    return voteProbability < highlightPossibilityUpperBound;
}

- (BOOL)isDirectVoteForImaTakuvNarod:(double)voteProbabilty{
    double directVoteChance = 0.10;
    return voteProbabilty < directVoteChance;
}

- (void) scrollToImaTakuvNarod:(UITableView*)tableView {

    int imaTakuvNarodIndexInPartiesArray = 28;
    NSIndexPath *imaTakuvNarodIndexPath = [NSIndexPath indexPathForItem:imaTakuvNarodIndexInPartiesArray inSection:0];

    [tableView scrollToRowAtIndexPath:imaTakuvNarodIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .5f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        VotingTableViewCell *imaTakuvNarodCell = [tableView cellForRowAtIndexPath:imaTakuvNarodIndexPath];

        [imaTakuvNarodCell blink];
    });
}

- (void)didVoteForPartyWithNumber:(int)partyNumber {
    [self voteForPartyWithNumber:partyNumber];
}

@end
