.class Lcom/boyaa/entity/godsdk/GodSDKHelper$11;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKSwitchAccountCallLuaBack(Ljava/lang/String;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

.field private final synthetic val$map:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$11;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    iput-object p2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$11;->val$map:Ljava/util/Map;

    .line 521
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 525
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const-string v1, "godsdkSDKSwitchAccount"

    new-instance v2, Lcom/boyaa/util/JsonUtil;

    iget-object v3, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$11;->val$map:Ljava/util/Map;

    invoke-direct {v2, v3}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    return-void
.end method
