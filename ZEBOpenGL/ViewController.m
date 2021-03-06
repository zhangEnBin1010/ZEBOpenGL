//
//  ViewController.m
//  ZEBOpenGL
//
//  Created by apple on 16/5/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import <OpenGLES/ES3/gl.h>
#import <OpenGLES/ES3/glext.h>

@interface ViewController ()<GLKViewDelegate> {
    EAGLContext *context; //EAGLContent是苹果在ios平台下实现的opengles渲染层，用于渲染结果在目标surface上的更新。
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];//这里用的是opengles3.
    if (!context) {
        NSLog(@"Failed to create ES context");
    }
    
    
    GLKView *view = (GLKView *)self.view;
    view.context = context;
    view.delegate = self;
    view.drawableColorFormat = GLKViewDrawableDepthFormat24;
    [EAGLContext setCurrentContext:context];
    glEnable(GL_DEPTH_TEST); //开启深度测试，就是让离你近的物体可以遮挡离你远的物体。
    glClearColor(0.1, 0.2, 0.3, 1); //设置surface的清除颜色，也就是渲染到屏幕上的背景色。
    
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);  //清除surface内容，恢复至初始状态。
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
