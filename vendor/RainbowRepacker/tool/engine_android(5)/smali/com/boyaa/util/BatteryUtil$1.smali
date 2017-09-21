.class Lcom/boyaa/util/BatteryUtil$1;
.super Landroid/content/BroadcastReceiver;
.source "BatteryUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/BatteryUtil;->register()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 33
    :try_start_0
    const-string v3, "level"

    const/4 v4, -0x1

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 34
    .local v1, "rawlevel":I
    const-string v3, "scale"

    const/4 v4, -0x1

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 36
    .local v2, "scale":I
    const/4 v3, -0x1

    invoke-static {v3}, Lcom/boyaa/util/BatteryUtil;->access$0(I)V

    .line 37
    if-ltz v1, :cond_0

    if-lez v2, :cond_0

    .line 39
    mul-int/lit8 v3, v1, 0x64

    div-int/2addr v3, v2

    invoke-static {v3}, Lcom/boyaa/util/BatteryUtil;->access$0(I)V

    .line 40
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v4, Lcom/boyaa/util/BatteryUtil$1$1;

    invoke-direct {v4, p0}, Lcom/boyaa/util/BatteryUtil$1$1;-><init>(Lcom/boyaa/util/BatteryUtil$1;)V

    invoke-virtual {v3, v4}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 61
    :goto_0
    # invokes: Lcom/boyaa/util/BatteryUtil;->unregister()V
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->access$3()V

    .line 65
    .end local v1    # "rawlevel":I
    .end local v2    # "scale":I
    :goto_1
    return-void

    .line 57
    .restart local v1    # "rawlevel":I
    .restart local v2    # "scale":I
    :cond_0
    const-string v3, "Battery"

    const-string v4, "\u83b7\u53d6\u7535\u91cf\u5931\u8d25."

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    # getter for: Lcom/boyaa/util/BatteryUtil;->strDicName:Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->access$2()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 62
    .end local v1    # "rawlevel":I
    .end local v2    # "scale":I
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
