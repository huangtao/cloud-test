.class public Lcom/boyaa/engine/device/WebViewImpl$JsInterface;
.super Ljava/lang/Object;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/device/WebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "JsInterface"
.end annotation


# instance fields
.field private param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

.field final synthetic this$0:Lcom/boyaa/engine/device/WebViewImpl;


# direct methods
.method public constructor <init>(Lcom/boyaa/engine/device/WebViewImpl;Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 1
    .param p2, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->this$0:Lcom/boyaa/engine/device/WebViewImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .line 71
    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .line 72
    return-void
.end method


# virtual methods
.method public call(Ljava/lang/String;)V
    .locals 1
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->id:I

    # invokes: Lcom/boyaa/engine/device/WebViewImpl;->onJsCall(ILjava/lang/String;)V
    invoke-static {v0, p1}, Lcom/boyaa/engine/device/WebViewImpl;->access$0(ILjava/lang/String;)V

    .line 77
    return-void
.end method

.method public callJs(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "funcName"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 85
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 87
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 88
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "(\'\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "js":Ljava/lang/String;
    :goto_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_3

    .line 95
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 102
    .end local v0    # "js":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 90
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "js":Ljava/lang/String;
    goto :goto_0

    .line 99
    :cond_3
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, v1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public close()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->id:I

    const/4 v1, 0x2

    # invokes: Lcom/boyaa/engine/device/WebViewImpl;->onWebViewEvent(II)V
    invoke-static {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl;->access$1(II)V

    .line 82
    return-void
.end method

.method public inject()V
    .locals 5

    .prologue
    .line 105
    const-string v0, "function native_call(stringData){boyaa_webview.call(stringData);} function native_close(){boyaa_webview.close();}"

    .line 106
    .local v0, "js":Ljava/lang/String;
    const-string v1, "javascript:(function() {var parent = document.getElementsByTagName(\'head\').item(0);var script = document.createElement(\'script\');script.type = \'text/javascript\';script.innerHTML = \'function native_call(stringData){boyaa_webview.call(stringData);} function native_close(){boyaa_webview.close();}\';parent.appendChild(script);})()"

    .line 107
    .local v1, "url":Ljava/lang/String;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_0

    .line 109
    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v2, v2, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    const-string v3, "javascript:(function() {var parent = document.getElementsByTagName(\'head\').item(0);var script = document.createElement(\'script\');script.type = \'text/javascript\';script.innerHTML = \'function native_call(stringData){boyaa_webview.call(stringData);} function native_close(){boyaa_webview.close();}\';parent.appendChild(script);})()"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_0
    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v2, v2, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    const-string v3, "javascript:(function() {var parent = document.getElementsByTagName(\'head\').item(0);var script = document.createElement(\'script\');script.type = \'text/javascript\';script.innerHTML = \'function native_call(stringData){boyaa_webview.call(stringData);} function native_close(){boyaa_webview.close();}\';parent.appendChild(script);})()"

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method
