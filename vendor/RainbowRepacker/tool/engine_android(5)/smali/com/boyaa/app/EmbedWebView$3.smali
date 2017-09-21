.class Lcom/boyaa/app/EmbedWebView$3;
.super Landroid/webkit/WebViewClient;
.source "EmbedWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/EmbedWebView;->newWebView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/EmbedWebView;


# direct methods
.method constructor <init>(Lcom/boyaa/app/EmbedWebView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    .line 218
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onFormResubmission(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "dontResend"    # Landroid/os/Message;
    .param p3, "resend"    # Landroid/os/Message;

    .prologue
    .line 280
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 281
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 221
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v0}, Lcom/boyaa/app/EmbedWebView;->hideLoading()V

    .line 223
    invoke-virtual {p1}, Landroid/webkit/WebView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 224
    invoke-virtual {p1}, Landroid/webkit/WebView;->requestFocus()Z

    .line 225
    :cond_0
    const-string v0, "Emweb"

    const-string v1, "succes"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    sget v1, Lcom/boyaa/app/EmbedWebView;->STATE_FINISHED:I

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->setWebState(I)V

    .line 227
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 231
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 232
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    iget v0, v0, Lcom/boyaa/app/EmbedWebView;->isNeedLoading:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 233
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->showLoading(Ljava/lang/String;)V

    .line 234
    :cond_0
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 239
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v0}, Lcom/boyaa/app/EmbedWebView;->hideLoading()V

    .line 240
    # getter for: Lcom/boyaa/app/EmbedWebView;->mWebView:Landroid/webkit/WebView;
    invoke-static {}, Lcom/boyaa/app/EmbedWebView;->access$0()Landroid/webkit/WebView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 241
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v1, "\u8bf7\u6c42\u6d3b\u52a8\u5931\u8d25"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 242
    const-string v0, "Emweb"

    const-string v1, "error"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    sget v1, Lcom/boyaa/app/EmbedWebView;->STATE_ERROR:I

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->setWebState(I)V

    .line 244
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "handler"    # Landroid/webkit/SslErrorHandler;
    .param p3, "error"    # Landroid/net/http/SslError;

    .prologue
    .line 286
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

    .line 287
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 248
    const-string v2, "test"

    invoke-static {v2, p2}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    sget-object v2, Lcom/boyaa/app/EmbedWebView;->boyaaSchemes:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1

    .line 273
    :cond_0
    :goto_0
    return v1

    .line 253
    :cond_1
    const-string v2, "tel"

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    .line 261
    const-string v2, "mqqopensdkapi://"

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2

    .line 262
    iget-object v2, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v2, p2}, Lcom/boyaa/app/EmbedWebView;->deeplink(Ljava/lang/String;)Z

    move-result v0

    .line 263
    .local v0, "result":Z
    iget-object v2, p0, Lcom/boyaa/app/EmbedWebView$3;->this$0:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v2}, Lcom/boyaa/app/EmbedWebView;->goBackWebView()V

    .line 264
    if-nez v0, :cond_0

    .line 265
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v3, "\u672a\u5b89\u88c5QQ\u6216\u5b89\u88c5\u7684\u7248\u672c\u4e0d\u652f\u6301"

    invoke-static {v2, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 271
    .end local v0    # "result":Z
    :cond_2
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 273
    const/4 v1, 0x1

    goto :goto_0
.end method
