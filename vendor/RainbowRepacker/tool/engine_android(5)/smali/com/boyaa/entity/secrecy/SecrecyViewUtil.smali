.class public Lcom/boyaa/entity/secrecy/SecrecyViewUtil;
.super Ljava/lang/Object;
.source "SecrecyViewUtil.java"


# static fields
.field private static final FORWHAT_ABOUTUS:Ljava/lang/String; = "aboutus"

.field private static final FORWHAT_GAMEHELP:Ljava/lang/String; = "gamehelp"

.field public static mInstance:Lcom/boyaa/entity/secrecy/SecrecyViewUtil;


# instance fields
.field private forwhat:Ljava/lang/String;

.field private height:I

.field private htmlFileName:Ljava/lang/String;

.field private htmlstr:Ljava/lang/String;

.field private mScreenHeight:I

.field private mScreenWidth:I

.field private mWebView:Landroid/webkit/WebView;

.field private width:I

.field private x:I

.field private y:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/secrecy/SecrecyViewUtil;
    .locals 1

    .prologue
    .line 47
    sget-object v0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mInstance:Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    invoke-direct {v0}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;-><init>()V

    sput-object v0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mInstance:Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    .line 50
    :cond_0
    sget-object v0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mInstance:Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    return-object v0
.end method

.method private initView()V
    .locals 15

    .prologue
    const/4 v14, 0x1

    const/4 v13, 0x0

    const/4 v12, -0x1

    .line 82
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    if-nez v7, :cond_1

    .line 83
    new-instance v1, Landroid/widget/RelativeLayout;

    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-direct {v1, v7}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 84
    .local v1, "layout":Landroid/widget/RelativeLayout;
    new-instance v7, Lcom/boyaa/entity/secrecy/SecrecyViewUtil$1;

    sget-object v8, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-direct {v7, p0, v8}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil$1;-><init>(Lcom/boyaa/entity/secrecy/SecrecyViewUtil;Landroid/content/Context;)V

    iput-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    .line 96
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v7

    const-string v8, "utf-8"

    invoke-virtual {v7, v8}, Landroid/webkit/WebSettings;->setDefaultTextEncodingName(Ljava/lang/String;)V

    .line 97
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v13}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 100
    :try_start_0
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "setOverScrollMode"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 101
    .local v3, "method":Ljava/lang/reflect/Method;
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v3, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 107
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :goto_0
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v12, v12}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v7, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    iget v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->x:I

    iget v8, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->y:I

    iget v9, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mScreenWidth:I

    iget v10, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->width:I

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->x:I

    sub-int/2addr v9, v10

    iget v10, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mScreenHeight:I

    iget v11, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->height:I

    sub-int/2addr v10, v11

    iget v11, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->y:I

    sub-int/2addr v10, v11

    invoke-virtual {v1, v7, v8, v9, v10}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 109
    new-instance v4, Landroid/widget/RelativeLayout;

    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-direct {v4, v7}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 110
    .local v4, "outerLayout":Landroid/widget/RelativeLayout;
    invoke-virtual {v4, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 112
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 115
    .local v2, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v7, v4, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .end local v1    # "layout":Landroid/widget/RelativeLayout;
    .end local v2    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v4    # "outerLayout":Landroid/widget/RelativeLayout;
    :goto_1
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v13}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 120
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v5

    .line 121
    .local v5, "setting":Landroid/webkit/WebSettings;
    invoke-virtual {v5, v14}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 122
    const-string v6, ""

    .line 124
    .local v6, "url":Ljava/lang/String;
    const-string v7, "aboutus"

    iget-object v8, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->forwhat:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 125
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "file:///android_asset/html/about/"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->htmlFileName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".html"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 129
    :goto_2
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->htmlFileName:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 131
    const-string v7, "cmlanche"

    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    iget-object v7, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v7, v6}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 134
    :cond_0
    return-void

    .line 102
    .end local v5    # "setting":Landroid/webkit/WebSettings;
    .end local v6    # "url":Ljava/lang/String;
    .restart local v1    # "layout":Landroid/widget/RelativeLayout;
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_0

    .line 104
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 117
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "layout":Landroid/widget/RelativeLayout;
    :cond_1
    invoke-virtual {p0}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->clearData()V

    goto :goto_1

    .line 127
    .restart local v5    # "setting":Landroid/webkit/WebSettings;
    .restart local v6    # "url":Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "file:///android_asset/html/help/"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->htmlFileName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".html"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_2
.end method


# virtual methods
.method public clearData()V
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->removeAllViews()V

    .line 140
    :cond_0
    return-void
.end method

.method public delView()V
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 152
    iget-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 154
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    .line 155
    return-void
.end method

.method public hideWebView()V
    .locals 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mWebView:Landroid/webkit/WebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 147
    :cond_0
    return-void
.end method

.method public init(Ljava/lang/String;)V
    .locals 1
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 54
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {p0, v0}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->initScreen(Lcom/boyaa/engine/made/AppActivity;)V

    .line 55
    invoke-virtual {p0, p1}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->initData(Ljava/lang/String;)V

    .line 56
    invoke-direct {p0}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->initView()V

    .line 57
    return-void
.end method

.method public initData(Ljava/lang/String;)V
    .locals 4
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 68
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v2, "x"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->x:I

    .line 70
    const-string v2, "y"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->y:I

    .line 71
    const-string v2, "w"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->width:I

    .line 72
    const-string v2, "h"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->height:I

    .line 73
    const-string v2, "html"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->htmlstr:Ljava/lang/String;

    .line 74
    const-string v2, "forwhat"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->forwhat:Ljava/lang/String;

    .line 75
    const-string v2, "htmlfileName"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->htmlFileName:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public initScreen(Lcom/boyaa/engine/made/AppActivity;)V
    .locals 2
    .param p1, "activity"    # Lcom/boyaa/engine/made/AppActivity;

    .prologue
    .line 60
    invoke-virtual {p1}, Lcom/boyaa/engine/made/AppActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 61
    .local v0, "display":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v1

    iput v1, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mScreenWidth:I

    .line 62
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->mScreenHeight:I

    .line 63
    return-void
.end method
