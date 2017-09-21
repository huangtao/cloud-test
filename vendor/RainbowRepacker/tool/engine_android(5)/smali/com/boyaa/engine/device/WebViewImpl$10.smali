.class Lcom/boyaa/engine/device/WebViewImpl$10;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl;->callJs(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$_data:Ljava/lang/String;

.field private final synthetic val$_func:Ljava/lang/String;

.field private final synthetic val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$10;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$10;->val$_func:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/engine/device/WebViewImpl$10;->val$_data:Ljava/lang/String;

    .line 623
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 626
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$10;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->jsObj:Lcom/boyaa/engine/device/WebViewImpl$JsInterface;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$10;->val$_func:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$10;->val$_data:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/engine/device/WebViewImpl$JsInterface;->callJs(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    return-void
.end method
