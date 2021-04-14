//
//  VotingTableViewController.m
//  ImaTakovaGlasuvane
//
//  Created by A-Team Intern on 12.04.21.
//

#import "VotingTableViewController.h"
#import "Party.h"
#import "VotingTableViewCell.h"

@interface VotingTableViewController ()
@property(strong, nonatomic) NSMutableArray<Party*> *partiesArray;
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
        
    for (int i = 0; i < partiesNames.count; i++) {
        
        Party* p = [Party partyWithName:partiesNames[i] imageName: [NSString stringWithFormat:@"%d", i + 1] andNumber:i + 1];
        [self.partiesArray addObject:p];
    }
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
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showAlertView:tableView];
    }


- (void) showAlertView:(UITableView *)tableView {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Legal voting confirmation"
                                           message:@"Confirm that you are atleast 18 years old to vote!"
                                           preferredStyle:UIAlertControllerStyleAlert];
    
            UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:@"Acept" style:UIAlertActionStyleDefault
               handler:^(UIAlertAction *action) {
                
                NSIndexPath *selectedRowIndexPath = [tableView indexPathForSelectedRow];
                
                VotingTableViewCell *selectedVotingCell = [tableView cellForRowAtIndexPath:selectedRowIndexPath];
                
                NSString* selectedVotingPartyName = selectedVotingCell.partyName.text;
                
                // if the selected party is not ImaTakuvNarod
                if (![selectedVotingPartyName isEqual:@"Има такъв народ"]) {
                    
                    float chanceForHighlight = (float)rand() / RAND_MAX;
                    NSLog(@"Chance for highlight: %.2f", chanceForHighlight);
                    
                    // scroll directly to ImaTakuvNarod
                    if (chanceForHighlight < 0.25) {
                        [self scrollToImaTakuvNarod:tableView];
                    } else {
                        
                        float chanceForDirectVote = (float)rand() / RAND_MAX;
                        
                        // direct vote for party ImaTakuvNarod
                        if (chanceForDirectVote < 0.10) {
                            
                        } else {
                            // Vote for the selected party
                            NSLog(@"To DO: complete voting persistence");
                        }
                    }
                }
            }];
    
            UIAlertAction *declineAction = [UIAlertAction actionWithTitle:@"Decline" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                exit(0);
            }];
    
            [alert addAction:acceptAction];
            [alert addAction:declineAction];
   
            [self presentViewController:alert animated:YES completion:nil];
}

- (void) scrollToImaTakuvNarod:(UITableView*)tableView {
    
    int imaTakuvNarodIndexInPartiesArray = 28;
    NSIndexPath *imaTakuvNarodIndexPath = [NSIndexPath indexPathForItem:imaTakuvNarodIndexInPartiesArray inSection:0];
    
    /**
     #Warning the highlighting of the specific cell will not work if animated argument is YES
     */
    
    [tableView scrollToRowAtIndexPath:imaTakuvNarodIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    NSArray<NSIndexPath*> *visibleRows = [tableView indexPathsForVisibleRows];
    
    for (NSIndexPath *indexPath in visibleRows) {
        
        VotingTableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
        
        NSString* imaTakuvNarodPartyName = @"Има такъв народ";
        
        if ([currentCell.partyName.text  isEqual:imaTakuvNarodPartyName]) {
            [currentCell setHighlighted:YES animated:YES];
            break;
        }
    }
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
