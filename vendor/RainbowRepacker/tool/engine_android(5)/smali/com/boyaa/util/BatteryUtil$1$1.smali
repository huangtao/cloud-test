.class Lcom/boyaa/util/BatteryUtil$1$1;
.super Ljava/lang/Object;
.source "BatteryUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/BatteryUtil$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/util/BatteryUtil$1;


# direct methods
.method constructor <init>(Lcom/boyaa/util/BatteryUtil$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/util/BatteryUtil$1$1;->this$1:Lcom/boyaa/util/BatteryUtil$1;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 45
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 46
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "Level"

    # getter for: Lcom/boyaa/util/BatteryUtil;->level:I
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->access$1()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 48
    .local v0, "json":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "ret":Ljava/lang/String;
    const-string v3, "Battery"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u5269\u4f59\u7535\u91cf\u7535\u91cf\u4e3a---------"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # getter for: Lcom/boyaa/util/BatteryUtil;->level:I
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->access$1()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "strDicName:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    # getter for: Lcom/boyaa/util/BatteryUtil;->strDicName:Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->access$2()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    # getter for: Lcom/boyaa/util/BatteryUtil;->strDicName:Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/util/BatteryUtil;->access$2()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    return-void
.end method
