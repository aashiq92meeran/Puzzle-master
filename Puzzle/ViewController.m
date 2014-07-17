//
//  ViewController.m
//  Puzzle
//
//  Created by BSA univ 1 on 20/06/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import "ViewController.h"
#import "TKDragView.h"
#import "SEDraggable.h"
#import "SEDraggableLocation.h"


@interface ViewController ()
{
    UIImageView *dot1;
    
}

@end

@implementation ViewController

@synthesize images,view1,view2,tobj,dot;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self placeHolder];
    [self bottomViewImages];
 
   
}

-(void)bottomViewImages
{
    int x=0;
    int y=0;

   view1 = [[UIView alloc]initWithFrame:CGRectMake(50,20,200,900)];
    
    view1.backgroundColor = [UIColor redColor];
   
    
        for (int i=0; i<4; i++) {
            if (i<4) {
                
                 x=x+20;
                 y+=50;
            }
            
               [self setupDraggableObjects];
            
   dot = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5+y+y, 80, 70)];
            
   NSString * imageName=[NSString stringWithFormat:@"%@",[images objectAtIndex:i]];
    dot.image=[UIImage imageNamed:imageName];

           
    [view1 addSubview:dot];
    [dot setImage:dot.image];
            
 [dot setUserInteractionEnabled:YES];
            
    [self.view addSubview:view1];
    
    }
    

}
-(void) setupDraggableObjects

{

images = [NSMutableArray arrayWithObjects:
                         @"1.png" ,
                         @"2.png",
                         @"3.png",
                         @"4.png",nil];
}

-(void)placeHolder

{
    view2 = [[UIView alloc] initWithFrame:CGRectMake(260, 20, 500, 900)];
    
    
    view2.backgroundColor = [UIColor blueColor];
    
    
// Place Holders for images
    //1
     dot1 =[[UIImageView alloc] initWithFrame:CGRectMake(30,50,80,70)];
    dot1.backgroundColor = [UIColor redColor];
    //1
    UIImageView *dot2 =[[UIImageView alloc] initWithFrame:CGRectMake(110,120,80,70)];
    dot2.backgroundColor = [UIColor brownColor];
    //2
    UIImageView *dot3 =[[UIImageView alloc] initWithFrame:CGRectMake(110,50,80,70)];
    dot3.backgroundColor = [UIColor blackColor];
     //3
    UIImageView *dot4 =[[UIImageView alloc] initWithFrame:CGRectMake(190,50,80,70)];
    dot4.backgroundColor = [UIColor purpleColor];
     //4
    UIImageView *dot5 =[[UIImageView alloc] initWithFrame:CGRectMake(190,120,80,70)];
    dot5.backgroundColor = [UIColor purpleColor];
     //5
    UIImageView *dot6 =[[UIImageView alloc] initWithFrame:CGRectMake(190,190,80,70)];
    dot6.backgroundColor = [UIColor redColor];
     //6
    UIImageView *dot7 =[[UIImageView alloc] initWithFrame:CGRectMake(190,120,80,70)];
    dot7.backgroundColor = [UIColor yellowColor];
     //7
    UIImageView *dot8 =[[UIImageView alloc] initWithFrame:CGRectMake(110,190,80,70)];
    dot8.backgroundColor = [UIColor purpleColor];
     //8
    UIImageView *dot9 =[[UIImageView alloc] initWithFrame:CGRectMake(30,190,80,70)];
    dot9.backgroundColor = [UIColor blackColor];
     //9
    UIImageView *dot10 =[[UIImageView alloc] initWithFrame:CGRectMake(30,120,80,70)];
    dot10.backgroundColor = [UIColor yellowColor];
     //10
    
    [view2 addSubview:dot1];
    [view2 addSubview:dot2];
    [view2 addSubview:dot3];
    [view2 addSubview:dot4];
    [view2 addSubview:dot5];
    [view2 addSubview:dot6];
    [view2 addSubview:dot7];
    [view2 addSubview:dot8];
    [view2 addSubview:dot9];
    [view2 addSubview:dot10];
    
[self.view addSubview:view2];


}

//-(void)moveImageForTouches:(NSSet*)touches
//{
//    UITouch * touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self.view];
//  
//    
//    if(CGRectContainsPoint(self.dot.frame, location))
//{
//        self.dot.center = location;
//    }
////    NSLog(@"%@---",location);
//}
//
//-(void ) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//  
//    UITouch *touch1 = [touches anyObject];
//    CGPoint location1 = [touch1 locationInView:self.view];
//    if (CGRectContainsPoint(self.dot.frame,location1))
//        {
//            [self moveImageForTouches:touches];
//        }
//   
//    
//}


-(void ) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    if ([touches count] == 1) {
        // one finger
        CGPoint touchPoint = [[touches anyObject] locationInView:view1];
        for (UIImageView *iView in view1.subviews) {
            if ([iView isMemberOfClass:[UIImageView class]]) {
                if (touchPoint.x > iView.frame.origin.x &&
                    touchPoint.x < iView.frame.origin.x + iView.frame.size.width &&
                    touchPoint.y > iView.frame.origin.y &&
                    touchPoint.y < iView.frame.origin.y + iView.frame.size.height)
                {
                    self.dot = iView;
                    self.touchOffset = CGPointMake(touchPoint.x - iView.frame.origin.x,
                                                   touchPoint.y - iView.frame.origin.y);
                    self.homePosition = CGPointMake(iView.frame.origin.x,
                                                    iView.frame.origin.y);
                    [self.view bringSubviewToFront:self.dot];
                }
            }
        }
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:view1];
    CGRect newDragObjectFrame = CGRectMake(touchPoint.x - _touchOffset.x,
                                           touchPoint.y - _touchOffset.y,
                                           self.dot.frame.size.width,
                                           self.dot.frame.size.height);
    self.dot.frame = newDragObjectFrame;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:view1];
    if (touchPoint.x > self.dot.frame.origin.x &&
        touchPoint.x < self.dot.frame.origin.x + self.dot.frame.size.width &&
        touchPoint.y > self.dot.frame.origin.y &&
        touchPoint.y < self.dot.frame.origin.y + self.dot.frame.size.height )
    {
        dot1.image=[UIImage imageNamed:@"1.png"];
        
        
    }
    self.dot.frame = CGRectMake(self.homePosition.x, self.homePosition.y,
                                       self.dot.frame.size.width,
                                       self.dot.frame.size.height);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//


@end
