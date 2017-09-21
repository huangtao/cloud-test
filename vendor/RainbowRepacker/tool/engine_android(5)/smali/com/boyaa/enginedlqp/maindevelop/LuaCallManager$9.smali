.class Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$9;
.super Ljava/lang/Object;
.source "LuaCallManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->videoCloseMicrophone()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$9;->this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    .line 596
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 601
    invoke-static {}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->getInstance()Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->closeMicrophone()V

    .line 602
    return-void
.end method
