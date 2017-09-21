.class Lcom/boyaa/entity/godsdk/GodSDKHelper$3;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/IAPListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;
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
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$3;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPayFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 3
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pmode"    # Ljava/lang/String;

    .prologue
    .line 280
    const-string v0, "gaojie"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "godSdk onPayFailed pmode = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " status = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    invoke-virtual {p1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->getSubStatus()I

    move-result v0

    const/16 v1, 0x4e84

    if-ne v0, v1, :cond_0

    .line 283
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$3;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const-string v1, "{\"ret\":1}"

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->payResultCallLua(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$6(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;)V

    .line 289
    :goto_0
    return-void

    .line 284
    :cond_0
    invoke-virtual {p1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->getSubStatus()I

    move-result v0

    const/16 v1, 0x4e85

    if-ne v0, v1, :cond_1

    .line 285
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$3;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const-string v1, "{\"ret\":2}"

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->payResultCallLua(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$6(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;)V

    goto :goto_0

    .line 287
    :cond_1
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$3;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const-string v1, "{\"ret\":1}"

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->payResultCallLua(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$6(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onPaySuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 6
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pmode"    # Ljava/lang/String;

    .prologue
    .line 261
    const-string v3, "gaojie"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "godSdk onPaySuccess pmode = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " status = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 265
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "ret"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    invoke-virtual {p1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->getExtras()Ljava/util/Map;

    move-result-object v2

    .line 267
    .local v2, "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v2, :cond_0

    .line 268
    const-string v3, "gaojie"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "godSdk onPaySuccessextras = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    invoke-interface {v0, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 271
    :cond_0
    iget-object v3, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$3;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    new-instance v4, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v4, v0}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v4

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->payResultCallLua(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$6(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    .end local v0    # "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 273
    :catch_0
    move-exception v1

    .line 274
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
