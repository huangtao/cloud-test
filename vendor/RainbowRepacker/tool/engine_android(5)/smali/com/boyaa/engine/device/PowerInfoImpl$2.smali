.class Lcom/boyaa/engine/device/PowerInfoImpl$2;
.super Landroid/content/BroadcastReceiver;
.source "PowerInfoImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/device/PowerInfoImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x1

    .line 48
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BATTERY_LOW"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    # invokes: Lcom/boyaa/engine/device/PowerInfoImpl;->onPowerEvent(IZ)V
    invoke-static {v2, v2}, Lcom/boyaa/engine/device/PowerInfoImpl;->access$0(IZ)V

    .line 52
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BATTERY_OKAY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 53
    const/4 v0, 0x0

    # invokes: Lcom/boyaa/engine/device/PowerInfoImpl;->onPowerEvent(IZ)V
    invoke-static {v2, v0}, Lcom/boyaa/engine/device/PowerInfoImpl;->access$0(IZ)V

    .line 55
    :cond_1
    return-void
.end method
