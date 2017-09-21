.class Lcom/boyaa/engine/device/WebViewImpl$2;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl;->onJsCall(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$_data:[B

.field private final synthetic val$id:I


# direct methods
.method constructor <init>(I[B)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/boyaa/engine/device/WebViewImpl$2;->val$id:I

    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$2;->val$_data:[B

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 56
    iget v0, p0, Lcom/boyaa/engine/device/WebViewImpl$2;->val$id:I

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$2;->val$_data:[B

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl;->nativeJsCall(I[B)V

    .line 57
    return-void
.end method
