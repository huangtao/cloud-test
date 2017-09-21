.class Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;
.super Ljava/lang/Object;
.source "LuaCallManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->requestGodSDKPay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

.field private final synthetic val$payParams:Ljava/lang/String;

.field private final synthetic val$pmode:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;->this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    iput-object p2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;->val$payParams:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;->val$pmode:Ljava/lang/String;

    .line 662
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 666
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;->val$payParams:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$13;->val$pmode:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->requestGodSDKPay(Ljava/lang/String;Ljava/lang/String;)V

    .line 667
    return-void
.end method
