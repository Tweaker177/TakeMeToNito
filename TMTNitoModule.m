#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <TVSystemMenuUI/TVSMButtonViewController.h>
#include "TMTNitoModule.h"

@interface LSApplicationWorkspace : NSObject
+(id)defaultWorkspace;
-(BOOL)openApplicationWithBundleID:(id)arg1;
@end

@implementation TMTNitoModule

+(long long)buttonStyle {
    return TVSMActionButtonStyleLarge; //was medium
}

-(id)contentViewController {
    
    TVSMButtonViewController *buttonController = (TVSMButtonViewController*)[super contentViewController];
    [buttonController setStyle:TVSMActionButtonStyleMedium];
    NSString *imageResourcePath = [[self bundle] pathForResource:@"NitoTV" ofType:@"png"];
    //important to make this a template image so it works properly with both light and dark mode
    UIImage *moduleImage = [[UIImage imageWithContentsOfFile:imageResourcePath] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [buttonController setImage:moduleImage];
    return buttonController;
}

-(void)handleAction {
    
    [[LSApplicationWorkspace defaultWorkspace] openApplicationWithBundleID:@"com.nito.nitoTV4"];
    
}

-(BOOL)dismissAfterAction {
    return 1;
}

@end
