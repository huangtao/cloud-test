.class Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$5;
.super Ljava/lang/Object;
.source "LuaCallManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->imStartAudioPlay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

.field private final synthetic val$filePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$5;->this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    iput-object p2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$5;->val$filePath:Ljava/lang/String;

    .line 511
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 514
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$5;->val$filePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 516
    invoke-static {}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->getInstance()Lcom/boyaa/entity/imsdk/ImSDKHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$5;->val$filePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->startAudioPlay(Ljava/lang/String;)V

    .line 518
    :cond_0
    return-void
.end method
