.class Lcom/boyaa/engine/device/WebViewImpl$1;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl;->onWebViewEvent(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$cmd:I

.field private final synthetic val$id:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/boyaa/engine/device/WebViewImpl$1;->val$id:I

    iput p2, p0, Lcom/boyaa/engine/device/WebViewImpl$1;->val$cmd:I

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 46
    iget v0, p0, Lcom/boyaa/engine/device/WebViewImpl$1;->val$id:I

    iget v1, p0, Lcom/boyaa/engine/device/WebViewImpl$1;->val$cmd:I

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl;->nativeEvent(II)V

    .line 47
    return-void
.end method
