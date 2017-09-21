.class Lcom/boyaa/entity/godsdk/GodSDKHelper$6;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/SpecialMethodListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;->AlipaySimpleCheckAccount(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$6;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/util/Map;)V
    .locals 0
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "arg1"    # Ljava/util/Map;

    .prologue
    .line 138
    return-void
.end method

.method public onCallSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/util/Map;)V
    .locals 4
    .param p1, "arg0"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "map"    # Ljava/util/Map;

    .prologue
    .line 123
    :try_start_0
    const-string v2, "result"

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 124
    .local v0, "result":Z
    if-eqz v0, :cond_0

    const-string v1, "1"

    .line 125
    .local v1, "ret":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v3, Lcom/boyaa/entity/godsdk/GodSDKHelper$6$1;

    invoke-direct {v3, p0, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper$6$1;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper$6;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 133
    .end local v0    # "result":Z
    .end local v1    # "ret":Ljava/lang/String;
    :goto_1
    return-void

    .line 124
    .restart local v0    # "result":Z
    :cond_0
    const-string v1, "0"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 131
    .end local v0    # "result":Z
    :catch_0
    move-exception v2

    goto :goto_1
.end method
