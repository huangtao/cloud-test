.class Lcom/boyaa/engine/device/WebViewImpl$7;
.super Landroid/webkit/WebViewClient;
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
.field private final synthetic val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

.field private final synthetic val$webview:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Landroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$webview:Landroid/webkit/WebView;

    .line 556
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 559
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 560
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-boolean v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableBackOrForward:Z

    if-nez v0, :cond_0

    .line 561
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 563
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->jsObj:Lcom/boyaa/engine/device/WebViewImpl$JsInterface;

    invoke-virtual {v0}, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->inject()V

    .line 564
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingView:Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 565
    invoke-virtual {p1}, Landroid/webkit/WebView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 566
    invoke-virtual {p1}, Landroid/webkit/WebView;->requestFocus()Z

    .line 568
    :cond_1
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->id:I

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/engine/device/WebViewImpl;->onWebViewEvent(II)V
    invoke-static {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl;->access$1(II)V

    .line 569
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 573
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 575
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 579
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingView:Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 580
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$7;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->id:I

    const/4 v1, 0x1

    # invokes: Lcom/boyaa/engine/device/WebViewImpl;->onWebViewEvent(II)V
    invoke-static {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl;->access$1(II)V

    .line 581
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 585
    const/4 v0, 0x0

    return v0
.end method
