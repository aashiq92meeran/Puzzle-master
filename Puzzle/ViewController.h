//
//  ViewController.h
//  Puzzle
//
//  Created by BSA univ 1 on 20/06/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKDragView.h"


@interface ViewController : UIViewController <UICollectionViewDataSource , UICollectionViewDelegate>

{
    
@public float oldX, oldY;
@public  BOOL dragging;
@public CGPoint startLocation;

    
}

@property (nonatomic,strong)NSMutableArray *images;
@property (nonatomic,strong)UIView * view1;
@property (nonatomic,strong)UIView * view2;
@property(nonatomic,strong) UIImageView * dot;
@property (nonatomic, assign) CGPoint touchOffset;
@property (nonatomic, assign) CGPoint homePosition;


@property TKDragView * tobj;

@end
