//
//  ViewController.m
//  animationMenu
//
//  Created by ersun on 9.12.2013.
//  Copyright (c) 2013 ersun. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    int p;
    UILabel* label;
}

@end

@implementation ViewController


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch* touc=[touches anyObject];
    CGPoint begin=self.menu.center;
    double imageH= self.menu.bounds.size.height/2;
    CGPoint toucherpoint=[touc locationInView:self.mainCycle];
    float x=toucherpoint.x-begin.x;
    float y=toucherpoint.y-begin.y;
    int s=p;
   
    NSLog(@"%f    %f",x,y);
    if(y<0 && y>-imageH && x<0 && x >-imageH){
        if((x+y)>-90){
        s=s+1;
        if (s==4) {
            s=1;
        }}
    }else if(y<0 && y>-imageH && x>0 && x<imageH){
        if((x+y)<90){
        s=s-1;
        if(s==0)
            s=3;
        }}
    [self anime:s];
    
    
    
}

- (IBAction)pressedThree:(id)sender {
    [self anime:3];
    
}

- (IBAction)pressedTwo:(id)sender {
     [self anime:2];
}

- (IBAction)pressedOne:(id)sender {
     [self anime:1];
}

-(void)anime:(int)nowp{
    
  [UIView animateWithDuration:0.1 animations:^{
      CGAffineTransform cd=CGAffineTransformMakeRotation((M_PI/3)*2*(p-nowp));
      self.menu.transform=CGAffineTransformConcat(self.menu.transform, cd);
    }];
    p=nowp;
    [self openMenuTab];
 
}


-(void)openMenuTab{
    
   label.text=p==2?@"İkiye tıkladınız":p==1?@"Bire tıklandı":@"Sanırım 3 ";
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    CGAffineTransform t=CGAffineTransformMakeRotation(M_PI/3);
    self.menu.transform=t;
    p=2;
    
    UIView* pMenu=[[UIView alloc]init];
    label=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, 130, 40)];
    [pMenu setFrame:CGRectMake(100, 400, 150, 50)];
    [self.view addSubview:pMenu];
    [pMenu addSubview:label];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
