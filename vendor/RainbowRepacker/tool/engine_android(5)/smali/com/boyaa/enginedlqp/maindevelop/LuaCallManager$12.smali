.class Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;
.super Ljava/lang/Object;
.source "LuaCallManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->videoLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

.field private final synthetic val$appId:I

.field private final synthetic val$roomId:I

.field private final synthetic val$support2G:I

.field private final synthetic val$userId:I

.field private final synthetic val$version:I


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;IIIII)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    iput p2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$support2G:I

    iput p3, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$appId:I

    iput p4, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$userId:I

    iput p5, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$roomId:I

    iput p6, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$version:I

    .line 640
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v4, 0x1

    .line 645
    iget v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$support2G:I

    if-ne v0, v4, :cond_0

    .line 646
    .local v4, "enable2G":Z
    :goto_0
    invoke-static {}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->getInstance()Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    move-result-object v0

    iget v1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$appId:I

    iget v2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$userId:I

    iget v3, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$roomId:I

    iget v5, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$12;->val$version:I

    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->login(IIIZI)V

    .line 647
    return-void

    .line 645
    .end local v4    # "enable2G":Z
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method
