//GCD Grand Central Dispatch
/*    总结
 *
 *--------全局队列-------手动创建串行队列-----------主队列-------
 *同步   没有开启新线程     没有开启新线程        没有开启新线程
 *        串行执行          串行执行             串行执行
 *异步   有开启新线程       有开启线程           没有开启新线程
 *        并发执行          串行执行             串行执行
 */


//1,纯C语言
//2,苹果公司为多核的并行运算提出的解决方案
//3,自动利用苹果的内核
//4,自动管理线程的生命周期
//5,只需要告诉CGD需要做什么执行什么任务 ，不用编写线程的代码


//两个核心概念 任务 和 队列（GCD会自动将队列的任务取出来 放到对应的线程中执行）
//任务： 执行的任务
//队列: 存放任务的


/*
 GCD两个执行任务的方法
 dispatch_sync(dispatch_queue_t  _Nonnull queue, ^{
 
 })

 dispatch_async(dispatch_queue_t  _Nonnull queue, ^{
 
 })
 
 sync:同步 （在当前线程执行任务、不开新的线程、具备开新线程的能力）
 async:异步 （可以开启新线程、具备开新线程的能力）
 
 队列:可以分为两大类型
 一： 并发队列（Concurrent Dispatch Queue）
     1、并发可以让多个任务并发（同时）执行（自动开启多个线程同时执行任务）
     2、并发功能只能在异步（dispach_async）函数下才有效
 二：串行队列 （Serial Dispath Queue）
     1、让任务一个接着一个的执行（一个执行完了再执行下一个)
 
 容易混淆的属于
 同步和异步 影响能不能开启线程
 同步：在当前线程执行任务，不具备开启新线程的能力
 异步：在新的线程中执行任务、具备开启新线程的能力
 并发和串行 影响任务的执行方式
 并发：多个任务一块执行
 串行：一个任务执行完再执行下一个
 
 GCD中获得串行队列两种途径:
 1、创建一个串行队列
 dispatch_queue_t queue = dispatch_queue_create("cn.heima.queue", NULL);
 2、使用主队列
 主队列是GCD自带的一种特殊的串行队列
 放到主队列中的任务，都会放到主线程中执行
 
 
 */

#import "testGCDViewController.h"

@interface testGCDViewController ()

@end

@implementation testGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//     sync:同步 （在当前线程执行任务、不开新的线程、具备开新线程的能力）
//    dispatch_sync(<#dispatch_queue_t  _Nonnull queue#>, ^{
//        NSLog(@"---------%@",[NSThread currentThread]);
//    });
    
//     async:异步 （可以开启新线程、具备开新线程的能力）
    
    [self aysncSerialQueue];
}

-(void)downImage{
    
    //全局的并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //将任务 添加 全局队列中去 异步 执行
    dispatch_async(queue, ^{
        NSLog(@"下载图片---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片1---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片3---------%@",[NSThread currentThread]);
    });
    

}
-(void)leanQueue{
    /*
     
     */
}


/*
 * async --并发队列（最常用）
 *    同时 在不同 线程中 执行
 *    会不会创建线程:   会开启线程 开启多条线程
 *    任务执行方式: 并行（并发）
 */
-(void)asyncGlobQueue{

    //全局的并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //将任务 添加 全局队列中去 异步 执行
    dispatch_async(queue, ^{
        NSLog(@"下载图片---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片1---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片3---------%@",[NSThread currentThread]);
    });
}

/*
 * async --串行队列（有时候用）
 *    会不会创建线程:   会开新线程
 *    任务执行方式:串行 一个一个执行
 */
-(void)aysncSerialQueue{
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("cn.heima.queue", NULL);
    //将任务添加到串行队列
    dispatch_async(queue, ^{
        NSLog(@"下载图片---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片1---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片3---------%@",[NSThread currentThread]);
    });
}


/******************************************分割线****************************************/


/*
 * sync --并发队列
 *    会不会创建线程:   不会
 *    任务执行方式: 一个一任务执行完毕以后再执行下一个 并在在这种情况下失效了，因为没有开启线程。
 */
-(void)syncGlobalQueue{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片1---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片2---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片3---------%@",[NSThread currentThread]);
    });
}

/*
 * sync -- 串行队列
 *    会不会创建线程:   不会
 *    任务执行方式: 一个一任务执行完毕以后再执行下一个
 */

-(void)syncSerialQueue{
    
    //创建的是串行队列
    dispatch_queue_t queue =  dispatch_queue_create("cn.heima.queue", NULL);
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片1---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片2---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片3---------%@",[NSThread currentThread]);
    });
}


/*
//这种情况主要用在线程通讯
 */

-(void)mainQueue{
    //主队列。放到主队列的任务都在主线程中执行
  dispatch_queue_t queue =   dispatch_get_main_queue();
    
    //这里矛盾。因为async 是开启新线程。  结果是异步asunc失效了。没有开启线程
    dispatch_async(queue, ^{
        NSLog(@"下载图片---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片1---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2---------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片3---------%@",[NSThread currentThread]);
    });
    
    
}

/*
 * sync --- 主队列 （不能用---会卡死）
 */
-(void)syncMainQueue{
        NSLog(@"syncMainQueue--------begin---");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片1---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片2---------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"下载图片3---------%@",[NSThread currentThread]);
    });
        NSLog(@"syncMainQueue--------end---");
}





@end










