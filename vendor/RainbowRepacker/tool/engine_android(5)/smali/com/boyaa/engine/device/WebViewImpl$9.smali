.class Lcom/boyaa/engine/device/WebViewImpl$9;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl;->close(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$9;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .line 608
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 611
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$9;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingView:Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$9;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 612
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$9;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->buttonView:Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$9;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 613
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$9;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    invoke-virtual {v0}, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->destroyLayout()V

    .line 615
    return-void
.end method
