//
//  TestNoteController.m
//  WesternMusicElements
//
//  Created by Cormier Frederic on 05/03/12.
//  Copyright (c) 2012 International MicrOondes. All rights reserved.
//

#import "TestNoteController.h"
#import "WMNote.h"
#import "WMPool.h"

@interface TestNoteController ()
@property (strong, nonatomic)WMNote *ourNote;
@property (strong, nonatomic)NSMutableString* textBuffer;

- (void)updateTextView;



@end

@implementation TestNoteController
@synthesize textView, textBuffer;

@synthesize noteLabel, ourNote;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        textBuffer = [[NSMutableString alloc] init ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WMNote *poolNote = [[WMPool pool] noteWithRoot:@"A" accidental:@"#" octave:5];
    NSLog(@"note: %@", poolNote);
    [self newRandomNote:self];
 
  }

- (void)viewDidUnload
{
    [self setNoteLabel:nil];
    [self setTextView:nil];
       [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)updateTextView {
    [textBuffer appendString:[[self ourNote] shortDescription]];
    [textBuffer appendString:@"\n"];
    [[self textView] setText:textBuffer];
    [[self textView] setNeedsDisplay];
    CGRect textRect = [[self textView] bounds];
    [[self textView] scrollRectToVisible:CGRectMake(0.0, textRect.size.height - 20.0, textRect.size.width, textRect.size.height) animated:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)newRandomNote:(id)sender {
    [self setOurNote:[[WMPool pool] noteWithMidiNoteNumber:arc4random() % 127]];
    [self updateTextView];    

    
}

- (IBAction)showPrevious:(id)sender {
    WMNote *previousNote = [[self ourNote] previousNote];
    [self setOurNote:previousNote];
    [self updateTextView];
}

- (IBAction)showNext:(id)sender {
    WMNote *nextNote = [[self ourNote] nextNote];
    [self setOurNote:nextNote];
    [self updateTextView];
}
@end
