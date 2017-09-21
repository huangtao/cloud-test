.class Lcom/boyaa/engine/device/WebViewImpl$6;
.super Landroid/webkit/WebView;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl;->_loadUrl(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastTime:J

.field private final synthetic val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 2
    .param p1, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .line 471
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 487
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->lastTime:J

    return-void
.end method


# virtual methods
.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 474
    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    .line 476
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    .line 477
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 478
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-boolean v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableBackOrForward:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-boolean v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableBackKey:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 479
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->goBack()V

    .line 480
    const/4 v1, 0x1

    .line 484
    .end local v0    # "v":Landroid/view/View;
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 491
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_1

    .line 492
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 493
    .local v0, "a":J
    iget-wide v2, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->lastTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    .line 494
    const/4 v2, 0x0

    .line 498
    .end local v0    # "a":J
    :goto_0
    return v2

    .line 496
    .restart local v0    # "a":J
    :cond_0
    iput-wide v0, p0, Lcom/boyaa/engine/device/WebViewImpl$6;->lastTime:J

    .line 498
    .end local v0    # "a":J
    :cond_1
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_0
.end method
