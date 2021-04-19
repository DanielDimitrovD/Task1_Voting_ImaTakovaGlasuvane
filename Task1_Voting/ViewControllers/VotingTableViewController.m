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

#import <AudioToolbox/AudioServices.h>

@interface VotingTableViewController ()
@property(strong, nonatomic) NSMutableArray<Party*> *partiesArray;
@property(strong, nonatomic) NSUserDefaults *votingDefaults;
@end

@implementation VotingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *partiesNames = @[@"ВМРО",
                     @"Ние, гражданите",
                     @"Български национален съюз - БНД",
                     @"БСП за България",
                     @"Възраждане",
                     @"АБВ",
                     @"Атака",
                     @"Консервативно обединение на десницата",
                     @"ДПС",
                     @"Българска прогресивна линия",
                     @"Демократична България",
                     @"Възраждане на Отечеството",
                     @"Движение \"Заедно за промяната\"",
                     @"Българско национално обединение - БНО",
                     @"Партия \"Нация\"",
                     @"МИР",
                     @"Граждани от Протеста",
                     @"Изправи се! Мутри вън!",
                     @"Глас Народен",
                     @"Движение на непартийните кандидати",
                     @"Републиканци за България",
                     @"Партия \"Правото\"",
                     @"Благоденствие-Обединение-Градивност",
                     @"Патриотична коалиция - ВОЛЯ и НФСБ",
                     @"Партия на Зелените",
                     @"Общество за Нова България",
                     @"Български съюз за директна демокрация",
                     @"ГЕРБ-СДС",
                     @"Има такъв народ",
                     @"Пряка демокрация"];
    
    self.partiesArray = [[NSMutableArray alloc] init];
        
    self.votingDefaults = [NSUserDefaults standardUserDefaults];
    
    for (int i = 0; i < partiesNames.count; i++) {
        
        int votesForParty = 0;
        
        if ([self.votingDefaults objectForKey:partiesNames[i]] != nil) {
            votesForParty = (int)[self.votingDefaults integerForKey:partiesNames[i]];
        }
        
        Party* p = [Party partyWithName:partiesNames[i] imageName:[NSString stringWithFormat:@"%d", i + 1]
                             partyVotes:votesForParty andNumber:i + 1];
        [self.partiesArray addObject:p];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear called");
    
    [super viewDidAppear:animated];
    
    [self showAgeConfirmationAlert];
}

- (void)showAgeConfirmationAlert{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Legal voting confirmation"
                                message:@"Confirm that you are atleast 18 years old to vote!"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:@"Accept" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction *action) {}];
    
    
    UIAlertAction *declineAction = [UIAlertAction actionWithTitle:@"Decline" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
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
    cell.partyName.text = currentParty.name;
    
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
            
            // Open PartyView
            PartyViewController *partyViewController = [PartyViewController viewControllerWithPartyName:selectedVotingPartyName andNumber:selectedVotingPartyNumber];
            
            partyViewController.partyViewControllerDelegate = self;
            
            [self presentViewController:partyViewController animated:YES completion:nil];
        }
    } else {
        NSLog(@"Vote for Ima Takuv Narod");
        
        PartyViewController *partyViewController = [PartyViewController viewControllerWithPartyName:selectedVotingPartyName andNumber:selectedVotingPartyNumber];
        
        partyViewController.partyViewControllerDelegate = self;
        
        [self presentViewController:partyViewController animated:YES completion:nil];
    }
}

- (void)voteForPartyWithNumber:(int)partyNumber {
    int partyNumberIndexInArray = partyNumber - 1;
    
    [self.partiesArray[partyNumberIndexInArray] didReceiveVote];
    [self.tableView reloadData];
    [self.votingDefaults setInteger:self.partiesArray[partyNumberIndexInArray].partyVotes forKey:self.partiesArray[partyNumberIndexInArray].name];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
