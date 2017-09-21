.class public Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;
.super Ljava/lang/Object;
.source "LuaCallManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;
    }
.end annotation


# static fields
.field public static final TAG_LOG:Ljava/lang/String; = "LuaCallManager"

.field public static final kluaCallEvent:Ljava/lang/String; = "LuaCallEvent"

.field private static luaCallManager:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;


# instance fields
.field private mSmsObserver:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1442
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->mSmsObserver:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    .line 66
    return-void
.end method

.method private callSpecialMethod()V
    .locals 3

    .prologue
    .line 672
    const-string v1, "boyaa_godsdk"

    const-string v2, "special_method"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 673
    .local v0, "params":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$14;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$14;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 680
    return-void
.end method

.method private chooseImage()V
    .locals 2

    .prologue
    .line 694
    const-string v0, "chooseImage"

    const/16 v1, 0x4de

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 695
    return-void
.end method

.method private clipboardClean()V
    .locals 0

    .prologue
    .line 435
    invoke-static {}, Lcom/boyaa/extension/Clipboard;->clean()V

    .line 436
    return-void
.end method

.method private clipboardGetText()V
    .locals 3

    .prologue
    .line 438
    invoke-static {}, Lcom/boyaa/extension/Clipboard;->getText()Ljava/lang/String;

    move-result-object v0

    .line 439
    .local v0, "text":Ljava/lang/String;
    const-string v1, "boyaa_clipboard"

    const-string v2, "text"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    return-void
.end method

.method private clipboardSetText()V
    .locals 3

    .prologue
    .line 443
    const-string v1, "boyaa_clipboard"

    const-string v2, "text"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 444
    .local v0, "text":Ljava/lang/String;
    invoke-static {v0}, Lcom/boyaa/extension/Clipboard;->setText(Ljava/lang/String;)V

    .line 445
    return-void
.end method

.method private createQR()V
    .locals 3

    .prologue
    .line 406
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const-string v2, "createQR"

    invoke-virtual {v1, v2}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 407
    .local v0, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$1;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$1;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 414
    return-void
.end method

.method private enterServiceChat()V
    .locals 3

    .prologue
    .line 423
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const-string v2, "enterServiceChat"

    invoke-virtual {v1, v2}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 424
    .local v0, "serviceChatStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$2;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$2;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 432
    return-void
.end method

.method private getApkInstallTime()V
    .locals 0

    .prologue
    .line 652
    invoke-static {}, Lcom/boyaa/app/sys/SystemInfo;->getApkInstallTime()V

    .line 653
    return-void
.end method

.method private getAvailMemoryForLua()V
    .locals 0

    .prologue
    .line 360
    invoke-static {}, Lcom/boyaa/util/MemoryUtil;->getAvailMemoryForLua()V

    .line 361
    return-void
.end method

.method private getGprsState()V
    .locals 4

    .prologue
    .line 368
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v1}, Lcom/boyaa/util/ToolKit;->getGprsState(Landroid/content/Context;)Z

    move-result v0

    .line 369
    .local v0, "state":Z
    const-string v2, "boyaa_network"

    const-string v3, "gprsState"

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v3, v1}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 370
    return-void

    .line 369
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getInstance()Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->luaCallManager:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    invoke-direct {v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;-><init>()V

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->luaCallManager:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    .line 76
    :cond_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->luaCallManager:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    return-object v0
.end method

.method private getWifiState()V
    .locals 4

    .prologue
    .line 372
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v1}, Lcom/boyaa/util/ToolKit;->getWifiState(Landroid/content/Context;)Z

    move-result v0

    .line 373
    .local v0, "state":Z
    const-string v2, "boyaa_network"

    const-string v3, "wifiState"

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v3, v1}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 374
    return-void

    .line 373
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private imGetContractsInfo()V
    .locals 4

    .prologue
    .line 472
    invoke-static {}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->getInstance()Lcom/boyaa/entity/imsdk/ImSDKHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->getContractsInfo()Ljava/lang/String;

    move-result-object v0

    .line 473
    .local v0, "jsonData":Ljava/lang/String;
    const-string v1, "IMSDK JAVA"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "imGetContractsInfo jsonData = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    if-eqz v0, :cond_0

    .line 475
    const-string v1, "boyaa_imsdk"

    const-string v2, "contracts"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    :cond_0
    return-void
.end method

.method private imGetCurrentLocation()V
    .locals 4

    .prologue
    .line 461
    invoke-static {}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->getInstance()Lcom/boyaa/entity/imsdk/ImSDKHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->getLocation()Ljava/lang/String;

    move-result-object v0

    .line 462
    .local v0, "jsonData":Ljava/lang/String;
    const-string v1, "IMSDK JAVA"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "imGetCurrentLocation jsonData = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    if-eqz v0, :cond_0

    .line 464
    const-string v1, "boyaa_imsdk"

    const-string v2, "coordinate"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    :cond_0
    return-void
.end method

.method private imGetGotoGps()V
    .locals 1

    .prologue
    .line 453
    invoke-static {}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->getInstance()Lcom/boyaa/entity/imsdk/ImSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->goGPSSetting()V

    .line 454
    return-void
.end method

.method private imStartAudioPlay()V
    .locals 4

    .prologue
    .line 509
    const-string v1, "boyaa_imsdk"

    const-string v2, "sessionidPath"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 510
    .local v0, "filePath":Ljava/lang/String;
    const-string v1, "IMSDK JAVA"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "imStartAudioPlay filePath = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$5;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$5;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 520
    return-void
.end method

.method private imStartAudioRecord()V
    .locals 2

    .prologue
    .line 483
    const-string v0, "IMSDK JAVA"

    const-string v1, "imStartAudioRecord"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$3;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$3;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 490
    return-void
.end method

.method private imStopAudioPlay()V
    .locals 2

    .prologue
    .line 526
    const-string v0, "IMSDK JAVA"

    const-string v1, "imStopAudioPlay"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 527
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$6;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$6;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 533
    return-void
.end method

.method private imStopAudioRecord()V
    .locals 2

    .prologue
    .line 496
    const-string v0, "IMSDK JAVA"

    const-string v1, "imStopAudioRecord"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$4;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$4;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 503
    return-void
.end method

.method private isThirdPartySupportLogout()V
    .locals 1

    .prologue
    .line 584
    invoke-static {}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->getInstance()Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->isThirdPartySupportLogout()V

    .line 585
    return-void
.end method

.method private isThirdPartySupportSwitchAccount()V
    .locals 1

    .prologue
    .line 576
    invoke-static {}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->getInstance()Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->isThirdPartySupportSwitchAccount()V

    .line 577
    return-void
.end method

.method private openQQ()V
    .locals 2

    .prologue
    .line 540
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$7;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$7;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 547
    return-void
.end method

.method private openSms()V
    .locals 5

    .prologue
    .line 377
    const-string v3, "boyaa_sms"

    const-string v4, "text"

    invoke-static {v3, v4}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 378
    .local v2, "text":Ljava/lang/String;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 379
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 380
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "text"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    const/16 v3, 0x4f1

    iput v3, v1, Landroid/os/Message;->what:I

    .line 382
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 384
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 385
    return-void
.end method

.method private qqShareWebPage()V
    .locals 3

    .prologue
    .line 553
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const-string v2, "qqShareWebPage"

    invoke-virtual {v1, v2}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 554
    .local v0, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$8;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$8;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 561
    return-void
.end method

.method private requestGodSDKPay()V
    .locals 4

    .prologue
    .line 659
    const-string v2, "boyaa_godsdk"

    const-string v3, "pay_params"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 660
    .local v0, "payParams":Ljava/lang/String;
    const-string v2, "boyaa_godsdk"

    const-string v3, "pay_pmode"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 662
    .local v1, "pmode":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;

    invoke-direct {v3, p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 669
    return-void
.end method

.method private requestThirdPartyLogin()V
    .locals 1

    .prologue
    .line 572
    invoke-static {}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->getInstance()Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->requestThirdPartyLogin()V

    .line 573
    return-void
.end method

.method private requestThirdPartyLogout()V
    .locals 1

    .prologue
    .line 588
    invoke-static {}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->getInstance()Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->requestThirdPartyLogout()V

    .line 589
    return-void
.end method

.method private requestThirdPartySwitchAccount()V
    .locals 1

    .prologue
    .line 580
    invoke-static {}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->getInstance()Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->requestThirdPartySwitchAccount()V

    .line 581
    return-void
.end method

.method private scanQR()V
    .locals 2

    .prologue
    .line 417
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 418
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x4f5

    iput v1, v0, Landroid/os/Message;->what:I

    .line 419
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 420
    return-void
.end method

.method private setFPS()V
    .locals 4

    .prologue
    .line 364
    const-string v1, "SETFPS"

    const-string v2, "fps"

    const/16 v3, 0x3c

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 365
    .local v0, "fps":I
    invoke-static {v0}, Lcom/boyaa/entity/common/FPSController;->setFPS(I)V

    .line 366
    return-void
.end method

.method private setLogSwitch()V
    .locals 4

    .prologue
    .line 352
    :try_start_0
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v2

    const-string v3, "refreshPlatformLogSwitch"

    invoke-virtual {v2, v3}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 353
    .local v1, "jsonStr":Ljava/lang/String;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 354
    .local v0, "json":Lorg/json/JSONObject;
    const-string v2, "debugSwitch"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Lcom/boyaa/app/debug/Log;->setLogSwitch(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    .end local v0    # "json":Lorg/json/JSONObject;
    .end local v1    # "jsonStr":Ljava/lang/String;
    :goto_0
    return-void

    .line 355
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method protected static spiltString(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "n"    # I

    .prologue
    .line 1064
    const/4 v1, 0x0

    .line 1065
    .local v1, "index":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 1066
    .local v3, "strLen":I
    if-lt p1, v3, :cond_0

    .line 1082
    .end local p0    # "s":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 1070
    .restart local p0    # "s":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1071
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, p1, :cond_1

    .line 1082
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 1072
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0xff

    if-ge v4, v5, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-gtz v4, :cond_3

    :cond_2
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1073
    :cond_3
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1074
    add-int/lit8 v0, v0, 0x1

    .line 1075
    add-int/lit8 v1, v1, 0x1

    .line 1076
    goto :goto_1

    .line 1077
    :cond_4
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1078
    add-int/lit8 v1, v1, 0x1

    .line 1079
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private uploadFeedbackImage()V
    .locals 2

    .prologue
    .line 698
    const-string v0, "uploadFeedbackImage"

    const/16 v1, 0x4df

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 699
    return-void
.end method

.method private videoCloseMicrophone()V
    .locals 2

    .prologue
    .line 596
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$9;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$9;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 604
    return-void
.end method

.method private videoLogin()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 635
    const-string v0, "boyaa_videosdk"

    const-string v1, "app_id"

    invoke-static {v0, v1, v7}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    .line 636
    .local v3, "appId":I
    const-string v0, "boyaa_videosdk"

    const-string v1, "user_id"

    invoke-static {v0, v1, v7}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v4

    .line 637
    .local v4, "userId":I
    const-string v0, "boyaa_videosdk"

    const-string v1, "room_id"

    invoke-static {v0, v1, v7}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v5

    .line 638
    .local v5, "roomId":I
    const-string v0, "boyaa_videosdk"

    const-string v1, "support_2g"

    invoke-static {v0, v1, v7}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    .line 639
    .local v2, "support2G":I
    const-string v0, "boyaa_videosdk"

    const-string v1, "version"

    const/4 v7, 0x1

    invoke-static {v0, v1, v7}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    .line 640
    .local v6, "version":I
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v7

    new-instance v0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;IIIII)V

    invoke-virtual {v7, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 649
    return-void
.end method

.method private videoLogout()V
    .locals 2

    .prologue
    .line 622
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$11;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$11;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 631
    return-void
.end method

.method private videoOpenMicrophone()V
    .locals 3

    .prologue
    .line 608
    const-string v1, "boyaa_videosdk"

    const-string v2, "network_tips"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 609
    .local v0, "networkTips":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$10;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$10;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 618
    return-void
.end method


# virtual methods
.method protected CloseStartScreen()V
    .locals 2

    .prologue
    .line 719
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 720
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    .line 721
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 722
    return-void
.end method

.method public DelView()V
    .locals 2

    .prologue
    .line 1258
    const-string v0, "DelWebView"

    const/16 v1, 0x4b6

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1259
    return-void
.end method

.method protected DeviceShake()V
    .locals 4

    .prologue
    .line 932
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x458

    .line 933
    const-string v2, ""

    const-string v3, ""

    .line 932
    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 934
    return-void
.end method

.method protected GetBatteryLevel()V
    .locals 4

    .prologue
    .line 1225
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x20b

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 1226
    return-void
.end method

.method protected GetNetworkActivity()V
    .locals 4

    .prologue
    .line 802
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x201

    .line 803
    const-string v2, ""

    const-string v3, ""

    .line 802
    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 804
    return-void
.end method

.method protected GetNetworkAvailability()V
    .locals 4

    .prologue
    .line 794
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    .line 795
    const/16 v1, 0x200

    const-string v2, ""

    const-string v3, ""

    .line 794
    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 796
    return-void
.end method

.method public GoBackWebView()V
    .locals 2

    .prologue
    .line 1254
    const-string v0, "GoBackWebViewUrl"

    const/16 v1, 0x4b5

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1255
    return-void
.end method

.method protected HideLoadingDialog()V
    .locals 2

    .prologue
    .line 834
    const-string v0, "HideLoadingDialog"

    .line 835
    const/16 v1, 0x4da

    .line 834
    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 836
    return-void
.end method

.method protected HideLoadingScene()V
    .locals 2

    .prologue
    .line 818
    const-string v0, "HideLoadingScene"

    .line 819
    const/16 v1, 0x204

    .line 818
    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 820
    return-void
.end method

.method protected MergeNewApk()V
    .locals 1

    .prologue
    .line 703
    new-instance v0, Lcom/boyaa/engine/patchupdate/ApkMerge;

    invoke-direct {v0}, Lcom/boyaa/engine/patchupdate/ApkMerge;-><init>()V

    .line 704
    .local v0, "apkMerge":Lcom/boyaa/engine/patchupdate/ApkMerge;
    invoke-virtual {v0}, Lcom/boyaa/engine/patchupdate/ApkMerge;->Execute()V

    .line 705
    return-void
.end method

.method public NewWebView()V
    .locals 2

    .prologue
    .line 1247
    const-string v0, "NewWebView"

    const/16 v1, 0x4b3

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1248
    return-void
.end method

.method protected PatchApkInstall()V
    .locals 5

    .prologue
    .line 709
    const-string v3, "patchUpdate"

    const-string v4, "newApkPath"

    invoke-static {v3, v4}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 710
    .local v2, "newApkPath":Ljava/lang/String;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 711
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 712
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "newApkPath"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    const/16 v3, 0x4d8

    iput v3, v1, Landroid/os/Message;->what:I

    .line 714
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 715
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 716
    return-void
.end method

.method public SetWebViewUrl()V
    .locals 2

    .prologue
    .line 1250
    const-string v0, "SetWebViewUrl"

    const/16 v1, 0x4b4

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1251
    return-void
.end method

.method protected ShowLoadingDialog()V
    .locals 2

    .prologue
    .line 826
    const-string v0, "ShowLoadingDialog"

    .line 827
    const/16 v1, 0x4d9

    .line 826
    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 828
    return-void
.end method

.method protected ShowLoadingScene()V
    .locals 2

    .prologue
    .line 810
    const-string v0, "ShowLoadingScene"

    .line 811
    const/16 v1, 0x203

    .line 810
    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 812
    return-void
.end method

.method protected ShowToast()V
    .locals 2

    .prologue
    .line 839
    const-string v0, "ShowToast"

    .line 840
    const/16 v1, 0x4db

    .line 839
    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 841
    return-void
.end method

.method protected StartAlixPay()V
    .locals 3

    .prologue
    .line 1174
    const-string v1, "IAPPayInfo"

    .line 1175
    const-string v2, "json_data"

    .line 1174
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1176
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1177
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2ca

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1178
    return-void
.end method

.method protected StartHuaFuBaoPay()V
    .locals 3

    .prologue
    .line 1204
    const-string v1, "IAPPayInfo"

    .line 1205
    const-string v2, "json_data"

    .line 1204
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1206
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1207
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2ce

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1208
    return-void
.end method

.method protected StartHuaJianPay()V
    .locals 3

    .prologue
    .line 1143
    const-string v1, "IAPPayInfo"

    .line 1144
    const-string v2, "json_data"

    .line 1143
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1145
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1146
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2c7

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1147
    return-void
.end method

.method protected StartMobilePay()V
    .locals 3

    .prologue
    .line 1133
    const-string v1, "IAPPayInfo"

    .line 1134
    const-string v2, "json_data"

    .line 1133
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1135
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1136
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2c6

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1137
    return-void
.end method

.method protected StartQianChiPay()V
    .locals 3

    .prologue
    .line 1194
    const-string v1, "IAPPayInfo"

    .line 1195
    const-string v2, "json_data"

    .line 1194
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1196
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1197
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2cd

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1198
    return-void
.end method

.method protected StartSystemTimer()V
    .locals 5

    .prologue
    .line 731
    const-string v2, "SystemTimer"

    const-string v3, "Id"

    .line 732
    const/16 v4, 0x3e8

    .line 731
    invoke-static {v2, v3, v4}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 733
    .local v0, "id":I
    const-string v2, "SystemTimer"

    const-string v3, "Time"

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 734
    .local v1, "ms":I
    int-to-long v2, v1

    invoke-static {v0, v2, v3}, Lcom/boyaa/enginedlqp/maindevelop/Game;->SetTimeout(IJ)V

    .line 735
    return-void
.end method

.method protected StartTelecomPay()V
    .locals 3

    .prologue
    .line 1164
    const-string v1, "IAPPayInfo"

    .line 1165
    const-string v2, "json_data"

    .line 1164
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1166
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1167
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2c9

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1168
    return-void
.end method

.method protected StartUnionPay()V
    .locals 3

    .prologue
    .line 1184
    const-string v1, "IAPPayInfo"

    .line 1185
    const-string v2, "json_data"

    .line 1184
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1186
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1187
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2cb

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1188
    return-void
.end method

.method protected StartWoPay()V
    .locals 3

    .prologue
    .line 1154
    const-string v1, "IAPPayInfo"

    .line 1155
    const-string v2, "json_data"

    .line 1154
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1156
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1157
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2c8

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1158
    return-void
.end method

.method protected StartYiBaoPay()V
    .locals 3

    .prologue
    .line 1215
    const-string v1, "IAPPayInfo"

    .line 1216
    const-string v2, "json_data"

    .line 1215
    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1217
    .local v0, "alixdata":Ljava/lang/String;
    const-string v1, "IAPPayInfo"

    const-string v2, "IAPPayInfo_parm"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1218
    const-string v1, "IAPPayInfo"

    const/16 v2, 0x2cc

    invoke-virtual {p0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1219
    return-void
.end method

.method protected StopSystemTimer()V
    .locals 4

    .prologue
    .line 738
    const-string v1, "SystemTimer"

    const-string v2, "Id"

    .line 739
    const/16 v3, 0x3e8

    .line 738
    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 740
    .local v0, "id":I
    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->ClearTimeout(I)V

    .line 741
    return-void
.end method

.method protected UploadHeadImage()V
    .locals 2

    .prologue
    .line 779
    sget-object v0, Lcom/boyaa/app/core/HandlerManager;->kUploadHeadImage:Ljava/lang/String;

    const/16 v1, 0x32d

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 780
    return-void
.end method

.method protected VerifyMD5()V
    .locals 0

    .prologue
    .line 1289
    invoke-static {}, Lcom/boyaa/util/MD5Util;->startVerify()V

    .line 1290
    return-void
.end method

.method protected autoDial()V
    .locals 2

    .prologue
    .line 1236
    const-string v0, "autoDial"

    const/16 v1, 0x4ca

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1237
    return-void
.end method

.method protected autoSelectDial()V
    .locals 2

    .prologue
    .line 1240
    const-string v0, "autoSelectDial"

    const/16 v1, 0x4f8

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1241
    return-void
.end method

.method protected changeBrightness()V
    .locals 2

    .prologue
    .line 1009
    const-string v0, "changeBrightness"

    const/16 v1, 0x4b2

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1010
    return-void
.end method

.method protected changeScreenOrientation()V
    .locals 2

    .prologue
    .line 396
    const-string v0, "changeScreenOrientation"

    const/16 v1, 0x4fb

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 397
    return-void
.end method

.method protected checkJsonValid()V
    .locals 4

    .prologue
    .line 566
    const-string v1, "jsonValid"

    const-string v2, "json_data"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 567
    .local v0, "data":Ljava/lang/String;
    const-string v1, "jsonValid"

    const-string v2, "valid"

    invoke-static {}, Lcom/boyaa/util/JsonValidator;->instance()Lcom/boyaa/util/JsonValidator;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/boyaa/util/JsonValidator;->validate(Ljava/lang/String;)I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 568
    return-void
.end method

.method public clearDirectory()V
    .locals 10

    .prologue
    .line 1666
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    const-string v7, "clearDirectory"

    invoke-virtual {v6, v7}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1667
    .local v4, "param":Ljava/lang/String;
    const/4 v5, 0x0

    .line 1668
    .local v5, "result_flag":I
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1670
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1671
    .local v2, "jsonResult":Lorg/json/JSONObject;
    const-string v6, "path"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1673
    .local v0, "directoryPath":Ljava/lang/String;
    invoke-static {v0}, Lcom/boyaa/util/SDCardUtil;->clearDirectory(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 1675
    .local v1, "flag":Z
    if-eqz v1, :cond_0

    .line 1676
    const/4 v5, 0x1

    .line 1680
    :cond_0
    const-string v6, "flag"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1681
    const-string v6, "===========LuoQing===================="

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "LuaCallManager clearDirectory result_flag = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1682
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    const-string v7, "clearDirectory"

    new-instance v8, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v8, v3}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v8}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1684
    .end local v0    # "directoryPath":Ljava/lang/String;
    .end local v1    # "flag":Z
    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1678
    :catch_0
    move-exception v6

    .line 1680
    const-string v6, "flag"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1681
    const-string v6, "===========LuoQing===================="

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "LuaCallManager clearDirectory result_flag = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1682
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    const-string v7, "clearDirectory"

    new-instance v8, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v8, v3}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v8}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1679
    :catchall_0
    move-exception v6

    .line 1680
    const-string v7, "flag"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1681
    const-string v7, "===========LuoQing===================="

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "LuaCallManager clearDirectory result_flag = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1682
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v7

    const-string v8, "clearDirectory"

    new-instance v9, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v9, v3}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v9}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1683
    throw v6
.end method

.method protected closeDownloadFileDialog()V
    .locals 2

    .prologue
    .line 953
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 954
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x4c6

    iput v1, v0, Landroid/os/Message;->what:I

    .line 955
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 956
    return-void
.end method

.method protected closeSecrecy()V
    .locals 2

    .prologue
    .line 965
    const-string v0, "closeSecrecy"

    const/16 v1, 0x45c

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 966
    return-void
.end method

.method protected closeTicketResult()V
    .locals 2

    .prologue
    .line 998
    const-string v0, "closeTicketResult"

    const/16 v1, 0x4c0

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 999
    return-void
.end method

.method public createDirectory()V
    .locals 9

    .prologue
    .line 1628
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "createDirectory"

    invoke-virtual {v5, v6}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1629
    .local v3, "param":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1630
    .local v4, "result_flag":I
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1632
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1633
    .local v1, "jsonResult":Lorg/json/JSONObject;
    const-string v5, "path"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1635
    .local v0, "directoryPath":Ljava/lang/String;
    invoke-static {v0}, Lcom/boyaa/util/SDCardUtil;->createDirectoryIfNotExist(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1636
    const/4 v4, 0x1

    .line 1640
    const-string v5, "flag"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1641
    const-string v5, "===========LuoQing===================="

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "LuaCallManager createDirectory result_flag = "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1642
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "createDirectory"

    new-instance v7, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v7, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v7}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1644
    .end local v0    # "directoryPath":Ljava/lang/String;
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1638
    :catch_0
    move-exception v5

    .line 1640
    const-string v5, "flag"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1641
    const-string v5, "===========LuoQing===================="

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "LuaCallManager createDirectory result_flag = "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1642
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "createDirectory"

    new-instance v7, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v7, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v7}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1639
    :catchall_0
    move-exception v5

    .line 1640
    const-string v6, "flag"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v2, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1641
    const-string v6, "===========LuoQing===================="

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "LuaCallManager createDirectory result_flag = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1642
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    const-string v7, "createDirectory"

    new-instance v8, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v8, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v8}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1643
    throw v5
.end method

.method public deleteDirectory()V
    .locals 9

    .prologue
    .line 1647
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "deleteDirectory"

    invoke-virtual {v5, v6}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1648
    .local v3, "param":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1649
    .local v4, "result_flag":I
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1651
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1652
    .local v1, "jsonResult":Lorg/json/JSONObject;
    const-string v5, "path"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1654
    .local v0, "directoryPath":Ljava/lang/String;
    invoke-static {v0}, Lcom/boyaa/util/SDCardUtil;->deleteDirectory(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1655
    const/4 v4, 0x1

    .line 1659
    const-string v5, "flag"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1660
    const-string v5, "===========LuoQing===================="

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "LuaCallManager deleteDirectory result_flag = "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1661
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "deleteDirectory"

    new-instance v7, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v7, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v7}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1663
    .end local v0    # "directoryPath":Ljava/lang/String;
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1657
    :catch_0
    move-exception v5

    .line 1659
    const-string v5, "flag"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1660
    const-string v5, "===========LuoQing===================="

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "LuaCallManager deleteDirectory result_flag = "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1661
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "deleteDirectory"

    new-instance v7, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v7, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v7}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1658
    :catchall_0
    move-exception v5

    .line 1659
    const-string v6, "flag"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v2, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1660
    const-string v6, "===========LuoQing===================="

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "LuaCallManager deleteDirectory result_flag = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1661
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    const-string v7, "deleteDirectory"

    new-instance v8, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v8, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v8}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1662
    throw v5
.end method

.method protected deleteUpdate()V
    .locals 2

    .prologue
    .line 907
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$15;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$15;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 920
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 921
    return-void
.end method

.method protected downloadFile()V
    .locals 2

    .prologue
    .line 937
    const-string v0, "getVersion"

    const-string v1, "downloadFile start ... "

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    const-string v0, "downloadFile"

    const/16 v1, 0x4c2

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 939
    return-void
.end method

.method protected getCallAppParam()V
    .locals 3

    .prologue
    .line 725
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getCallAppParam()Ljava/lang/String;

    move-result-object v0

    .line 726
    .local v0, "param":Ljava/lang/String;
    const-string v1, "getCallAppParam"

    const-string v2, "param"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    const-string v1, ""

    invoke-static {v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->setCallAppParam(Ljava/lang/String;)V

    .line 728
    return-void
.end method

.method protected getContacts()V
    .locals 4

    .prologue
    .line 1041
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x4cb

    const-string v2, "getContacts"

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 1042
    return-void
.end method

.method public getLocalMacAddressForLua()V
    .locals 1

    .prologue
    .line 1303
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/app/sys/SystemInfo;->getLocalMacAddressForLua(Landroid/app/Activity;)V

    .line 1304
    return-void
.end method

.method protected getMachineId()V
    .locals 4

    .prologue
    .line 749
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x207

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 750
    return-void
.end method

.method protected getMemory()V
    .locals 4

    .prologue
    .line 1232
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x20c

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 1233
    return-void
.end method

.method public getMetaData()V
    .locals 5

    .prologue
    .line 1544
    const/4 v0, 0x0

    .line 1545
    .local v0, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1547
    .local v2, "packMgmr":Landroid/content/pm/PackageManager;
    :try_start_0
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 1551
    :goto_0
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v4, "UMENG_APPKEY"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1552
    .local v1, "metaValue":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1553
    :goto_1
    const-string v3, "LuaCallEvent"

    const-string v4, "getMetaData"

    invoke-static {v3, v4, v1}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1554
    return-void

    .line 1552
    :cond_0
    const-string v1, ""

    goto :goto_1

    .line 1548
    .end local v1    # "metaValue":Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public getNetWorkAvalible()V
    .locals 5

    .prologue
    .line 1315
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v3}, Lcom/boyaa/engine/made/APNUtil;->isActiveNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    .line 1316
    .local v0, "isActiveNetworkAvailable":Z
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v3}, Lcom/boyaa/engine/made/APNUtil;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    .line 1317
    .local v1, "isNetworkAvailable":Z
    const/4 v2, 0x0

    .line 1318
    .local v2, "result":I
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 1319
    const/4 v2, 0x1

    .line 1321
    :cond_0
    const-string v3, "networkType"

    const-string v4, "avalible"

    invoke-static {v3, v4, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 1322
    return-void
.end method

.method public getNetWorkTypeForLua()V
    .locals 1

    .prologue
    .line 1310
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/app/sys/SystemInfo;->getNetWorkTypeForLua(Landroid/app/Activity;)V

    .line 1311
    return-void
.end method

.method protected getNetworkType()V
    .locals 3

    .prologue
    .line 1025
    const-string v0, "networkType"

    const-string v1, "type"

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v2}, Lcom/boyaa/util/NetworkUtil;->getNetworkType(Landroid/content/Context;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 1026
    return-void
.end method

.method protected getPhoneInfo()V
    .locals 3

    .prologue
    .line 771
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v1}, Lcom/boyaa/app/sys/SystemInfo;->LocalInfo(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    .line 772
    .local v0, "phoneInfo":Ljava/lang/String;
    const-string v1, "systemInfo"

    const-string v2, "phoneInfo"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    return-void
.end method

.method protected getScreenOrientation()V
    .locals 3

    .prologue
    .line 400
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x0

    .line 401
    .local v0, "orientation":I
    :goto_0
    const-string v1, "orientationConfig"

    const-string v2, "orientation"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 403
    return-void

    .line 400
    .end local v0    # "orientation":I
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getSignalStrength()V
    .locals 4

    .prologue
    .line 1559
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x4dd

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 1560
    return-void
.end method

.method public hideEmbedWebView()V
    .locals 2

    .prologue
    .line 1262
    const-string v0, "HideEmbedWebView"

    const/16 v1, 0x4ed

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1263
    return-void
.end method

.method protected hideWebView()V
    .locals 2

    .prologue
    .line 968
    const-string v0, "hideWebView"

    const/16 v1, 0x7d0

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 969
    return-void
.end method

.method public initLocalInfoForLua()V
    .locals 1

    .prologue
    .line 1296
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/app/sys/SystemInfo;->initLocalInfoForLua(Landroid/app/Activity;)V

    .line 1297
    return-void
.end method

.method public installAPK()V
    .locals 2

    .prologue
    .line 1275
    const-string v0, "installAPK"

    const/16 v1, 0x4b8

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1276
    return-void
.end method

.method public invokeMethod(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "methodStr"    # Ljava/lang/String;

    .prologue
    .line 87
    const-string v0, "LuaCallManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "LuaCallManager methodStr:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const-string v0, "CloseStartScreen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 90
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->CloseStartScreen()V

    .line 347
    :cond_0
    :goto_0
    const-string v0, ""

    return-object v0

    .line 91
    :cond_1
    const-string v0, "StartSystemTimer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 92
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->StartSystemTimer()V

    goto :goto_0

    .line 93
    :cond_2
    const-string v0, "StopSystemTimer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 94
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->StopSystemTimer()V

    goto :goto_0

    .line 95
    :cond_3
    const-string v0, "getMachineId"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 96
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getMachineId()V

    goto :goto_0

    .line 97
    :cond_4
    const-string v0, "sendSmsByRegister"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 98
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendSmsByRegister()V

    goto :goto_0

    .line 99
    :cond_5
    const-string v0, "sendSmsByGetNewPW"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 100
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendSmsByGetNewPW()V

    goto :goto_0

    .line 101
    :cond_6
    const-string v0, "getPhoneInfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 102
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getPhoneInfo()V

    goto :goto_0

    .line 103
    :cond_7
    const-string v0, "UploadHeadImage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 104
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->UploadHeadImage()V

    goto :goto_0

    .line 105
    :cond_8
    const-string v0, "preloadSound"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 106
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->preloadSound()V

    goto :goto_0

    .line 107
    :cond_9
    const-string v0, "GetNetworkAvailability"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 108
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->GetNetworkAvailability()V

    goto :goto_0

    .line 109
    :cond_a
    const-string v0, "GetNetworkActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 110
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->GetNetworkActivity()V

    goto :goto_0

    .line 111
    :cond_b
    const-string v0, "ShowLoadingScene"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 112
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->ShowLoadingScene()V

    goto/16 :goto_0

    .line 113
    :cond_c
    const-string v0, "HideLoadingScene"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 114
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->HideLoadingScene()V

    goto/16 :goto_0

    .line 115
    :cond_d
    const-string v0, "ShowLoadingDialog"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 116
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->ShowLoadingDialog()V

    goto/16 :goto_0

    .line 117
    :cond_e
    const-string v0, "HideLoadingDialog"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 118
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->HideLoadingDialog()V

    goto/16 :goto_0

    .line 119
    :cond_f
    const-string v0, "ShowToast"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 120
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->ShowToast()V

    goto/16 :goto_0

    .line 121
    :cond_10
    const-string v0, "unzipNewGames"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 122
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->unzipNewGames()V

    goto/16 :goto_0

    .line 123
    :cond_11
    const-string v0, "deleteUpdate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 124
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->deleteUpdate()V

    goto/16 :goto_0

    .line 125
    :cond_12
    const-string v0, "isSDCardAvailable"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 126
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->isSDCardAvailable()V

    goto/16 :goto_0

    .line 127
    :cond_13
    const-string v0, "DeviceShake"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 128
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->DeviceShake()V

    goto/16 :goto_0

    .line 129
    :cond_14
    const-string v0, "downloadFile"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 130
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->downloadFile()V

    goto/16 :goto_0

    .line 131
    :cond_15
    const-string v0, "showDownloadFileDialog"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 132
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->showDownloadFileDialog()V

    goto/16 :goto_0

    .line 133
    :cond_16
    const-string v0, "closeDownloadFileDialog"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 134
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->closeDownloadFileDialog()V

    goto/16 :goto_0

    .line 135
    :cond_17
    const-string v0, "openSecrecy"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 136
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openSecrecy()V

    goto/16 :goto_0

    .line 137
    :cond_18
    const-string v0, "closeSecrecy"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 138
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->closeSecrecy()V

    goto/16 :goto_0

    .line 139
    :cond_19
    const-string v0, "hideWebView"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 140
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->hideWebView()V

    goto/16 :goto_0

    .line 141
    :cond_1a
    const-string v0, "sendFeedbackInfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 142
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendFeedbackInfo()V

    goto/16 :goto_0

    .line 143
    :cond_1b
    const-string v0, "openHelp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 144
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openHelp()V

    goto/16 :goto_0

    .line 145
    :cond_1c
    const-string v0, "openFeedback"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 146
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openFeedback()V

    goto/16 :goto_0

    .line 147
    :cond_1d
    const-string v0, "sendFeedbackResult"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 148
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendFeedbackResult()V

    goto/16 :goto_0

    .line 149
    :cond_1e
    const-string v0, "notifygetFeedback"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 150
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->notifygetFeedback()V

    goto/16 :goto_0

    .line 151
    :cond_1f
    const-string v0, "closeTicketResult"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 152
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->closeTicketResult()V

    goto/16 :goto_0

    .line 153
    :cond_20
    const-string v0, "changeBrightness"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 154
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->changeBrightness()V

    goto/16 :goto_0

    .line 155
    :cond_21
    const-string v0, "umengEvent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 156
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->umengEvent()V

    goto/16 :goto_0

    .line 157
    :cond_22
    const-string v0, "umengError"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 158
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->umengError()V

    goto/16 :goto_0

    .line 159
    :cond_23
    const-string v0, "substringToLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 160
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->substringToLua()V

    goto/16 :goto_0

    .line 161
    :cond_24
    const-string v0, "showTermsOfService"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 162
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->showTermsOfService()V

    goto/16 :goto_0

    .line 163
    :cond_25
    const-string v0, "GetBatteryLevel"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 164
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->GetBatteryLevel()V

    goto/16 :goto_0

    .line 165
    :cond_26
    const-string v0, "getMemory"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 166
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getMemory()V

    goto/16 :goto_0

    .line 167
    :cond_27
    const-string v0, "uploadDumpFile"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 168
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->uploadDumpFile()V

    goto/16 :goto_0

    .line 169
    :cond_28
    const-string v0, "uploadLogFile"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 170
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->uploadLogFile()V

    goto/16 :goto_0

    .line 171
    :cond_29
    const-string v0, "getNetworkType"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 172
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getNetworkType()V

    goto/16 :goto_0

    .line 173
    :cond_2a
    const-string v0, "autoDial"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 174
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->autoDial()V

    goto/16 :goto_0

    .line 175
    :cond_2b
    const-string v0, "autoSelectDial"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 176
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->autoSelectDial()V

    goto/16 :goto_0

    .line 177
    :cond_2c
    const-string v0, "StartTelecomPay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 178
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->StartTelecomPay()V

    goto/16 :goto_0

    .line 179
    :cond_2d
    const-string v0, "NewWebView"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 180
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->NewWebView()V

    goto/16 :goto_0

    .line 181
    :cond_2e
    const-string v0, "SetWebViewUrl"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 182
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->SetWebViewUrl()V

    goto/16 :goto_0

    .line 183
    :cond_2f
    const-string v0, "GoBackWebView"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 184
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->GoBackWebView()V

    goto/16 :goto_0

    .line 185
    :cond_30
    const-string v0, "DelView"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 186
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->DelView()V

    goto/16 :goto_0

    .line 187
    :cond_31
    const-string v0, "HideEmbedWebView"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 188
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->hideEmbedWebView()V

    goto/16 :goto_0

    .line 189
    :cond_32
    const-string v0, "ShowEmbedWebView"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 190
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->showEmbedWebView()V

    goto/16 :goto_0

    .line 191
    :cond_33
    const-string v0, "getContacts"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 192
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getContacts()V

    goto/16 :goto_0

    .line 193
    :cond_34
    const-string v0, "updateAPK"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 194
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->updateAPK()V

    goto/16 :goto_0

    .line 195
    :cond_35
    const-string v0, "installAPK"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 196
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->installAPK()V

    goto/16 :goto_0

    .line 197
    :cond_36
    const-string v0, "openWebPage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 198
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openWebPage()V

    goto/16 :goto_0

    .line 199
    :cond_37
    const-string v0, "MergeNewApk"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 200
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->MergeNewApk()V

    goto/16 :goto_0

    .line 201
    :cond_38
    const-string v0, "PatchApkInstall"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 202
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->PatchApkInstall()V

    goto/16 :goto_0

    .line 203
    :cond_39
    const-string v0, "VerifyMD5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 204
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->VerifyMD5()V

    goto/16 :goto_0

    .line 205
    :cond_3a
    const-string v0, "initLocalInfoForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 206
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->initLocalInfoForLua()V

    goto/16 :goto_0

    .line 207
    :cond_3b
    const-string v0, "getLocalMacAddressForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 208
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getLocalMacAddressForLua()V

    goto/16 :goto_0

    .line 209
    :cond_3c
    const-string v0, "getNetWorkTypeForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 210
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getNetWorkTypeForLua()V

    goto/16 :goto_0

    .line 211
    :cond_3d
    const-string v0, "getNetWorkAvalible"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 212
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getNetWorkAvalible()V

    goto/16 :goto_0

    .line 213
    :cond_3e
    const-string v0, "startTongYiPay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 214
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->startTongYiPay()V

    goto/16 :goto_0

    .line 215
    :cond_3f
    const-string v0, "isCanReadFile"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 216
    invoke-virtual {p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->isCanReadFile(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 217
    :cond_40
    const-string v0, "isCanWriteFile"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 218
    invoke-virtual {p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->isCanWriteFile(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 219
    :cond_41
    const-string v0, "isWXAppSupportPaymentForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 220
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->isWXAppSupportPaymentForLua()V

    goto/16 :goto_0

    .line 221
    :cond_42
    const-string v0, "openWeiXin"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 222
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openWeiXin()V

    goto/16 :goto_0

    .line 223
    :cond_43
    const-string v0, "weixinCheckSupportSendToFriendsCirCleForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 224
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->weixinCheckSupportSendToFriendsCirCleForLua()V

    goto/16 :goto_0

    .line 225
    :cond_44
    const-string v0, "weixinSendText"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 226
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->weixinSendText()V

    goto/16 :goto_0

    .line 227
    :cond_45
    const-string v0, "weixinTakeScreenShotAndSendImage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 228
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->weixinTakeScreenShotAndSendImage()V

    goto/16 :goto_0

    .line 229
    :cond_46
    const-string v0, "weixinSendImage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 230
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->weixinSendImage()V

    goto/16 :goto_0

    .line 231
    :cond_47
    const-string v0, "weixinMergeAndSendImage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 232
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->weixinMergeAndSendImage()V

    goto/16 :goto_0

    .line 233
    :cond_48
    const-string v0, "weixinSendWebPage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 234
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->weixinSendWebPage()V

    goto/16 :goto_0

    .line 235
    :cond_49
    const-string v0, "weixinTakeScreenShotAndSendWebPage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 236
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->weixinTakeScreenShotAndSendWebPage()V

    goto/16 :goto_0

    .line 238
    :cond_4a
    const-string v0, "takeScreenShotAndSaveToLocal"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4b

    .line 239
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->takeScreenShotAndSaveToLocal()V

    goto/16 :goto_0

    .line 240
    :cond_4b
    const-string v0, "saveImageToPhotoAlbum"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 241
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->saveImageToPhotoAlbum()V

    goto/16 :goto_0

    .line 243
    :cond_4c
    const-string v0, "registerSmsObserver"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 244
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->registerSmsObserver()V

    goto/16 :goto_0

    .line 245
    :cond_4d
    const-string v0, "unRegisterSmsObserver"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 246
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->unRegisterSmsObserver()V

    goto/16 :goto_0

    .line 247
    :cond_4e
    const-string v0, "getLocation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 249
    const-string v0, "openBrowser"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 250
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openBrowser()V

    goto/16 :goto_0

    .line 251
    :cond_4f
    const-string v0, "getMetaData"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_50

    .line 252
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getMetaData()V

    goto/16 :goto_0

    .line 253
    :cond_50
    const-string v0, "getSignalStrength"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51

    .line 254
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getSignalStrength()V

    goto/16 :goto_0

    .line 255
    :cond_51
    const-string v0, "chooseImage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 256
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->chooseImage()V

    goto/16 :goto_0

    .line 257
    :cond_52
    const-string v0, "uploadFeedbackImage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_53

    .line 258
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->uploadFeedbackImage()V

    goto/16 :goto_0

    .line 259
    :cond_53
    const-string v0, "syncUnBase64UngzipCheckJsonFormatForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    .line 260
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->syncUnBase64UngzipCheckJsonFormatForLua()V

    goto/16 :goto_0

    .line 261
    :cond_54
    const-string v0, "syncZipBase64CheckJsonFormatForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    .line 262
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->syncZipBase64CheckJsonFormatForLua()V

    goto/16 :goto_0

    .line 263
    :cond_55
    const-string v0, "createDirectory"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_56

    .line 264
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->createDirectory()V

    goto/16 :goto_0

    .line 265
    :cond_56
    const-string v0, "deleteDirectory"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_57

    .line 266
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->deleteDirectory()V

    goto/16 :goto_0

    .line 267
    :cond_57
    const-string v0, "clearDirectory"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 268
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->clearDirectory()V

    goto/16 :goto_0

    .line 269
    :cond_58
    const-string v0, "requestGodSDKPay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 270
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->requestGodSDKPay()V

    goto/16 :goto_0

    .line 271
    :cond_59
    const-string v0, "getApkMd5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 272
    invoke-static {}, Lcom/boyaa/app/sys/SystemInfo;->getApkMd5()V

    goto/16 :goto_0

    .line 273
    :cond_5a
    const-string v0, "getGeTuiToken"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 274
    invoke-static {}, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->getCurrentGetuiClientIdForLua()V

    goto/16 :goto_0

    .line 275
    :cond_5b
    const-string v0, "getApkInstallTime"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 276
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getApkInstallTime()V

    goto/16 :goto_0

    .line 277
    :cond_5c
    const-string v0, "videoLogin"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 278
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->videoLogin()V

    goto/16 :goto_0

    .line 279
    :cond_5d
    const-string v0, "videoLogout"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5e

    .line 280
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->videoLogout()V

    goto/16 :goto_0

    .line 281
    :cond_5e
    const-string v0, "videoOpenMicrophone"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 282
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->videoOpenMicrophone()V

    goto/16 :goto_0

    .line 283
    :cond_5f
    const-string v0, "videoCloseMicrophone"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    .line 284
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->videoCloseMicrophone()V

    goto/16 :goto_0

    .line 285
    :cond_60
    const-string v0, "openQQ"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_61

    .line 286
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openQQ()V

    goto/16 :goto_0

    .line 287
    :cond_61
    const-string v0, "qqShareWebPage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    .line 288
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->qqShareWebPage()V

    goto/16 :goto_0

    .line 289
    :cond_62
    const-string v0, "requestThirdPartyLogin"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    .line 290
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->requestThirdPartyLogin()V

    goto/16 :goto_0

    .line 291
    :cond_63
    const-string v0, "isThirdPartySupportSwitchAccount"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_64

    .line 292
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->isThirdPartySupportSwitchAccount()V

    goto/16 :goto_0

    .line 293
    :cond_64
    const-string v0, "requestThirdPartySwitchAccount"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_65

    .line 294
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->requestThirdPartySwitchAccount()V

    goto/16 :goto_0

    .line 295
    :cond_65
    const-string v0, "isThirdPartySupportLogout"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_66

    .line 296
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->isThirdPartySupportLogout()V

    goto/16 :goto_0

    .line 297
    :cond_66
    const-string v0, "requestThirdPartyLogout"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_67

    .line 298
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->requestThirdPartyLogout()V

    goto/16 :goto_0

    .line 299
    :cond_67
    const-string v0, "checkJsonValid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    .line 300
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->checkJsonValid()V

    goto/16 :goto_0

    .line 301
    :cond_68
    const-string v0, "imGetCurrentLocation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_69

    .line 302
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imGetCurrentLocation()V

    goto/16 :goto_0

    .line 303
    :cond_69
    const-string v0, "imGetContractsInfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6a

    .line 304
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imGetContractsInfo()V

    goto/16 :goto_0

    .line 305
    :cond_6a
    const-string v0, "imStopAudioRecord"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 306
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imStopAudioRecord()V

    goto/16 :goto_0

    .line 307
    :cond_6b
    const-string v0, "imStartAudioRecord"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 308
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imStartAudioRecord()V

    goto/16 :goto_0

    .line 309
    :cond_6c
    const-string v0, "imStartAudioPlay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 310
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imStartAudioPlay()V

    goto/16 :goto_0

    .line 311
    :cond_6d
    const-string v0, "imStopAudioPlay"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 312
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imStopAudioPlay()V

    goto/16 :goto_0

    .line 313
    :cond_6e
    const-string v0, "imGetGotoGps"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 314
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imGetGotoGps()V

    goto/16 :goto_0

    .line 315
    :cond_6f
    const-string v0, "clipboardSetText"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 316
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->clipboardSetText()V

    goto/16 :goto_0

    .line 317
    :cond_70
    const-string v0, "clipboardGetText"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_71

    .line 318
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->clipboardGetText()V

    goto/16 :goto_0

    .line 319
    :cond_71
    const-string v0, "clipboardClean"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    .line 320
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->clipboardClean()V

    goto/16 :goto_0

    .line 321
    :cond_72
    const-string v0, "openSms"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_73

    .line 322
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openSms()V

    goto/16 :goto_0

    .line 323
    :cond_73
    const-string v0, "createQR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_74

    .line 324
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->createQR()V

    goto/16 :goto_0

    .line 325
    :cond_74
    const-string v0, "scanQR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_75

    .line 326
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->scanQR()V

    goto/16 :goto_0

    .line 327
    :cond_75
    const-string v0, "openSmsEdit"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    .line 328
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openSmsEdit()V

    goto/16 :goto_0

    .line 329
    :cond_76
    const-string v0, "openNetSettings"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_77

    .line 330
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->openNetSettings()V

    goto/16 :goto_0

    .line 331
    :cond_77
    const-string v0, "changeScreenOrientation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 332
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->changeScreenOrientation()V

    goto/16 :goto_0

    .line 333
    :cond_78
    const-string v0, "getScreenOrientation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_79

    .line 334
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getScreenOrientation()V

    goto/16 :goto_0

    .line 335
    :cond_79
    const-string v0, "setFPS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7a

    .line 336
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->setFPS()V

    goto/16 :goto_0

    .line 337
    :cond_7a
    const-string v0, "enterServiceChat"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 338
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->enterServiceChat()V

    goto/16 :goto_0

    .line 339
    :cond_7b
    const-string v0, "getAvailMemoryForLua"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    .line 340
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getAvailMemoryForLua()V

    goto/16 :goto_0

    .line 341
    :cond_7c
    const-string v0, "refreshPlatformLogSwitch"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    .line 342
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->setLogSwitch()V

    goto/16 :goto_0

    .line 343
    :cond_7d
    const-string v0, "getCallAppParam"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 344
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getCallAppParam()V

    goto/16 :goto_0
.end method

.method public isCanReadFile(Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1333
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "_parm"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1334
    .local v0, "filePath":Ljava/lang/String;
    invoke-static {v0}, Lcom/boyaa/app/file/FileUtil;->isCanReadFile(Ljava/lang/String;)Z

    move-result v1

    .line 1335
    .local v1, "isReadWrite":Z
    const-string v3, "LuaEventCall"

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v3, p1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 1336
    return-void

    .line 1335
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isCanWriteFile(Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1339
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "_parm"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1340
    .local v0, "filePath":Ljava/lang/String;
    invoke-static {v0}, Lcom/boyaa/app/file/FileUtil;->isCanWriteFile(Ljava/lang/String;)Z

    move-result v1

    .line 1341
    .local v1, "isCanWrite":Z
    const-string v3, "LuaEventCall"

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v3, p1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 1342
    return-void

    .line 1341
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected isSDCardAvailable()V
    .locals 3

    .prologue
    .line 926
    const-string v1, "sdCardAvailableResult"

    const-string v2, "isAvailable"

    invoke-static {}, Lcom/boyaa/app/common/SDTools;->isExternalStorageWriteable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 927
    const-string v0, "isSDCardAvailable"

    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->call_lua(Ljava/lang/String;)I

    .line 928
    return-void

    .line 926
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWXAppSupportPaymentForLua()V
    .locals 0

    .prologue
    .line 1356
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->isWXAppSupportPaymentForLua()V

    .line 1357
    return-void
.end method

.method protected notifygetFeedback()V
    .locals 2

    .prologue
    .line 993
    const-string v0, "notifygetFeedback"

    const/16 v1, 0x4b1

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 994
    return-void
.end method

.method public openBrowser()V
    .locals 8

    .prologue
    .line 1406
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "openBrowser"

    invoke-virtual {v5, v6}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1409
    .local v2, "param":Ljava/lang/String;
    :try_start_0
    const-string v5, "LuaCallManager"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "openBrowser() param:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1411
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1412
    .local v1, "jsonResult":Lorg/json/JSONObject;
    const-string v5, "url"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1414
    .local v4, "url":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1416
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1417
    .local v3, "sendIntent":Landroid/content/Intent;
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1418
    const/high16 v5, 0x14000000

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1419
    sget-object v5, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v5}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1425
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .end local v3    # "sendIntent":Landroid/content/Intent;
    .end local v4    # "url":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 1422
    :catch_0
    move-exception v0

    .line 1423
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected openFeedback()V
    .locals 2

    .prologue
    .line 983
    const-string v0, "openFeedback"

    const/16 v1, 0x4b0

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 984
    return-void
.end method

.method protected openHelp()V
    .locals 2

    .prologue
    .line 979
    const-string v0, "openHelp"

    const/16 v1, 0x45d

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 980
    return-void
.end method

.method protected openNetSettings()V
    .locals 2

    .prologue
    .line 392
    const-string v0, "openNetSettings"

    const/16 v1, 0x4fa

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 393
    return-void
.end method

.method protected openSecrecy()V
    .locals 2

    .prologue
    .line 961
    const-string v0, "openSecrecy"

    const/16 v1, 0x45b

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 962
    return-void
.end method

.method protected openSmsEdit()V
    .locals 2

    .prologue
    .line 388
    const-string v0, "openSmsEdit"

    const/16 v1, 0x4f9

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 389
    return-void
.end method

.method protected openWebPage()V
    .locals 2

    .prologue
    .line 1282
    const-string v0, "openWebPage"

    const/16 v1, 0x4cc

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1283
    return-void
.end method

.method public openWeiXin()V
    .locals 2

    .prologue
    .line 1345
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$16;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$16;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1352
    return-void
.end method

.method protected preloadSound()V
    .locals 2

    .prologue
    .line 786
    const-string v0, "preloadSound"

    .line 787
    const/16 v1, 0x3f2

    .line 786
    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 788
    return-void
.end method

.method public registerSmsObserver()V
    .locals 2

    .prologue
    .line 1428
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->unRegisterSmsObserver()V

    .line 1429
    new-instance v0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-direct {v0, p0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->mSmsObserver:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    .line 1430
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->mSmsObserver:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->register()V

    .line 1431
    return-void
.end method

.method public saveImageToPhotoAlbum()V
    .locals 8

    .prologue
    .line 1391
    :try_start_0
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    const-string v7, "saveImageToPhotoAlbum"

    invoke-virtual {v6, v7}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1392
    .local v5, "jsonStr":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1393
    .local v4, "json":Lorg/json/JSONObject;
    const-string v6, "imagePath"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1394
    .local v3, "imagePath":Ljava/lang/String;
    invoke-static {v3}, Lcom/boyaa/util/ImageTools;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1395
    .local v2, "imageName":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ".png"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1396
    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1397
    .local v0, "bmp":Landroid/graphics/Bitmap;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/DCIM/Camera"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6, v2}, Lcom/boyaa/util/ImageTools;->savePhotoToSDCardAsync(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1402
    .end local v0    # "bmp":Landroid/graphics/Bitmap;
    .end local v2    # "imageName":Ljava/lang/String;
    .end local v3    # "imagePath":Ljava/lang/String;
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v5    # "jsonStr":Ljava/lang/String;
    :goto_0
    return-void

    .line 1399
    :catch_0
    move-exception v1

    .line 1400
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method protected sendFeedbackInfo()V
    .locals 2

    .prologue
    .line 974
    const-string v0, "sendFeedbackInfo"

    const/16 v1, 0x4c7

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 975
    return-void
.end method

.method protected sendFeedbackResult()V
    .locals 2

    .prologue
    .line 988
    const-string v0, "sendFeedbackResult"

    const/16 v1, 0x4bd

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 989
    return-void
.end method

.method protected sendMessage(Ljava/lang/String;I)V
    .locals 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "what"    # I

    .prologue
    .line 1090
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    invoke-virtual {v6, p1}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1091
    .local v0, "Data":Ljava/lang/String;
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 1092
    .local v5, "msg":Landroid/os/Message;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 1093
    .local v1, "bundle":Landroid/os/Bundle;
    const-string v6, "callLuaEvent"

    invoke-virtual {v1, v6, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1094
    const-string v6, "data"

    invoke-virtual {v1, v6, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1095
    const/16 v6, 0x32d

    if-ne v6, p2, :cond_1

    .line 1097
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1098
    .local v4, "jsonResult":Lorg/json/JSONObject;
    const-string v6, "upLoadFileCallBack"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1099
    .local v2, "callBackFunString":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1100
    sput-object v2, Lcom/boyaa/app/core/HandlerManager;->kUploadHeadImage:Ljava/lang/String;

    .line 1103
    :cond_0
    const-string v6, "guangli.liu"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "HandlerManager.kUploadHeadImage="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Lcom/boyaa/app/core/HandlerManager;->kUploadHeadImage:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1113
    .end local v2    # "callBackFunString":Ljava/lang/String;
    .end local v4    # "jsonResult":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    iput p2, v5, Landroid/os/Message;->what:I

    .line 1114
    invoke-virtual {v5, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 1115
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1117
    return-void

    .line 1104
    :catch_0
    move-exception v3

    .line 1106
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method protected sendMessage(Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "what"    # I
    .param p3, "keys"    # [Ljava/lang/String;

    .prologue
    .line 1120
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    invoke-virtual {v3, p1, p3}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1121
    .local v1, "data":Ljava/lang/String;
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 1122
    .local v2, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1123
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "data"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1124
    iput p2, v2, Landroid/os/Message;->what:I

    .line 1125
    invoke-virtual {v2, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 1126
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1127
    return-void
.end method

.method protected sendSmsByGetNewPW()V
    .locals 4

    .prologue
    .line 763
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const/16 v1, 0x209

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 764
    return-void
.end method

.method protected sendSmsByRegister()V
    .locals 2

    .prologue
    .line 756
    const-string v0, "sendSmsByRegister"

    const/16 v1, 0x208

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 757
    return-void
.end method

.method protected showDownloadFileDialog()V
    .locals 5

    .prologue
    .line 942
    const-string v3, "showDownloadFileDialog"

    const-string v4, "tips"

    invoke-static {v3, v4}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 943
    .local v2, "tips":Ljava/lang/String;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 944
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 945
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "tips"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 946
    const/16 v3, 0x4c5

    iput v3, v1, Landroid/os/Message;->what:I

    .line 947
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 948
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 949
    return-void
.end method

.method public showEmbedWebView()V
    .locals 2

    .prologue
    .line 1266
    const-string v0, "ShowEmbedWebView"

    const/16 v1, 0x4ee

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1267
    return-void
.end method

.method protected showTermsOfService()V
    .locals 2

    .prologue
    .line 1086
    const-string v0, "showTermsOfService"

    const/16 v1, 0x4bc

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1087
    return-void
.end method

.method public startLuaCall()Ljava/lang/String;
    .locals 3

    .prologue
    .line 79
    const-string v1, "LuaCallEvent"

    const-string v2, "LuaCallEvent"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "method":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 81
    :cond_0
    const-string v0, ""

    .line 84
    .end local v0    # "method":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 83
    .restart local v0    # "method":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->invokeMethod(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method protected startTongYiPay()V
    .locals 2

    .prologue
    .line 1328
    const-string v0, "startTongYiPay"

    const/16 v1, 0x2d0

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1329
    return-void
.end method

.method protected substringToLua()V
    .locals 9

    .prologue
    .line 1047
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v7

    const-string v8, "substringToLua"

    invoke-virtual {v7, v8}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1050
    .local v2, "json_data":Ljava/lang/String;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1051
    .local v1, "json":Lorg/json/JSONObject;
    const-string v7, "lua_str"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1052
    .local v4, "lua_str":Ljava/lang/String;
    const-string v7, "lua_str_len"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 1053
    .local v5, "lua_str_len":I
    invoke-static {v4, v5}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->spiltString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    .line 1054
    .local v6, "str":Ljava/lang/String;
    const/4 v3, 0x0

    .line 1055
    .local v3, "len":I
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v5, v7, :cond_0

    const/4 v3, 0x1

    .line 1056
    :cond_0
    const-string v7, "substringToLua"

    const-string v8, "substringToLua_result"

    invoke-static {v7, v8, v6}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1057
    const-string v7, "substringToLua"

    const-string v8, "substringToLua_result_len"

    invoke-static {v7, v8, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1061
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v3    # "len":I
    .end local v4    # "lua_str":Ljava/lang/String;
    .end local v5    # "lua_str_len":I
    .end local v6    # "str":Ljava/lang/String;
    :goto_0
    return-void

    .line 1058
    :catch_0
    move-exception v0

    .line 1059
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public syncUnBase64UngzipCheckJsonFormatForLua()V
    .locals 16

    .prologue
    .line 1563
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v12

    const-string v13, "syncUnBase64UngzipCheckJsonFormatForLua"

    invoke-virtual {v12, v13}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1564
    .local v1, "data":Ljava/lang/String;
    move-object v8, v1

    .line 1565
    .local v8, "result_string":Ljava/lang/String;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 1566
    .local v5, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v7, 0x0

    .line 1568
    .local v7, "result_flag":I
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1569
    .local v2, "json":Lorg/json/JSONObject;
    const-string v12, "content"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1570
    .local v0, "content":Ljava/lang/String;
    const-string v12, "srcCharset"

    const-string v13, "ISO-8859-1"

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1571
    .local v9, "srcCharset":Ljava/lang/String;
    const-string v12, "outCharset"

    const-string v13, "utf-8"

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1572
    .local v6, "outCharset":Ljava/lang/String;
    new-instance v10, Ljava/lang/String;

    const/4 v12, 0x0

    invoke-static {v0, v12}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v12

    invoke-direct {v10, v12, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 1574
    .local v10, "unBase64ed":Ljava/lang/String;
    invoke-static {v10, v9, v6}, Lcom/boyaa/util/GZIPUtil;->unzipString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v11

    .line 1578
    .local v11, "unGziped":Ljava/lang/String;
    :try_start_1
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1579
    const/4 v7, 0x1

    .line 1580
    move-object v8, v11

    .line 1593
    :goto_0
    const-string v12, "flag"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v5, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1594
    const-string v12, "result"

    invoke-interface {v5, v12, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1595
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v12

    const-string v13, "syncUnBase64UngzipCheckJsonFormatForLua"

    new-instance v14, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v14, v5}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v14}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1597
    .end local v0    # "content":Ljava/lang/String;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v6    # "outCharset":Ljava/lang/String;
    .end local v9    # "srcCharset":Ljava/lang/String;
    .end local v10    # "unBase64ed":Ljava/lang/String;
    .end local v11    # "unGziped":Ljava/lang/String;
    :goto_1
    return-void

    .line 1581
    .restart local v0    # "content":Ljava/lang/String;
    .restart local v2    # "json":Lorg/json/JSONObject;
    .restart local v6    # "outCharset":Ljava/lang/String;
    .restart local v9    # "srcCharset":Ljava/lang/String;
    .restart local v10    # "unBase64ed":Ljava/lang/String;
    .restart local v11    # "unGziped":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 1583
    .local v3, "jsonException1":Lorg/json/JSONException;
    :try_start_2
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12, v11}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1584
    const/4 v7, 0x1

    .line 1585
    move-object v8, v11

    goto :goto_0

    .line 1586
    :catch_1
    move-exception v4

    .line 1587
    .local v4, "jsonException2":Lorg/json/JSONException;
    const/4 v7, 0x0

    .line 1588
    :try_start_3
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v12

    if-eqz v12, :cond_0

    move-object v8, v10

    :goto_2
    goto :goto_0

    :cond_0
    move-object v8, v11

    goto :goto_2

    .line 1591
    .end local v0    # "content":Ljava/lang/String;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "jsonException1":Lorg/json/JSONException;
    .end local v4    # "jsonException2":Lorg/json/JSONException;
    .end local v6    # "outCharset":Ljava/lang/String;
    .end local v9    # "srcCharset":Ljava/lang/String;
    .end local v10    # "unBase64ed":Ljava/lang/String;
    .end local v11    # "unGziped":Ljava/lang/String;
    :catch_2
    move-exception v12

    .line 1593
    const-string v12, "flag"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v5, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1594
    const-string v12, "result"

    invoke-interface {v5, v12, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1595
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v12

    const-string v13, "syncUnBase64UngzipCheckJsonFormatForLua"

    new-instance v14, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v14, v5}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v14}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1592
    :catchall_0
    move-exception v12

    .line 1593
    const-string v13, "flag"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v5, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1594
    const-string v13, "result"

    invoke-interface {v5, v13, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1595
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v13

    const-string v14, "syncUnBase64UngzipCheckJsonFormatForLua"

    new-instance v15, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v15, v5}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v15}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1596
    throw v12
.end method

.method public syncZipBase64CheckJsonFormatForLua()V
    .locals 14

    .prologue
    .line 1600
    const-string v10, "===========LuoQing===================="

    const-string v11, "LuaCallManager syncZipBase64CheckJsonFormatForLua"

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1602
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v10

    const-string v11, "syncZipBase64CheckJsonFormatForLua"

    invoke-virtual {v10, v11}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1603
    .local v2, "data":Ljava/lang/String;
    move-object v8, v2

    .line 1604
    .local v8, "result_string":Ljava/lang/String;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 1605
    .local v5, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v7, 0x0

    .line 1607
    .local v7, "result_flag":I
    :try_start_0
    const-string v10, "===========LuoQing===================="

    const-string v11, "LuaCallManager syncZipBase64CheckJsonFormatForLua trytrytrytry"

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1608
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1609
    .local v4, "json":Lorg/json/JSONObject;
    const-string v10, "content"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1610
    .local v1, "content":Ljava/lang/String;
    const-string v10, "srcCharset"

    const-string v11, "utf-8"

    invoke-virtual {v4, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1611
    .local v9, "srcCharset":Ljava/lang/String;
    const-string v10, "outCharset"

    const-string v11, "ISO-8859-1"

    invoke-virtual {v4, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1613
    .local v6, "outCharset":Ljava/lang/String;
    new-instance v0, Ljava/lang/String;

    invoke-static {v1, v9, v6}, Lcom/boyaa/util/GZIPUtil;->zipString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v10

    invoke-direct {v0, v10, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 1614
    .local v0, "base64ZipedString":Ljava/lang/String;
    const/4 v7, 0x1

    .line 1615
    move-object v8, v0

    .line 1616
    const-string v10, "===========LuoQing===================="

    const-string v11, "LuaCallManager syncZipBase64CheckJsonFormatForLua trytrytrytrytry result result"

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1620
    const-string v10, "===========LuoQing===================="

    const-string v11, "LuaCallManager syncZipBase64CheckJsonFormatForLua finallyfinallyfinallyfinally"

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1621
    const-string v10, "flag"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v5, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1622
    const-string v10, "result"

    invoke-interface {v5, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1623
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v10

    const-string v11, "syncZipBase64CheckJsonFormatForLua"

    new-instance v12, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v12, v5}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v12}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1625
    .end local v0    # "base64ZipedString":Ljava/lang/String;
    .end local v1    # "content":Ljava/lang/String;
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v6    # "outCharset":Ljava/lang/String;
    .end local v9    # "srcCharset":Ljava/lang/String;
    :goto_0
    return-void

    .line 1617
    :catch_0
    move-exception v3

    .line 1618
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v10, "===========LuoQing===================="

    const-string v11, "LuaCallManager syncZipBase64CheckJsonFormatForLua Exception e Exception eException eException eException e"

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1620
    const-string v10, "===========LuoQing===================="

    const-string v11, "LuaCallManager syncZipBase64CheckJsonFormatForLua finallyfinallyfinallyfinally"

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1621
    const-string v10, "flag"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v5, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1622
    const-string v10, "result"

    invoke-interface {v5, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1623
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v10

    const-string v11, "syncZipBase64CheckJsonFormatForLua"

    new-instance v12, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v12, v5}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v12}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1619
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    .line 1620
    const-string v11, "===========LuoQing===================="

    const-string v12, "LuaCallManager syncZipBase64CheckJsonFormatForLua finallyfinallyfinallyfinally"

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1621
    const-string v11, "flag"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v5, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1622
    const-string v11, "result"

    invoke-interface {v5, v11, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1623
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v11

    const-string v12, "syncZipBase64CheckJsonFormatForLua"

    new-instance v13, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v13, v5}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v13}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1624
    throw v10
.end method

.method public takeScreenShotAndSaveToLocal()V
    .locals 12

    .prologue
    .line 1366
    :try_start_0
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v9

    const-string v10, "takeScreenShotAndSaveToLocal"

    invoke-virtual {v9, v10}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1367
    .local v2, "jsonStr":Ljava/lang/String;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1368
    .local v1, "json":Lorg/json/JSONObject;
    const-string v9, "title"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1369
    .local v5, "title":Ljava/lang/String;
    const-string v9, "x"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    .line 1370
    .local v7, "x":I
    const-string v9, "y"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    .line 1371
    .local v8, "y":I
    const-string v9, "width"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    .line 1372
    .local v6, "width":I
    const-string v9, "height"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 1374
    .local v0, "height":I
    if-lez v6, :cond_0

    if-gtz v0, :cond_1

    .line 1375
    :cond_0
    sget-object v9, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget v6, v9, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mWidth:I

    .line 1376
    sget-object v9, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget v0, v9, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHeight:I

    .line 1379
    :cond_1
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v8, v6, v0, v9}, Lcom/boyaa/util/ScreenShotUtil;->saveGLPixels(IIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 1380
    .local v4, "screenShot":Landroid/graphics/Bitmap;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1381
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v9, "flag"

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v3, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1382
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v9

    const-string v10, "takeScreenShotAndSaveToLocal"

    new-instance v11, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v11, v3}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v11}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1383
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/DCIM/Camera"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v4, v9, v5}, Lcom/boyaa/util/ImageTools;->savePhotoToSDCardAsync(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1387
    .end local v0    # "height":I
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "jsonStr":Ljava/lang/String;
    .end local v3    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "screenShot":Landroid/graphics/Bitmap;
    .end local v5    # "title":Ljava/lang/String;
    .end local v6    # "width":I
    .end local v7    # "x":I
    .end local v8    # "y":I
    :goto_0
    return-void

    .line 1385
    :catch_0
    move-exception v9

    goto :goto_0
.end method

.method protected umengError()V
    .locals 2

    .prologue
    .line 1019
    const-string v0, "umengError"

    const/16 v1, 0x4c1

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1020
    return-void
.end method

.method protected umengEvent()V
    .locals 2

    .prologue
    .line 1015
    const-string v0, "umengEvent"

    const/16 v1, 0x4bb

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1016
    return-void
.end method

.method public unRegisterSmsObserver()V
    .locals 1

    .prologue
    .line 1435
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->mSmsObserver:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    if-eqz v0, :cond_0

    .line 1437
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->mSmsObserver:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->unregister()V

    .line 1438
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->mSmsObserver:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    .line 1440
    :cond_0
    return-void
.end method

.method protected unzipNewGames()V
    .locals 15

    .prologue
    .line 850
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 852
    .local v8, "successZip":Ljava/lang/StringBuilder;
    sget-object v11, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v11}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 853
    .local v0, "am":Landroid/content/res/AssetManager;
    new-instance v11, Ljava/lang/StringBuilder;

    sget-object v12, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v12}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 855
    .local v10, "unzipPath":Ljava/lang/String;
    new-instance v5, Lcom/boyaa/app/file/ZipUtil;

    invoke-direct {v5}, Lcom/boyaa/app/file/ZipUtil;-><init>()V

    .line 856
    .local v5, "mZipUtil":Lcom/boyaa/app/file/ZipUtil;
    const/4 v1, 0x1

    .line 858
    .local v1, "bIsUnZipSuccess":Z
    :try_start_0
    const-string v11, "games"

    invoke-virtual {v0, v11}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 859
    .local v7, "plugins":[Ljava/lang/String;
    array-length v12, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v11, 0x0

    :goto_0
    if-lt v11, v12, :cond_1

    .line 887
    .end local v7    # "plugins":[Ljava/lang/String;
    :goto_1
    if-nez v1, :cond_0

    .line 889
    :try_start_1
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 890
    .local v6, "param":Lorg/json/JSONObject;
    const-string v11, "msg"

    const-string v12, "\u6570\u636e\u52a0\u8f7d\u5931\u8d25\uff0c\u8bf7\u786e\u8ba4\u624b\u673a\u5185\u5b58\u662f\u5426\u5145\u8db3~"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 891
    const-string v11, "long"

    const/4 v12, 0x1

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 892
    const-string v11, "ShowToast"

    const-string v12, "ShowToast_parm"

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 893
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->ShowToast()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 899
    .end local v6    # "param":Lorg/json/JSONObject;
    :cond_0
    :goto_2
    const-string v11, "LuaCallManager"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "successZip:"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 903
    return-void

    .line 859
    .restart local v7    # "plugins":[Ljava/lang/String;
    :cond_1
    :try_start_2
    aget-object v3, v7, v11
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 862
    .local v3, "filename":Ljava/lang/String;
    :try_start_3
    const-string v13, "hall.zip"

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 864
    invoke-virtual {v5}, Lcom/boyaa/app/file/ZipUtil;->deleteOlderFiles()V

    .line 866
    :cond_2
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "games/"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 867
    .local v4, "is":Ljava/io/InputStream;
    invoke-virtual {v5, v4, v10}, Lcom/boyaa/app/file/ZipUtil;->Unzip(Ljava/io/InputStream;Ljava/lang/String;)Z

    move-result v9

    .line 868
    .local v9, "unZipSuccess":Z
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 869
    if-eqz v9, :cond_3

    .line 871
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 872
    const-string v13, ";"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 859
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v9    # "unZipSuccess":Z
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 874
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v9    # "unZipSuccess":Z
    :cond_3
    const/4 v1, 0x0

    goto :goto_3

    .line 877
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v9    # "unZipSuccess":Z
    :catch_0
    move-exception v2

    .line 878
    .local v2, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 879
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_3

    .line 882
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "filename":Ljava/lang/String;
    .end local v7    # "plugins":[Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 883
    .restart local v2    # "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 884
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 894
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v2

    .line 895
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public updateAPK()V
    .locals 2

    .prologue
    .line 1271
    const-string v0, "updateAPK"

    const/16 v1, 0x4b7

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->sendMessage(Ljava/lang/String;I)V

    .line 1272
    return-void
.end method

.method protected uploadDumpFile()V
    .locals 4

    .prologue
    .line 1030
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const-string v2, "uploadDumpFile"

    invoke-virtual {v1, v2}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1031
    .local v0, "param":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const/16 v2, 0x4c8

    const-string v3, ""

    invoke-virtual {v1, v2, v0, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 1032
    return-void
.end method

.method protected uploadLogFile()V
    .locals 4

    .prologue
    .line 1035
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const-string v2, "uploadLogFile"

    invoke-virtual {v1, v2}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1036
    .local v0, "param":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const/16 v2, 0x4e0

    const-string v3, ""

    invoke-virtual {v1, v2, v0, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 1037
    return-void
.end method

.method public weixinCheckSupportSendToFriendsCirCleForLua()V
    .locals 0

    .prologue
    .line 1361
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->isSupportSendToFriendsCirCleForLua()V

    .line 1362
    return-void
.end method
