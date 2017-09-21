.class public Lcom/boyaa/engine/device/WebViewImpl;
.super Ljava/lang/Object;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/device/WebViewImpl$ButtonView;,
        Lcom/boyaa/engine/device/WebViewImpl$JsInterface;,
        Lcom/boyaa/engine/device/WebViewImpl$LoadingView;,
        Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    }
.end annotation


# static fields
.field private static final EVENT_CLOSE:I = 0x2

.field private static final EVENT_LOAD_FAILED:I = 0x1

.field private static final EVENT_LOAD_SUCCESS:I

.field private static s_Impl:Lcom/boyaa/engine/device/WebViewImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    new-instance v0, Lcom/boyaa/engine/device/WebViewImpl;

    invoke-direct {v0}, Lcom/boyaa/engine/device/WebViewImpl;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/WebViewImpl;->s_Impl:Lcom/boyaa/engine/device/WebViewImpl;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 347
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 348
    return-void
.end method

.method public static _loadUrl(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;)V
    .locals 7
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "url"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 467
    iget-object v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->buttonView:Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

    invoke-virtual {v3, p0}, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 468
    iget-object v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingView:Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    invoke-virtual {v3, p0}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 469
    invoke-virtual {p0}, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->destroyLayout()V

    .line 471
    new-instance v2, Lcom/boyaa/engine/device/WebViewImpl$6;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, p0}, Lcom/boyaa/engine/device/WebViewImpl$6;-><init>(Landroid/content/Context;Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 502
    .local v2, "webview":Landroid/webkit/WebView;
    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    .line 503
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->url:Ljava/lang/String;

    .line 509
    iget-boolean v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableHScroll:Z

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 510
    iget-boolean v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableVScroll:Z

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 511
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setOverScrollMode(I)V

    .line 520
    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 521
    .local v1, "setting":Landroid/webkit/WebSettings;
    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 522
    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 523
    iget-boolean v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableCache:Z

    if-eqz v3, :cond_0

    .line 524
    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 525
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "cache"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 526
    .local v0, "appCacheDir":Ljava/lang/String;
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 527
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 532
    .end local v0    # "appCacheDir":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 534
    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 535
    iget-object v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->jsObj:Lcom/boyaa/engine/device/WebViewImpl$JsInterface;

    const-string v4, "boyaa_webview"

    invoke-virtual {v2, v3, v4}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 543
    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 544
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 545
    sget-object v3, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 546
    const-string v3, "UTF-8"

    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setDefaultTextEncodingName(Ljava/lang/String;)V

    .line 552
    invoke-virtual {p0}, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->createLayout()V

    .line 553
    iget-object v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->buttonView:Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

    invoke-virtual {v3, p0}, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->create(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 554
    iget-object v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingView:Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    invoke-virtual {v3, p0}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->create(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 556
    new-instance v3, Lcom/boyaa/engine/device/WebViewImpl$7;

    invoke-direct {v3, p0, v2}, Lcom/boyaa/engine/device/WebViewImpl$7;-><init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Landroid/webkit/WebView;)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 588
    new-instance v3, Lcom/boyaa/engine/device/WebViewImpl$8;

    invoke-direct {v3}, Lcom/boyaa/engine/device/WebViewImpl$8;-><init>()V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 601
    invoke-virtual {v2, v5}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 603
    invoke-virtual {v2, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 604
    return-void

    .line 529
    :cond_0
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    goto :goto_0
.end method

.method static synthetic access$0(ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/boyaa/engine/device/WebViewImpl;->onJsCall(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(II)V
    .locals 0

    .prologue
    .line 42
    invoke-static {p0, p1}, Lcom/boyaa/engine/device/WebViewImpl;->onWebViewEvent(II)V

    return-void
.end method

.method public static callJs(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;[B)V
    .locals 5
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "func"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 620
    move-object v2, p0

    .line 621
    .local v2, "_param":Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    move-object v1, p1

    .line 622
    .local v1, "_func":Ljava/lang/String;
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p2}, Ljava/lang/String;-><init>([B)V

    .line 623
    .local v0, "_data":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Lcom/boyaa/engine/device/WebViewImpl$10;

    invoke-direct {v4, v2, v1, v0}, Lcom/boyaa/engine/device/WebViewImpl$10;-><init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 629
    return-void
.end method

.method public static close(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 3
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    .line 607
    move-object v0, p0

    .line 608
    .local v0, "_param":Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/WebViewImpl$9;

    invoke-direct {v2, v0}, Lcom/boyaa/engine/device/WebViewImpl$9;-><init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 617
    return-void
.end method

.method public static create(IIIII)Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .locals 2
    .param p0, "id"    # I
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 368
    sget-object v1, Lcom/boyaa/engine/device/WebViewImpl;->s_Impl:Lcom/boyaa/engine/device/WebViewImpl;

    invoke-virtual {v1}, Lcom/boyaa/engine/device/WebViewImpl;->createParam()Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    move-result-object v0

    .line 369
    .local v0, "param":Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    iput p0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->id:I

    .line 370
    iput p1, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->x:I

    .line 371
    iput p2, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->y:I

    .line 372
    iput p3, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->width:I

    .line 373
    iput p4, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->height:I

    .line 374
    return-object v0
.end method

.method public static enableBackKey(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Z)V
    .locals 0
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "enable"    # Z

    .prologue
    .line 428
    iput-boolean p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableBackKey:Z

    .line 429
    return-void
.end method

.method public static enableBackOrForward(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Z)V
    .locals 0
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "enable"    # Z

    .prologue
    .line 424
    iput-boolean p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableBackOrForward:Z

    .line 425
    return-void
.end method

.method public static enableCache(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Z)V
    .locals 0
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "enable"    # Z

    .prologue
    .line 420
    iput-boolean p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableCache:Z

    .line 421
    return-void
.end method

.method public static enableCloseButton(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;ILjava/lang/String;II)V
    .locals 0
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "pos"    # I
    .param p2, "imageFilePath"    # Ljava/lang/String;
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 400
    iput p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnPos:I

    .line 401
    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnImageFile:Ljava/lang/String;

    .line 402
    iput p3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnW:I

    .line 403
    iput p4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnH:I

    .line 404
    return-void
.end method

.method public static enableLoadingDialog(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;IILjava/lang/String;)V
    .locals 1
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "imageFilePath"    # Ljava/lang/String;
    .param p2, "w"    # I
    .param p3, "h"    # I
    .param p4, "text"    # Ljava/lang/String;

    .prologue
    .line 407
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->hasLoadingBar:Z

    .line 408
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarImageFile:Ljava/lang/String;

    .line 409
    iput p2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarImageW:I

    .line 410
    iput p3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarImageH:I

    .line 411
    iput-object p4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarText:Ljava/lang/String;

    .line 412
    return-void
.end method

.method public static enableScrollBar(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;ZZ)V
    .locals 0
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "bHor"    # Z
    .param p2, "bVert"    # Z

    .prologue
    .line 415
    iput-boolean p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableHScroll:Z

    .line 416
    iput-boolean p2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableVScroll:Z

    .line 417
    return-void
.end method

.method public static loadUrl(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;)V
    .locals 4
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 453
    move-object v0, p0

    .line 454
    .local v0, "_param":Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    move-object v1, p1

    .line 455
    .local v1, "_url":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/boyaa/engine/device/WebViewImpl$5;

    invoke-direct {v3, v0, v1}, Lcom/boyaa/engine/device/WebViewImpl$5;-><init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 462
    return-void
.end method

.method static native nativeEvent(II)V
.end method

.method static native nativeJsCall(I[B)V
.end method

.method private static onJsCall(ILjava/lang/String;)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 53
    .local v0, "_data":[B
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/WebViewImpl$2;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/engine/device/WebViewImpl$2;-><init>(I[B)V

    invoke-virtual {v1, v2}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 59
    return-void
.end method

.method private static onWebViewEvent(II)V
    .locals 2
    .param p0, "id"    # I
    .param p1, "cmd"    # I

    .prologue
    .line 43
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/WebViewImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/WebViewImpl$1;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 49
    return-void
.end method

.method public static setBackgroundColor(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;I)V
    .locals 0
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "color"    # I

    .prologue
    .line 432
    iput p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->backgroundColor:I

    .line 433
    return-void
.end method

.method public static setRect(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;IIII)V
    .locals 3
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 378
    iput p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->x:I

    .line 379
    iput p2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->y:I

    .line 380
    iput p3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->width:I

    .line 381
    iput p4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->height:I

    .line 382
    move-object v0, p0

    .line 383
    .local v0, "_param":Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_0

    .line 386
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/WebViewImpl$3;

    invoke-direct {v2, v0}, Lcom/boyaa/engine/device/WebViewImpl$3;-><init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 397
    :cond_0
    return-void
.end method

.method public static setVisible(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Z)V
    .locals 4
    .param p0, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .param p1, "visible"    # Z

    .prologue
    .line 436
    move-object v0, p0

    .line 437
    .local v0, "_param":Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    move v1, p1

    .line 438
    .local v1, "_visible":Z
    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_0

    .line 441
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/boyaa/engine/device/WebViewImpl$4;

    invoke-direct {v3, v0, v1}, Lcom/boyaa/engine/device/WebViewImpl$4;-><init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Z)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 450
    :cond_0
    return-void
.end method


# virtual methods
.method public createButtonView()Lcom/boyaa/engine/device/WebViewImpl$ButtonView;
    .locals 1

    .prologue
    .line 363
    new-instance v0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

    invoke-direct {v0, p0}, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;-><init>(Lcom/boyaa/engine/device/WebViewImpl;)V

    return-object v0
.end method

.method public createJS(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)Lcom/boyaa/engine/device/WebViewImpl$JsInterface;
    .locals 1
    .param p1, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    .line 355
    new-instance v0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;-><init>(Lcom/boyaa/engine/device/WebViewImpl;Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    return-object v0
.end method

.method public createLoadingView()Lcom/boyaa/engine/device/WebViewImpl$LoadingView;
    .locals 1

    .prologue
    .line 359
    new-instance v0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    invoke-direct {v0, p0}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;-><init>(Lcom/boyaa/engine/device/WebViewImpl;)V

    return-object v0
.end method

.method public createParam()Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
    .locals 1

    .prologue
    .line 351
    new-instance v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    invoke-direct {v0, p0}, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;-><init>(Lcom/boyaa/engine/device/WebViewImpl;)V

    return-object v0
.end method
