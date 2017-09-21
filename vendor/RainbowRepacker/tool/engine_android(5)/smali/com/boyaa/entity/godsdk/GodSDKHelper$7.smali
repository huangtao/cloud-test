.class Lcom/boyaa/entity/godsdk/GodSDKHelper$7;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;->payResultCallLua(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

.field private final synthetic val$ret:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$7;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    iput-object p2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$7;->val$ret:Ljava/lang/String;

    .line 439
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 442
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const-string v1, "payResult"

    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$7;->val$ret:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    return-void
.end method
