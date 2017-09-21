.class Lcom/boyaa/engine/device/WebViewImpl$5;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl;->loadUrl(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

.field private final synthetic val$_url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$5;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$5;->val$_url:Ljava/lang/String;

    .line 455
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 459
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$5;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$5;->val$_url:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl;->_loadUrl(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;)V

    .line 460
    return-void
.end method
