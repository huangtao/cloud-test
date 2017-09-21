.class Lcom/boyaa/engine/device/NetworkInfoImpl$1;
.super Landroid/content/BroadcastReceiver;
.source "NetworkInfoImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/device/NetworkInfoImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 47
    invoke-static {}, Lcom/boyaa/engine/device/NetworkInfoImpl;->isNetworkConnected()Z

    move-result v0

    .line 48
    .local v0, "connectivity":Z
    if-eqz v0, :cond_0

    .line 49
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/boyaa/engine/device/NetworkInfoImpl;->onNetworkEvent(Z)V

    .line 53
    :goto_0
    return-void

    .line 51
    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/boyaa/engine/device/NetworkInfoImpl;->onNetworkEvent(Z)V

    goto :goto_0
.end method
