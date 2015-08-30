//
//  BLArchiveViewController.m
//  BLDataSaveDemo
//
//  Created by duansong on 15-7-14.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import "BLArchiveViewController.h"
#import "BLUtility.h"
#import "BLUser.h"

#define UserDataName @"userData.dat"

@implementation BLArchiveViewController

#pragma mark -
#pragma mark about view methods

- (void)viewDidLoad {
	[self initVariables];
	[self initComponents];
    [super viewDidLoad];
}


#pragma mark -
#pragma mark custom methods

- (void) initVariables {
	
}

- (void) initComponents {
    
    // 添加标题
	self.navigationItem.title = @"归档数据";
	
    // 添加读取按钮，并绑定 readButtonClicked: 方法
	UIBarButtonItem *readButton = [[UIBarButtonItem alloc] initWithTitle:@"读取" style:UIBarButtonItemStylePlain
																  target:self action:@selector(readButtonClicked:)];
	self.navigationItem.leftBarButtonItem = readButton;
	
    // 添加写入按钮，并绑定 writeButtonClicked: 方法
	UIBarButtonItem *writeButton = [[UIBarButtonItem alloc] initWithTitle:@"写入" style:UIBarButtonItemStylePlain
																  target:self action:@selector(writeButtonClicked:)];
	self.navigationItem.rightBarButtonItem = writeButton;
    
    CGFloat width = self.view.bounds.size.width - 40;
	
    // 添加用户名文本框
	_userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 74, width, 31)];
	_userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
	_userNameTextField.textAlignment = NSTextAlignmentCenter;
	_userNameTextField.font = [UIFont systemFontOfSize:15.0f];
	_userNameTextField.placeholder = @"请输入用户名";
	_userNameTextField.returnKeyType = UIReturnKeyDone;
	_userNameTextField.delegate = self;
	[self.view addSubview:_userNameTextField];
	
    // 添加电邮文本框
	_emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 115, width, 31)];
	_emailTextField.borderStyle = UITextBorderStyleRoundedRect;
	_emailTextField.textAlignment = NSTextAlignmentCenter;
	_emailTextField.font = [UIFont systemFontOfSize:15.0f];
	_emailTextField.placeholder = @"请输入email";
	_emailTextField.returnKeyType = UIReturnKeyDone;
	_emailTextField.delegate = self;
	[self.view addSubview:_emailTextField];
    
    // 添加密码文本框
	_passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 156, width, 31)];
	_passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
	_passwordTextField.textAlignment = NSTextAlignmentCenter;
	_passwordTextField.font = [UIFont systemFontOfSize:15.0f];
	_passwordTextField.placeholder = @"请输入密码";
	_passwordTextField.returnKeyType = UIReturnKeyDone;
	_passwordTextField.delegate = self;
	[self.view addSubview:_passwordTextField];
	
    // 添加年龄文本框
	_ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 197, width, 31)];
	_ageTextField.borderStyle = UITextBorderStyleRoundedRect;
	_ageTextField.textAlignment = NSTextAlignmentCenter;
	_ageTextField.font = [UIFont systemFontOfSize:15.0f];
	_ageTextField.placeholder = @"请输入年龄";
	_ageTextField.returnKeyType = UIReturnKeyDone;
	_ageTextField.delegate = self;
	[self.view addSubview:_ageTextField];
    
    // 测试保存文档和 plist 的按钮，绑定 writeFileButtonClicked: 方法
    UIButton *writeFileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    writeFileButton.frame = CGRectMake(10, 197 + 31 + 10, 200, 40);
    [writeFileButton setTitle:@"简单数据写入" forState:UIControlStateNormal];
    [writeFileButton setBackgroundColor:[UIColor redColor]];
    [writeFileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [writeFileButton addTarget:self action:@selector(writeFileButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:writeFileButton];
}


#pragma mark -
#pragma mark 三个按钮绑定的方法


/**
 *  测试保存文档和 plist 的按钮关联的 Action 方法
 *
 *  @param sender <#sender description#>
 */
- (void)writeFileButtonClicked:(id)sender
{
    // 1 - 测试字符串文档，保存到 Documents
    // 1.1 - 生成并保存
    NSString *string = @"ABC副经理";
    NSString *stringFilePath = [BLUtility getPathWithinDocumentDir:@"string.text"];
    [BLUtility createDirectory:stringFilePath lastComponentIsDirectory:NO];
    [string writeToFile:stringFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    // 1.2 - 读取测试文档
    NSString *cachedString = [NSString stringWithContentsOfFile:stringFilePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"--> %@", cachedString);
    
    // 1.3 - 删除测试文档
    [BLUtility removeFile:stringFilePath];
   
    // 2 - 测试 plist，保存到 Documents
    
    // 2.1 - 保存并读取 NSDictionary 格式测试 plist
    NSDictionary *dictionary = @{@"age":@90, @"name":@"zhangsan"};
    NSString *dicPath = [BLUtility getPathWithinDocumentDir:@"dic.plist"];
    [dictionary writeToFile:dicPath atomically:YES];
    
    NSDictionary *cachedDic = [NSDictionary dictionaryWithContentsOfFile:dicPath];
    NSLog(@"%@", cachedDic);
    
    // 2.2 - 保存并读取 NSArray 格式测试 plist
    NSArray *array = [NSArray arrayWithObjects:@"abc", @80, dictionary, nil];
    NSString *arrayPath = [BLUtility getPathWithinDocumentDir:@"array.plist"];
    [array writeToFile:arrayPath atomically:YES];
    
    NSArray *cachedArray = [NSArray arrayWithContentsOfFile:arrayPath];
    NSLog(@"%@", cachedArray);
}

/**
 *  读取按钮关联的 Action 方法
 *
 *  @param sender <#sender description#>
 */
- (void) readButtonClicked:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger test = [userDefaults integerForKey:@"integer"];
    NSLog(@"test = %li", test);
    
	NSString *userDataPath = [BLUtility getPathWithinDocumentDir:UserDataName];
	if ([userDataPath length] > 0 && [[NSFileManager defaultManager] fileExistsAtPath:userDataPath]) {
        NSData *userData = [NSData dataWithContentsOfFile:userDataPath];
        BLUser *user     = (BLUser *)[BLUtility unarchiverObject:userData withKey:@"UserData"];
        
        _userNameTextField.text = user.userName;
        _emailTextField.text    = user.email;
        _passwordTextField.text = user.password;
        _ageTextField.text      = [NSString stringWithFormat:@"%ld", user.age];
	}
}

/**
 *  写入按钮关联的 Action 方法
 *
 *  @param sender <#sender description#>
 */
- (void) writeButtonClicked:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:66 forKey:@"integer"];
    
    BLUser *user  = [[BLUser alloc] init];
    user.userName = _userNameTextField.text;
    user.email    = _emailTextField.text;
    user.password = _passwordTextField.text;
    user.age      = [_ageTextField.text intValue];
	
	NSData *userData = [BLUtility archiverObject:user forKey:@"UserData"];
	
	NSString *userDataPath = [BLUtility getPathWithinDocumentDir:UserDataName];
	[userData writeToFile:userDataPath atomically:YES];
}


#pragma mark -
#pragma mark UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}


#pragma mark -
#pragma mark memory management methods

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
}


@end
