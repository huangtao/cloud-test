.class Lcom/boyaa/engine/device/WebViewImpl$4;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl;->setVisible(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

.field private final synthetic val$_visible:Z


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$4;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iput-boolean p2, p0, Lcom/boyaa/engine/device/WebViewImpl$4;->val$_visible:Z

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 445
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$4;->val$_param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget-object v1, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget-boolean v0, p0, Lcom/boyaa/engine/device/WebViewImpl$4;->val$_visible:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 446
    return-void

    .line 445
    :cond_0
    const/4 v0, 0x4

    goto :goto_0
.end method
