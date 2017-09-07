//
//  ViewController.m
//  DKStarEvaluation
//
//  Created by doublek on 2017/9/6.
//  Copyright © 2017年 doublek. All rights reserved.
//

#import "ViewController.h"
#import "WYStarEvaluation.h"

@interface ViewController () <WYStarEvaluationDelegate> {
    WYStarEvaluation *_starEvaluation;//星形评价
    UILabel *_commentLabel;//评论级别label
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _starEvaluation = [[WYStarEvaluation alloc]initWithFrame:CGRectMake(120,70+64,139.5,19) onTheView:self.view];
    _starEvaluation.delegate = self;
}
#pragma mark CDPStarEvaluationDelegate获得实时评价级别
-(void)theCurrentCommentText:(NSString *)commentText{
    _commentLabel.text=commentText;
    NSLog(@"%@",commentText);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
