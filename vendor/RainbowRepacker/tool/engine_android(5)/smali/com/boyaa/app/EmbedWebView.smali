.class public Lcom/boyaa/app/EmbedWebView;
.super Ljava/lang/Object;
.source "EmbedWebView.java"


# static fields
.field public static STATE_ERROR:I

.field public static STATE_FINISHED:I

.field public static boyaaSchemes:Ljava/lang/String;

.field public static instance:Lcom/boyaa/app/EmbedWebView;

.field public static mScreenHeight:I

.field public static mScreenWidth:I

.field private static mWebView:Landroid/webkit/WebView;


# instance fields
.field flag:Z

.field isNeedLoading:I

.field private mInnerlayout:Landroid/widget/FrameLayout;

.field mLoadingView:Landroid/view/View;

.field private mWebHanlder:Lcom/boyaa/app/WebHanlder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    new-instance v0, Lcom/boyaa/app/EmbedWebView;

    invoke-direct {v0}, Lcom/boyaa/app/EmbedWebView;-><init>()V

    sput-object v0, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    .line 58
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    .line 62
    const-string v0, "boyaa://ddz/"

    sput-object v0, Lcom/boyaa/app/EmbedWebView;->boyaaSchemes:Ljava/lang/String;

    .line 63
    const/4 v0, 0x1

    sput v0, Lcom/boyaa/app/EmbedWebView;->STATE_FINISHED:I

    .line 64
    const/4 v0, 0x2

    sput v0, Lcom/boyaa/app/EmbedWebView;->STATE_ERROR:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {p0, v0}, Lcom/boyaa/app/EmbedWebView;->init(Lcom/boyaa/engine/made/AppActivity;)V

    .line 71
    return-void
.end method

.method static synthetic access$0()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method private regetScreenSize(Lcom/boyaa/engine/made/AppActivity;)V
    .locals 2
    .param p1, "activity"    # Lcom/boyaa/engine/made/AppActivity;

    .prologue
    .line 81
    invoke-virtual {p1}, Lcom/boyaa/engine/made/AppActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 82
    .local v0, "display":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v1

    sput v1, Lcom/boyaa/app/EmbedWebView;->mScreenWidth:I

    .line 83
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v1

    sput v1, Lcom/boyaa/app/EmbedWebView;->mScreenHeight:I

    .line 84
    return-void
.end method

.method public static setLayerType(Landroid/webkit/WebView;)V
    .locals 7
    .param p0, "webView"    # Landroid/webkit/WebView;

    .prologue
    .line 316
    :try_start_0
    const-class v2, Landroid/webkit/WebView;

    const-string v3, "setLayerType"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Landroid/graphics/Paint;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 317
    .local v1, "method":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_0

    .line 318
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 322
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_0
    :goto_0
    return-void

    .line 319
    :catch_0
    move-exception v0

    .line 320
    .local v0, "e2":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public canGoBackWebView()Z
    .locals 1

    .prologue
    .line 353
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public changeWebViewPosAndSize(IIII)V
    .locals 3
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    const/4 v2, 0x0

    .line 309
    const-string v0, "changeWebViewPosAndSize"

    const-string v1, "Jonathan: changeWebViewPosAndSize"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1, p2, v2, v2}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 312
    return-void
.end method

.method public deeplink(Ljava/lang/String;)Z
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 297
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 298
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 300
    :try_start_0
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v2, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 301
    const/4 v2, 0x1

    .line 303
    :goto_0
    return v2

    .line 302
    :catch_0
    move-exception v0

    .line 303
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public delView(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 325
    const-string v0, "Emweb"

    const-string v1, "delView"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    invoke-virtual {p0}, Lcom/boyaa/app/EmbedWebView;->hideLoading()V

    .line 327
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 328
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 329
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 330
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 332
    :cond_0
    sput-object v2, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    .line 333
    iput-object v2, p0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    .line 334
    return-void
.end method

.method public getWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 436
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method public goBackWebView()V
    .locals 2

    .prologue
    .line 357
    invoke-virtual {p0}, Lcom/boyaa/app/EmbedWebView;->canGoBackWebView()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 358
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 359
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/app/EmbedWebView;->flag:Z

    .line 363
    :goto_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/app/EmbedWebView$4;

    invoke-direct {v1, p0}, Lcom/boyaa/app/EmbedWebView$4;-><init>(Lcom/boyaa/app/EmbedWebView;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 375
    return-void

    .line 361
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/app/EmbedWebView;->flag:Z

    goto :goto_0
.end method

.method public hideLoading()V
    .locals 2

    .prologue
    .line 429
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 430
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 432
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    .line 433
    return-void
.end method

.method public hideView()V
    .locals 2

    .prologue
    .line 385
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 386
    const-string v0, "Emweb"

    const-string v1, "hide"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 389
    :cond_0
    return-void
.end method

.method public init(Lcom/boyaa/engine/made/AppActivity;)V
    .locals 1
    .param p1, "activity"    # Lcom/boyaa/engine/made/AppActivity;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/boyaa/app/EmbedWebView;->regetScreenSize(Lcom/boyaa/engine/made/AppActivity;)V

    .line 77
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    .line 78
    return-void
.end method

.method public newWebView(Ljava/lang/String;)V
    .locals 32
    .param p1, "data"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    .line 88
    sget-object v27, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/boyaa/app/EmbedWebView;->regetScreenSize(Lcom/boyaa/engine/made/AppActivity;)V

    .line 90
    const/4 v13, 0x0

    .line 97
    .local v13, "jsonResult":Lorg/json/JSONObject;
    :try_start_0
    new-instance v14, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_4

    .line 98
    .end local v13    # "jsonResult":Lorg/json/JSONObject;
    .local v14, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v27, "x"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v25

    .line 99
    .local v25, "x":I
    const-string v27, "y"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v26

    .line 100
    .local v26, "y":I
    const-string v27, "w"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v24

    .line 101
    .local v24, "width":I
    const-string v27, "h"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    .line 102
    .local v12, "height":I
    const-string v27, "bx"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    .line 103
    .local v9, "btnX":I
    const-string v27, "by"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    .line 104
    .local v10, "btnY":I
    const-string v27, "bw"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 105
    .local v8, "btnW":I
    const-string v27, "bh"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 106
    .local v7, "btnH":I
    const-string v27, "url"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 107
    .local v23, "url":Ljava/lang/String;
    const-string v27, "tip"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 108
    .local v22, "tip":Ljava/lang/String;
    const-string v27, "mid"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    .line 109
    .local v18, "mid":I
    const-string v27, "money"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v19

    .line 111
    .local v19, "money":J
    :try_start_2
    const-string v27, "isNeedLoading"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v27

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/boyaa/app/EmbedWebView;->isNeedLoading:I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 121
    :goto_0
    new-instance v27, Lcom/boyaa/app/EmbedWebView$1;

    sget-object v28, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lcom/boyaa/app/EmbedWebView$1;-><init>(Lcom/boyaa/app/EmbedWebView;Landroid/content/Context;)V

    sput-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    .line 148
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v27

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 149
    sget-object v27, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual/range {v27 .. v27}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v27

    const-string v28, "cache"

    const/16 v29, 0x0

    invoke-virtual/range {v27 .. v29}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 150
    .local v5, "appCacheDir":Ljava/lang/String;
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 151
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v27

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 152
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v27

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 153
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v27

    const/16 v28, -0x1

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 155
    new-instance v27, Landroid/widget/FrameLayout;

    sget-object v28, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-direct/range {v27 .. v28}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    .line 156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    move-object/from16 v27, v0

    sget-object v28, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    new-instance v29, Landroid/view/ViewGroup$LayoutParams;

    const/16 v30, -0x1

    const/16 v31, -0x1

    invoke-direct/range {v29 .. v31}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual/range {v27 .. v29}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    new-instance v6, Landroid/widget/ImageButton;

    sget-object v27, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    move-object/from16 v0, v27

    invoke-direct {v6, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 159
    .local v6, "btn":Landroid/widget/ImageButton;
    new-instance v16, Landroid/widget/FrameLayout$LayoutParams;

    move-object/from16 v0, v16

    invoke-direct {v0, v8, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 160
    .local v16, "lpBtn":Landroid/widget/FrameLayout$LayoutParams;
    move-object/from16 v0, v16

    iput v9, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 161
    move-object/from16 v0, v16

    iput v10, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 164
    const/high16 v27, 0x7f020000

    move/from16 v0, v27

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v16

    invoke-virtual {v0, v6, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance v27, Lcom/boyaa/app/EmbedWebView$2;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/boyaa/app/EmbedWebView$2;-><init>(Lcom/boyaa/app/EmbedWebView;)V

    move-object/from16 v0, v27

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    move-object/from16 v27, v0

    sget v28, Lcom/boyaa/app/EmbedWebView;->mScreenWidth:I

    sub-int v28, v28, v24

    sub-int v28, v28, v25

    sget v29, Lcom/boyaa/app/EmbedWebView;->mScreenHeight:I

    sub-int v29, v29, v12

    sub-int v29, v29, v26

    move-object/from16 v0, v27

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 178
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v27, -0x1

    const/16 v28, -0x1

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-direct {v15, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 179
    .local v15, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    sget-object v27, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mInnerlayout:Landroid/widget/FrameLayout;

    move-object/from16 v28, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v15}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 181
    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/app/EmbedWebView;->isNeedLoading:I

    move/from16 v27, v0

    const/16 v28, 0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_0

    .line 182
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->showLoading(Ljava/lang/String;)V

    .line 184
    :cond_0
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/16 v28, 0x0

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 186
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/16 v28, 0x0

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 189
    :try_start_3
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v27

    const-string v28, "setOverScrollMode"

    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    sget-object v31, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v31, v29, v30

    invoke-virtual/range {v27 .. v29}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v17

    .line 190
    .local v17, "method":Ljava/lang/reflect/Method;
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x2

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    aput-object v30, v28, v29

    move-object/from16 v0, v17

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 197
    .end local v17    # "method":Ljava/lang/reflect/Method;
    :goto_1
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v21

    .line 198
    .local v21, "setting":Landroid/webkit/WebSettings;
    const/16 v27, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 199
    const/16 v27, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 200
    const/16 v27, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 202
    sget-object v27, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static/range {v27 .. v27}, Lcom/boyaa/util/NetworkUtil;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v27

    if-eqz v27, :cond_2

    .line 203
    const/16 v27, -0x1

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 207
    :goto_2
    const/16 v27, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 208
    const/16 v27, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 209
    sget-object v27, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    move-object/from16 v0, v21

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 214
    new-instance v27, Lcom/boyaa/app/WebHanlder;

    sget-object v28, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/boyaa/app/WebHanlder;-><init>(Landroid/content/Context;Lcom/boyaa/app/EmbedWebView;)V

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/boyaa/app/EmbedWebView;->mWebHanlder:Lcom/boyaa/app/WebHanlder;

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mWebHanlder:Lcom/boyaa/app/WebHanlder;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/boyaa/app/WebHanlder;->setMid(I)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mWebHanlder:Lcom/boyaa/app/WebHanlder;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/WebHanlder;->setMoney(J)V

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mWebHanlder:Lcom/boyaa/app/WebHanlder;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/boyaa/app/WebHanlder;->addJSInterface()V

    .line 218
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    new-instance v28, Lcom/boyaa/app/EmbedWebView$3;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/boyaa/app/EmbedWebView$3;-><init>(Lcom/boyaa/app/EmbedWebView;)V

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 289
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    new-instance v28, Landroid/webkit/WebChromeClient;

    invoke-direct/range {v28 .. v28}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 290
    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/app/EmbedWebView;->isNeedLoading:I

    move/from16 v27, v0

    const/16 v28, 0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_1

    .line 291
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/16 v28, 0x0

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 292
    :cond_1
    const-string v27, "wanpg"

    new-instance v28, Ljava/lang/StringBuilder;

    const-string v29, "\u7f51\u6d3b\u52a8\u98751\uff1a"

    invoke-direct/range {v28 .. v29}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    sget-object v27, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    move-object/from16 v0, v27

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    move-object v13, v14

    .line 294
    .end local v5    # "appCacheDir":Ljava/lang/String;
    .end local v6    # "btn":Landroid/widget/ImageButton;
    .end local v7    # "btnH":I
    .end local v8    # "btnW":I
    .end local v9    # "btnX":I
    .end local v10    # "btnY":I
    .end local v12    # "height":I
    .end local v14    # "jsonResult":Lorg/json/JSONObject;
    .end local v15    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "lpBtn":Landroid/widget/FrameLayout$LayoutParams;
    .end local v18    # "mid":I
    .end local v19    # "money":J
    .end local v21    # "setting":Landroid/webkit/WebSettings;
    .end local v22    # "tip":Ljava/lang/String;
    .end local v23    # "url":Ljava/lang/String;
    .end local v24    # "width":I
    .end local v25    # "x":I
    .end local v26    # "y":I
    .restart local v13    # "jsonResult":Lorg/json/JSONObject;
    :goto_3
    return-void

    .line 112
    .end local v13    # "jsonResult":Lorg/json/JSONObject;
    .restart local v7    # "btnH":I
    .restart local v8    # "btnW":I
    .restart local v9    # "btnX":I
    .restart local v10    # "btnY":I
    .restart local v12    # "height":I
    .restart local v14    # "jsonResult":Lorg/json/JSONObject;
    .restart local v18    # "mid":I
    .restart local v19    # "money":J
    .restart local v22    # "tip":Ljava/lang/String;
    .restart local v23    # "url":Ljava/lang/String;
    .restart local v24    # "width":I
    .restart local v25    # "x":I
    .restart local v26    # "y":I
    :catch_0
    move-exception v11

    .line 113
    .local v11, "e":Lorg/json/JSONException;
    :try_start_4
    invoke-virtual {v11}, Lorg/json/JSONException;->printStackTrace()V

    .line 114
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/boyaa/app/EmbedWebView;->isNeedLoading:I
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 117
    .end local v7    # "btnH":I
    .end local v8    # "btnW":I
    .end local v9    # "btnX":I
    .end local v10    # "btnY":I
    .end local v11    # "e":Lorg/json/JSONException;
    .end local v12    # "height":I
    .end local v18    # "mid":I
    .end local v19    # "money":J
    .end local v22    # "tip":Ljava/lang/String;
    .end local v23    # "url":Ljava/lang/String;
    .end local v24    # "width":I
    .end local v25    # "x":I
    .end local v26    # "y":I
    :catch_1
    move-exception v11

    move-object v13, v14

    .line 118
    .end local v14    # "jsonResult":Lorg/json/JSONObject;
    .restart local v11    # "e":Lorg/json/JSONException;
    .restart local v13    # "jsonResult":Lorg/json/JSONObject;
    :goto_4
    invoke-virtual {v11}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .line 191
    .end local v11    # "e":Lorg/json/JSONException;
    .end local v13    # "jsonResult":Lorg/json/JSONObject;
    .restart local v5    # "appCacheDir":Ljava/lang/String;
    .restart local v6    # "btn":Landroid/widget/ImageButton;
    .restart local v7    # "btnH":I
    .restart local v8    # "btnW":I
    .restart local v9    # "btnX":I
    .restart local v10    # "btnY":I
    .restart local v12    # "height":I
    .restart local v14    # "jsonResult":Lorg/json/JSONObject;
    .restart local v15    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v16    # "lpBtn":Landroid/widget/FrameLayout$LayoutParams;
    .restart local v18    # "mid":I
    .restart local v19    # "money":J
    .restart local v22    # "tip":Ljava/lang/String;
    .restart local v23    # "url":Ljava/lang/String;
    .restart local v24    # "width":I
    .restart local v25    # "x":I
    .restart local v26    # "y":I
    :catch_2
    move-exception v11

    .line 192
    .local v11, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v11}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto/16 :goto_1

    .line 193
    .end local v11    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v11

    .line 194
    .local v11, "e":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 205
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v21    # "setting":Landroid/webkit/WebSettings;
    :cond_2
    const/16 v27, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    goto/16 :goto_2

    .line 117
    .end local v5    # "appCacheDir":Ljava/lang/String;
    .end local v6    # "btn":Landroid/widget/ImageButton;
    .end local v7    # "btnH":I
    .end local v8    # "btnW":I
    .end local v9    # "btnX":I
    .end local v10    # "btnY":I
    .end local v12    # "height":I
    .end local v14    # "jsonResult":Lorg/json/JSONObject;
    .end local v15    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "lpBtn":Landroid/widget/FrameLayout$LayoutParams;
    .end local v18    # "mid":I
    .end local v19    # "money":J
    .end local v21    # "setting":Landroid/webkit/WebSettings;
    .end local v22    # "tip":Ljava/lang/String;
    .end local v23    # "url":Ljava/lang/String;
    .end local v24    # "width":I
    .end local v25    # "x":I
    .end local v26    # "y":I
    .restart local v13    # "jsonResult":Lorg/json/JSONObject;
    :catch_4
    move-exception v11

    goto :goto_4
.end method

.method public setWebState(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 441
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/app/EmbedWebView$5;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/app/EmbedWebView$5;-><init>(Lcom/boyaa/app/EmbedWebView;I)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 451
    return-void
.end method

.method public setWebViewUrl(Ljava/lang/String;)V
    .locals 6
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 337
    const/4 v1, 0x0

    .line 338
    .local v1, "jsonResult":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 340
    .local v3, "url":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .local v2, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v4, "url"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    move-object v1, v2

    .line 346
    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    sget-object v4, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    if-nez v4, :cond_0

    .line 350
    :goto_1
    return-void

    .line 342
    :catch_0
    move-exception v0

    .line 343
    .local v0, "e":Lorg/json/JSONException;
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 348
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    sget-object v4, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 349
    sget-object v4, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_1

    .line 342
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .restart local v2    # "jsonResult":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    goto :goto_2
.end method

.method public showLoading(Ljava/lang/String;)V
    .locals 22
    .param p1, "tip"    # Ljava/lang/String;

    .prologue
    .line 392
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    move-object/from16 v19, v0

    if-eqz v19, :cond_0

    .line 426
    :goto_0
    return-void

    .line 395
    :cond_0
    new-instance v16, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v19, -0x1

    const/16 v20, -0x1

    move-object/from16 v0, v16

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 396
    .local v16, "textLp":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v19, 0xd

    const/16 v20, -0x1

    move-object/from16 v0, v16

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 398
    sget-object v19, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static/range {v19 .. v19}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v11

    .line 399
    .local v11, "inflater":Landroid/view/LayoutInflater;
    const v19, 0x7f030003

    const/16 v20, 0x0

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    .line 400
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f06001c

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    .line 401
    .local v15, "text":Landroid/widget/TextView;
    if-eqz p1, :cond_1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 402
    :cond_1
    const-string p1, "\u52a0\u8f7d\u4e2d"

    .line 403
    :cond_2
    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 404
    sget-object v19, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 406
    sget-object v19, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v20, "window"

    invoke-virtual/range {v19 .. v20}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/view/WindowManager;

    .line 407
    .local v18, "wm":Landroid/view/WindowManager;
    invoke-interface/range {v18 .. v18}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v10

    .line 408
    .local v10, "dis":Landroid/view/Display;
    invoke-virtual {v10}, Landroid/view/Display;->getHeight()I

    move-result v9

    .line 409
    .local v9, "curH":I
    mul-int/lit8 v19, v9, 0x38

    move/from16 v0, v19

    div-int/lit16 v4, v0, 0x320

    .line 410
    .local v4, "basePH":I
    mul-int/lit8 v19, v9, 0x20

    move/from16 v0, v19

    div-int/lit16 v3, v0, 0x320

    .line 411
    .local v3, "baseLM":I
    mul-int/lit8 v19, v9, 0x38

    move/from16 v0, v19

    div-int/lit16 v5, v0, 0x320

    .line 412
    .local v5, "baseRM":I
    mul-int/lit8 v19, v9, 0x10

    move/from16 v0, v19

    div-int/lit16 v6, v0, 0x320

    .line 413
    .local v6, "baseTM":I
    mul-int/lit8 v19, v9, 0x20

    move/from16 v0, v19

    div-int/lit16 v8, v0, 0x320

    .line 414
    .local v8, "baseTextS":I
    mul-int/lit8 v19, v9, 0x28

    move/from16 v0, v19

    div-int/lit16 v7, v0, 0x320

    .line 416
    .local v7, "baseTML":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f06001a

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    .line 417
    .local v17, "v":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/app/EmbedWebView;->mLoadingView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f06001b

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/ProgressBar;

    .line 418
    .local v14, "pb":Landroid/widget/ProgressBar;
    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v6, v5, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 419
    invoke-virtual {v14}, Landroid/widget/ProgressBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout$LayoutParams;

    .line 420
    .local v12, "lp":Landroid/widget/LinearLayout$LayoutParams;
    iput v4, v12, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 421
    iput v4, v12, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 422
    invoke-virtual {v14, v12}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 423
    invoke-virtual {v15}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroid/widget/LinearLayout$LayoutParams;

    .line 424
    .local v13, "lp1":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v13, v7, v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 425
    const/16 v19, 0x0

    int-to-float v0, v8

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    goto/16 :goto_0
.end method

.method public showView()V
    .locals 2

    .prologue
    .line 378
    const-string v0, "Emweb"

    const-string v1, "showView"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 380
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 382
    :cond_0
    return-void
.end method
