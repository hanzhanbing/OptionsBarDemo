# OptionsBarDemo

/***************第一种***************/

NSArray *controllersArr = @[allOrderVC, untreatedOrderVC, treatedOrderVC,completedOrderVC];
OptionBarController *navTabBarController = [[OptionBarController alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 44) andSubViewControllers:controllersArr andParentViewController:self andSelectedViewColor:[UIColor whiteColor] andSelectedTextColor:AppThemeColor andShowSeperateLine:NO andShowBottomLine:YES];
navTabBarController.linecolor=AppThemeColor;


/***************第二种***************/

NSArray *controllersArr = @[allOrderVC, untreatedOrderVC, treatedOrderVC,completedOrderVC];
OptionBarController *navTabBarController = [[OptionBarController alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 44) andSubViewControllers:controllersArr andParentViewController:self andSelectedViewColor:AppThemeColor andSelectedTextColor:[UIColor whiteColor] andShowSeperateLine:NO andShowBottomLine:NO];
navTabBarController.linecolor=AppThemeColor;

