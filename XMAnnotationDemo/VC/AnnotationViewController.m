//
//  AnnotationViewController.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/16.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "AnnotationViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "XMAnnotationView.h"
#import "UIImage+Utilitly.h"


@interface AnnotationViewController ()

@property (nonatomic,strong)XMAnnotationView * xmImageView;
@property (nonatomic,strong)UIImage * originImage;


@end

@implementation AnnotationViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated{
    NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utilitly
- (void)requestWebImg:(CGRect)rect
{
    self.originImage = [UIImage imageNamed:@"tupian"];
//    CGFloat originImageWidth = self.originImage.size.width;
//    CGFloat originImageHeight = self.originImage.size.height;
//    CGFloat imageRatio = originImageWidth / originImageHeight;
//    CGFloat viewRatio = rect.size.width / rect.size.height;
//
//    CGFloat imageWidth = 0,imageHeight = 0;
//
//    if (imageRatio > viewRatio) {
//        imageWidth = rect.size.width;
//        imageHeight = imageWidth / imageRatio;
//    } else {
//        imageHeight = rect.size.height;
//        imageWidth = imageHeight * imageRatio;
//    }
//
    CGSize size = rect.size;
    UIImage * image = [self.originImage compressImageWithPointSize:size];
//    UIImage
    UIColor * c = [UIColor colorWithPatternImage:image];
    [self.xmImageView setBackgroundColor:c];
    
    
}



#pragma mark - UI
- (void)setupUI
{
    self.navigationItem.title = @"标注页面";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.xmImageView.layer.borderWidth = 1.0;
    self.xmImageView.layer.borderColor = [UIColor redColor].CGColor;
    self.xmImageView.backgroundColor = [UIColor whiteColor];
    self.xmImageView.userInteractionEnabled = YES;
    [self.view addSubview:self.xmImageView];
    [self.xmImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).offset(100);
        make.right.mas_equalTo(self.view).offset(-100);
    }];
    self.xmImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.xmImageView.layer.borderWidth = 1.0;
    self.xmImageView.layer.masksToBounds = YES;
    
    UIButton * cleanBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [cleanBtn setTitle:@"清空" forState:UIControlStateNormal];
    [[cleanBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView cleanAllRect];
    }];
    [self.view addSubview:cleanBtn];
    [cleanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * ratationClockwiseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [ratationClockwiseBtn setTitle:@"顺时旋转" forState:UIControlStateNormal];
    [ratationClockwiseBtn setImage:[UIImage imageNamed:@"clockwise"] forState:UIControlStateNormal];
    [[ratationClockwiseBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView clockwiseRatation];
    }];
    [self.view addSubview:ratationClockwiseBtn];
    [ratationClockwiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(cleanBtn.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * ratationAntiClockwiseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [ratationAntiClockwiseBtn setTitle:@"逆时旋转" forState:UIControlStateNormal];
    [[ratationAntiClockwiseBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView annotationMinWidth];
    }];
    [self.view addSubview:ratationAntiClockwiseBtn];
    [ratationAntiClockwiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(ratationClockwiseBtn.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * hiddenAllBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [hiddenAllBtn setTitle:@"隐藏" forState:UIControlStateNormal];
    [[hiddenAllBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView hiddenAllRect];
    }];
    [self.view addSubview:hiddenAllBtn];
    [hiddenAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(ratationAntiClockwiseBtn.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * undoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [undoBtn setTitle:@"撤销" forState:UIControlStateNormal];
    [[undoBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView undo];
    }];
    [self.view addSubview:undoBtn];
    [undoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(hiddenAllBtn.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * annTypeDrawBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [annTypeDrawBtn setTitle:@"画框" forState:UIControlStateNormal];
    [[annTypeDrawBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        self.xmImageView.annotationType = AnnotationTypeDraw;
    }];
    [self.view addSubview:annTypeDrawBtn];
    [annTypeDrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(undoBtn.mas_bottom).offset(40);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * annTypeMoveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [annTypeMoveBtn setTitle:@"移动" forState:UIControlStateNormal];
    [[annTypeMoveBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        self.xmImageView.annotationType = AnnotationTypeMove;
    }];
    [self.view addSubview:annTypeMoveBtn];
    [annTypeMoveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(annTypeDrawBtn.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * annTypeScaleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [annTypeScaleBtn setTitle:@"缩放" forState:UIControlStateNormal];
    [[annTypeScaleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        self.xmImageView.annotationType = AnnotationTypeScale;
    }];
    [self.view addSubview:annTypeScaleBtn];
    [annTypeScaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(annTypeMoveBtn.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * annTypeErasureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [annTypeErasureBtn setTitle:@"擦除" forState:UIControlStateNormal];
    [[annTypeErasureBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        self.xmImageView.annotationType = AnnotationTypeErasure;
    }];
    [self.view addSubview:annTypeErasureBtn];
    [annTypeErasureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(annTypeScaleBtn.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.xmImageView.mas_left).offset(-12);
        make.height.mas_equalTo(15);
    }];
    
    
    
    UIButton * upBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [upBtn setTitle:@"上" forState:UIControlStateNormal];
    [[upBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView handleUp];
    }];
    [self.view addSubview:upBtn];
    [upBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view).offset(12);
        make.right.mas_equalTo(self.view.mas_right).offset(-12);
        make.left.mas_equalTo(self.xmImageView.mas_right).offset(12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * downBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [downBtn setTitle:@"下" forState:UIControlStateNormal];
    [downBtn setImage:[UIImage imageNamed:@"clockwise"] forState:UIControlStateNormal];
    [[downBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView handleDown];
    }];
    [self.view addSubview:downBtn];
    [downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(upBtn.mas_bottom).offset(12);
        make.right.mas_equalTo(self.view.mas_right).offset(-12);
        make.left.mas_equalTo(self.xmImageView.mas_right).offset(12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftBtn setTitle:@"左" forState:UIControlStateNormal];
    [[leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView handleLeft];
    }];
    [self.view addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(downBtn.mas_bottom).offset(12);
        make.right.mas_equalTo(self.view.mas_right).offset(-12);
        make.left.mas_equalTo(self.xmImageView.mas_right).offset(12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBtn setTitle:@"右" forState:UIControlStateNormal];
    [[rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView handleRight];
    }];
    [self.view addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(leftBtn.mas_bottom).offset(12);
        make.right.mas_equalTo(self.view.mas_right).offset(-12);
        make.left.mas_equalTo(self.xmImageView.mas_right).offset(12);
        make.height.mas_equalTo(15);
    }];
    
    UIButton * blankBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [blankBtn setTitle:@"空格" forState:UIControlStateNormal];
    [[blankBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.xmImageView handleBlank];
    }];
    [self.view addSubview:blankBtn];
    [blankBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(rightBtn.mas_bottom).offset(12);
        make.right.mas_equalTo(self.view.mas_right).offset(-12);
        make.left.mas_equalTo(self.xmImageView.mas_right).offset(12);
        make.height.mas_equalTo(15);
    }];
}



#pragma mark - 旋转相关
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationLandscapeRight;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

#pragma mark - Lazy
- (XMAnnotationView *)xmImageView
{
    if (!_xmImageView)
    {
        _xmImageView = [[XMAnnotationView alloc] init];
        _xmImageView.image = [UIImage imageNamed:@"coordinate"];
        _xmImageView.annotationMinWidth = 10;
        _xmImageView.annotationMinHeight = 10;
    }
    return _xmImageView;
}

@end
