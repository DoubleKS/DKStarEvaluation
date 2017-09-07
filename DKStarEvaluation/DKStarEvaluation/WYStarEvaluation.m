//
//  WYStarEvaluation.m
//  CheckTaskList
//
//  Created by doublek on 2017/9/6.
//  Copyright © 2017年 doublek. All rights reserved.
//

#import "WYStarEvaluation.h"

@implementation WYStarEvaluation

-(id)initWithFrame:(CGRect)frame onTheView:(UIView *)view{
    if (self=[super init]) {
        _commentText=@"无";
        //空星级imageView
        _starEmptyImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic-star-n"]];
        _starEmptyImageView.frame=frame;
        _starEmptyImageView.userInteractionEnabled=YES;
        
        [view addSubview:_starEmptyImageView];
        //满星级imageView(之前等比例适配出现问题，因为赶时间，采用了以下解决方法适配...)
        if (view.bounds.size.width==320) {
            if (view.bounds.size.height==568) {
                //5、5s
                _starImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic-star"]];
            }
            else{
                //4s
                _starImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic-star"]];
            }
        }
        else{
            //6、6plus
            _starImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic-star"]];
        }
        
        //        _starImageView.frame=CGRectMake(frame.origin.x,frame.origin.y,0,frame.size.height);
        _starImageView.frame=CGRectMake(_starEmptyImageView.frame.origin.x,_starEmptyImageView.frame.origin.y,139.5*0.8,19);
        _starImageView.contentMode=UIViewContentModeLeft;
        _starImageView.clipsToBounds=YES;
        [view addSubview:_starImageView];
        //单击手势
        UITapGestureRecognizer *tapGR=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR:)];
        [_starEmptyImageView addGestureRecognizer:tapGR];
        //拖动手势
        UIPanGestureRecognizer *panGR=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGR:)];
        [_starEmptyImageView addGestureRecognizer:panGR];
    }
    
    return self;
}

#pragma mark 手势
//单击手势
-(void)tapGR:(UITapGestureRecognizer *)tapGR{
    CGPoint tapPoint=[tapGR locationInView:_starEmptyImageView];
    _width=tapPoint.x/_starEmptyImageView.bounds.size.width;
    
    if (_width<=1/5.0) {
        if (_width<0.1) {
            _width = 0;
            _commentText=@"0分";
        }else{
            _width = 0.2;
            _commentText=@"1分";
        }
    }
    else if(_width<=2/5.0&&_width>1/5.0){
        //一般
        _width = 0.4;
        _commentText=@"2分";
    }
    else if(_width<=3/5.0&&_width>2/5.0){
        //好
        _width = 0.6;
        _commentText=@"3分";
    }
    else if(_width<=4/5.0&&_width>3/5.0){
        //很好
        _width = 0.8;
        _commentText=@"4分";
    }
    else{
        //非常好
        _width = 1.0;
        _commentText=@"5分";
    }
    //KScaleWidth(139),KScaleHeight(19)
    _starImageView.frame=CGRectMake(_starEmptyImageView.frame.origin.x,_starEmptyImageView.frame.origin.y,139.5*_width,19);
    
    if (_delegate) {
        [_delegate theCurrentCommentText:_commentText];
    }
}
//拖动手势
- (void)panGR:(UIPanGestureRecognizer *)panGR
{
    CGPoint panPoint = [panGR locationInView:_starEmptyImageView];
    _width=panPoint.x/_starEmptyImageView.bounds.size.width;
    
    if (_width<=1/5.0) {
        if (_width<0.1) {
            _width = 0;
            _commentText=@"0分";
        }else{
            _width = 0.2;
            _commentText=@"1分";
        }
    }
    else if(_width<=2/5.0&&_width>1/5.0){
        //一般
        _width = 0.4;
        _commentText=@"2分";
    }
    else if(_width<=3/5.0&&_width>2/5.0){
        //好
        _width = 0.6;
        _commentText=@"3分";
    }
    else if(_width<=4/5.0&&_width>3/5.0){
        //很好
        _width = 0.8;
        _commentText=@"4分";
    }
    else{
        //非常好
        _width = 1.0;
        _commentText=@"5分";
    }
    
    _starImageView.frame=CGRectMake(_starEmptyImageView.frame.origin.x,_starEmptyImageView.frame.origin.y,139.5*_width,19);
    
    if (_delegate) {
        [_delegate theCurrentCommentText:_commentText];
    }
}


@end
