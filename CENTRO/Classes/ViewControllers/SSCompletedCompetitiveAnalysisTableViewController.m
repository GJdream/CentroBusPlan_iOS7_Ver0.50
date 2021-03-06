//
//  SSCompletedCompetitiveAnalysisTableViewController.m
//  CENTRO
//
//  Created by Centro Community Partners.
//  Copyright (c) 2013 Centro Community Partners. All rights reserved.
//

#import "SSCompletedCompetitiveAnalysisTableViewController.h"
#import "SSCompletedCompetitorRankCell.h"
#import "CompetitorProfile.h"
#import "SSUser.h"

@interface SSCompletedCompetitiveAnalysisTableViewController () <NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *_fetchedResultsController;
}

@property (strong, nonatomic) NSManagedObjectContext *context;

- (void)refetchData;

@end

@implementation SSCompletedCompetitiveAnalysisTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (IBAction)tryAgainButtonPressed:(id)sender {
    [[SSUser currentUser] setActivityNumberAsIncompleted:@"14"];
    
    UIStoryboard *profileStoryBoard = [UIStoryboard storyboardWithName: @"competitors" bundle:Nil];
    UIViewController *initProfileView = [profileStoryBoard instantiateInitialViewController];
    initProfileView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //[VC presentViewController:initProfileView animated: animation completion: NULL];
    
    [self.navigationController pushViewController:initProfileView animated:YES];
}

- (void)refetchData {
    _fetchedResultsController.fetchRequest.resultType = NSManagedObjectResultType;
    [_fetchedResultsController performFetch:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *backgroundImageView40 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-568h@2x.png"]];
    UIImageView *backgroundImageView35R = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg@2x.png"]];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        self.tableView.backgroundView = backgroundImageView40;
    } else {
        self.tableView.backgroundView = backgroundImageView35R;
    }
    self.tableView.backgroundView.contentMode = UIViewContentModeCenter;
    
    self.tableView.delegate = self;
    
    self.navigationItem.title = @"Competitors";
    
    self.tryAgainButton.title = @"Try Again!";
    
    self.context = [(id)[[UIApplication sharedApplication] delegate] managedObjectContext];

}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(![[SSUser currentUser] isLoggedIn]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CompetitorProfile"];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name != %@", @""]];
        fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"competitorProfileID" ascending:YES selector:nil]];
        fetchRequest.returnsObjectsAsFaults = NO;
        
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
        _fetchedResultsController.delegate = self;
        [_fetchedResultsController performFetch:nil];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[_fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (SSCompletedCompetitorRankCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CompletedCompetitorRankCell";
    SSCompletedCompetitorRankCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[SSCompletedCompetitorRankCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    CompetitorProfile *temp = [_fetchedResultsController objectAtIndexPath:indexPath];

    cell.competitorLabel.text = temp.name;
    cell.priceRankLabel.text = [temp.priceRank stringValue];
    cell.customerServiceRankLabel.text = [temp.customerServiceRank stringValue];
    cell.qualityRankLabel.text = [temp.qualityRank stringValue];
    cell.locationRankLabel.text = [temp.locationRank stringValue];
    cell.speedRankLabel.text = [temp.speedRank stringValue];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

@end